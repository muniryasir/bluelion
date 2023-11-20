from bs4 import BeautifulSoup
from django.shortcuts import render
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
import re 
from .models import cdp_Itinerary as Itinerary, cdp_Menu as Menu, cdp_Images as Images, cdp_Page as Page, cdp_Resturant as Resturant 
from .models import cdp_Page_Description as Page_Description, cdp_Page_Image_Order as Page_Image_Order, cdp_Map as Map
from .models import cdp_Shopping as Shopping, cdp_Bar as Bar, cdp_audios as audios, cdp_audio_page as audio_page
from .models import cdp_Burger_Menu_Ordering as Burger_Menu_Ordering, cdp_Lieu as Lieu,cdp_Toilets as Toilets,cdp_Page_Before_After_Image_Order as Page_Before_After_Image_Order  
from .models import cdp_ITINERARY_Color_Scheme as ITINERARY_Color_Scheme, cdp_ChildrenEntertainment as ChildrenEntertainment
from .models import cdp_Map_Controls as Map_Controls, cdp_transport as transport, cdp_opening_hours as opening_hours, cdp_tickets as tickets
from slugify import slugify
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.http import HttpResponse
import datetime
from django.views.generic import TemplateView
from django.conf import settings as djangoSettings
from django.db import connections
from collections import namedtuple
import pathlib
from pathlib import Path
import os
import requests 

app_name="commune_de_paris"
# Create your views here.

class ServiceWorkerView(TemplateView):
    template_name = 'commune_sw.js'
    content_type = 'application/javascript'
    name = 'commune_sw.js'

    def get_context_data(self, **kwargs):
        return {
            'version': version,
        }

class digitalAssetsLink(TemplateView):
    template_name = 'assetslinks.json'
    content_type = 'json'
    name = 'assetslinks.json'

    def get_context_data(self, **kwargs):
        return {
            'version': version,
        }

def home(request):
    page_title = "Parcours Commune de Paris"
    burger_menu = Burger_Menu_Ordering.objects.all().order_by('appearnce_order_in_burger_menu')

    page_introductions = []
    menu_introductions = []
    itin_itin = []
    menu_itin = []
    color_itin = []
   
    
    retrieve_typewise_itinerary_details(page_introductions,menu_introductions,itin_itin,menu_itin,color_itin)
    # home_menu_images = Menu.menu_images.all()
    page_menu_introductions = zip(page_introductions,menu_introductions)
    itin_menu = zip(itin_itin,menu_itin,color_itin)
    if request.session.get('itinerary'):
        del request.session['itinerary']
    request.session['itinerary'] = "home"
    
    context={
         'page_title':page_title,
         'burger_menu':burger_menu,
         'Itineraries':itin_menu,
         'Page_introductions':page_menu_introductions
     }
    if request.session.get('level'):
        del request.session['level']
    request.session['level'] = "home"    
    return render(request,'cdp_home_auto.html',context)



# def author(request):
#     page_title = "author"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'author.html',context)


@receiver(post_save, sender=Itinerary)
def admin_Itinerary_handler(sender, instance, **kwargs):
    # app_name="commune_de"
    if kwargs['created']: #make sure its a new record
        print(instance.itinerary_name)
    #print(sender.itinerary_name)
        if instance.itinerary_type == 'ITIN':
            link_str =  app_name+"/"+slugify(instance.itinerary_name) 
            if instance.is_visible_on_homepage == True: 
                menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Main'  )
                menu_object.save()
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Burger'  )
            menu_object.save()
        elif instance.itinerary_type == 'ITIN_INDEX':
            link_str =  app_name+"/"+slugify(instance.itinerary_name) 
            if instance.is_visible_on_homepage == True: 
                menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Main'  )
                menu_object.save()
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Burger'  )
            menu_object.save()
        elif instance.itinerary_type == 'ITIN_NAME_INDEX':
            link_str =  app_name+"/"+slugify(instance.itinerary_name) 
            if instance.is_visible_on_homepage == True: 
                menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Main'  )
                menu_object.save()
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Burger'  )
            menu_object.save()
        elif instance.itinerary_type == 'INTRO':
            link_str =  app_name+"/"+slugify(instance.itinerary_name) 
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Main'  )
            menu_object.save()
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Burger'  )
            menu_object.save()

    print('post save callback')

@receiver(pre_save, sender=Itinerary)
def admin_itinerary_handler_pre_save(sender, instance, **kwargs):
    # app_name="commune_de_paris"
    # if kwargs['created']: #make sure its a new record
    itinerary_instance = Itinerary.objects.filter(itinerary_id=instance.itinerary_id)
    if itinerary_instance.count() > 0:
        menu_obj = Menu.objects.filter(itinerary=instance, menu_title=itinerary_instance[0].itinerary_name)
        if menu_obj.count()>0:
            menu_obj.update(menu_title=instance.itinerary_name)

def itinerary_handler(request, itinerary_name):

    
    home_menu = Menu.objects.filter(menu_link__icontains=itinerary_name, menu_type='Burger')
    itinerary = Itinerary.objects.filter(itinerary_id=home_menu[0].itinerary.itinerary_id)
    burger_menu = Burger_Menu_Ordering.objects.all().order_by('appearnce_order_in_burger_menu')

    template = ""
    if itinerary[0].itinerary_type=='ITIN':
        
        context={}
        template = 'cdp_itinerary_template.html'
        context = regularItinerary(request, context, template, home_menu, itinerary, burger_menu)
    
    elif itinerary[0].itinerary_type=='ITIN_INDEX':
        
        context={}
        template = 'cdp_index_itinerary_template.html'
        context = indexItinerary(request, context, template, home_menu, itinerary, burger_menu)
    elif itinerary[0].itinerary_type=='ITIN_NAME_INDEX':
        
        context={}
        template = 'cdp_index_name_itinerary_template.html'
        context = indexNameItinerary(request, context, home_menu, itinerary, burger_menu)

    elif itinerary[0].itinerary_type=='INTRO':
        context={}
        template = 'cdp_introduction_template.html'
        context = regularIntroduction(request, context, template, home_menu, itinerary, burger_menu)
        

    if request.session.get('level'):
        del request.session['level']
    request.session['level'] = "home"
    return render(request,template,context)

@receiver(post_save, sender=Page)
def admin_page_handler(sender, instance, **kwargs):
    # app_name="commune_de_paris"
    if kwargs['created']: #make sure its a new record
        
    #print(sender.itinerary_name)
        if str(instance.page_type).casefold() != str('step_introduction').casefold() and str(instance.page_type).casefold() != str('step_introduction_index').casefold(): # on creation of step
            create_page_menu_entry(instance)
    
    if str(instance.page_type).casefold() != str('step').casefold() and instance.is_page_zero == True:
      page_instance = Page.objects.filter(page_id=instance.page_id)
      page_instance.update(page_order=0)                   


    

    # print('post save callback')

@receiver(pre_save, sender=Page)
def admin_page_handler_pre_save(sender, instance, **kwargs):
    
    # if kwargs['created']: #make sure its a new record
    page_instance = Page.objects.filter(page_id=instance.page_id)
    # print(page_instance[0].page_title)
    # print(instance.page_title)
    if page_instance.count() > 0:
        menu_obj = Menu.objects.filter(itinerary=instance.itinerary, menu_title=page_instance[0].page_title)
        if menu_obj.count()>0:
            # print('update page')
            menu_obj.update(menu_title=instance.page_title)
        elif str(instance.page_type).casefold() == str('step').casefold(): # on update from step_introduction to step
            create_page_menu_entry(instance)
            # print('create page')

# method creates menu entry for pages based on instance
def create_page_menu_entry(instance):
    link_str =  app_name+"/"+slugify(instance.itinerary.itinerary_name)+"/"+slugify(instance.page_title) 
    menu_object = Menu.objects.create(itinerary=instance.itinerary, menu_title=instance.page_title, menu_link=link_str,menu_type='Step'  )
    menu_object.save()

def step_handler(request, itinerary_name, step_name):

    # page_title = "link is - %s %s" % (appname, itinerary_name)
    menu_link = itinerary_name+"/"+step_name
    home_menu = Menu.objects.filter(menu_link__icontains=menu_link, menu_type__iexact='Step')
    itinerary = Itinerary.objects.filter(itinerary_id=home_menu[0].itinerary.itinerary_id)
    burger_menu = Burger_Menu_Ordering.objects.all().order_by('appearnce_order_in_burger_menu')
    print(itinerary[0].itinerary_type)
    if itinerary[0].itinerary_type=='ITIN':
    # print(home_menu[0].menu_title)
        context = {}
        template = 'cdp_step_main_auto.html'
        context = regularSteps(request,menu_link,home_menu,itinerary_name,itinerary,burger_menu)
    elif itinerary[0].itinerary_type=='ITIN_INDEX':
        context = {}
        template = 'cdp_index_step_main_auto.html'
        context = indexSteps(request,menu_link,home_menu,itinerary_name,itinerary,burger_menu)
    return render(request,template,context)
    # return render(request,'itinerary_template.html',context)

@csrf_exempt
def map_data(request):
    print(request.POST['context'])
    if request.session.get('itinerary') == 'home'  :
       map_data = Map.objects.all() 
    elif request.POST['context'] == 'home':
        map_data = Map.objects.all() 
    else:
        map_data = Map.objects.filter(itinerary=request.session.get('itinerary'))
    data = {
                           'map_data': '0'
                }
    map_str = ""
    for map_item in map_data:
        map_str = map_str + map_item.Page.page_title+"-t-"
        if  map_item.map_images == None:
            map_str = map_str + "NA-t-"
        else:    
            map_str += map_item.map_images.filename.url+"-t-"
        # map_str = map_str + map_item.lat+"-t-"
        # map_str = map_str + map_item.longt+"-t-"
        map_str = map_str + str(map_item.geo_coordinates)+"-t-"

        step_menu = Menu.objects.filter(menu_title=map_item.Page.page_title, menu_type__iexact='Step', itinerary=map_item.itinerary)
        if step_menu.count() > 0:
            map_str = map_str + step_menu[0].menu_link+"-t-"
            map_str = map_str + str(map_item.Page.page_order)+"-t-"
            itin_color =  ITINERARY_Color_Scheme.objects.filter(itinerary=step_menu[0].itinerary)
            map_str = map_str + itin_color[0].itinerary_colors +"-t-"
            
            map_str = map_str + "-M-"  
           
        else:    
            map_str = map_str +"NA"
            map_str = map_str + "-M-"
        
        
    

    data["map_data"]=map_str
    return JsonResponse(data)

@csrf_exempt
def map_data2(request):
    # print(request.POST['context'])
    # if request.session.get('itinerary') == 'home'  :
    #    map_data = Map.objects.all() 
    # elif request.POST['context'] == 'home':
    #     map_data = Map.objects.all() 
    # else:
    #     map_data = Map.objects.filter(itinerary=request.session.get('itinerary'))
    data = {  }
    master_dict = {}
    itins = Itinerary.objects.filter(itinerary_type__iexact='ITIN')
    for itin in itins:
        itin_colors = ITINERARY_Color_Scheme.objects.filter(itinerary=itin)
        for color in itin_colors:
            master_dict[color.itinerary_colors] = color.itinerary.itinerary_name
            itin_dict = {}
            # itin_dict["Itinerary_name"]=color.itinerary.itinerary_name
            
            step_pages_menus = retrieve_page_menu_by_order(color.itinerary)
            

            for spm in step_pages_menus:
                page_dict = {}
                map_page = Page.objects.filter(page_title__iexact = spm["menu_title"], is_page_zero=False)
                if map_page.count()>0:
                    page_dict["image"] = spm["filename"]
                    page_dict["page_title"] = spm["menu_title"]
                    page_dict["page_order"] = spm["page_order"]
                    page_dict["page_link"] = spm["menu_link"]
                    
                    page_map = Map.objects.filter(Page=map_page[0])
                    page_dict["lat"] = page_map[0].lat
                    page_dict["longt"] = page_map[0].longt
                    itin_dict["step"+str(spm["page_order"])]=page_dict

            # master_dict[color.itinerary.itinerary_steps] = itin_dict
            master_dict[color.itinerary_colors] = itin_dict

    # itin_dict["steps"]=page_dict
    # master_dict["itinerary"] = itin_dict
        
        
    

    # data["map_data"]=map_str
    return JsonResponse(master_dict)

@csrf_exempt
def get_map_controls(request):
    data = {}
    if request.session.get('page'):
        page = request.session.get('page')
    else:
        page = 'NA'
    if request.session.get('level'):
        level = request.session.get('level')
        # print(level)
        map_controls = Map_Controls.objects.all()
        itinerary=request.session.get('itinerary')

        print(itinerary)
        if itinerary=='home':
            map_controls = Map_Controls.objects.filter(itinerary__isnull=True)
        else:
            Itin = ITINERARY_Color_Scheme.objects.filter(itinerary_colors=itinerary)

            map_controls = Map_Controls.objects.filter(itinerary=Itin[0].itinerary)

        # level = 'step'
        map_center = map_controls[0].map_center
        if level == 'home':
            zoom = map_controls[0].zoom_for_home
        elif level == 'step':
            zoom = map_controls[0].pin_zoom 

        
        data = {
            'page': page,
            'zoom':zoom,
            'level':level,
            'map_center':map_center,
            
        }
        return JsonResponse(data) 
    
   

@csrf_exempt
def getcookie(request):  
    data = {
                'context': request.session.get('itinerary')
            }  
    return JsonResponse(data) 

@csrf_exempt
def setcookie(request):
    cookie_type = request.POST['cookie_type']
    is_allowed = request.POST['is_allowed']

    response = HttpResponse(cookie_type)
    if is_allowed == 'YES':
        max_age = 6*30*24*60*60 # six months
    elif is_allowed == 'NO':
        max_age = 14*24*60*60 # two weeks

    expires = datetime.datetime.strftime(datetime.datetime.utcnow() + datetime.timedelta(seconds=max_age), "%a, %d-%b-%Y %H:%M:%S GMT")

    response.set_cookie(cookie_type, is_allowed, max_age=max_age, expires=expires)
    # html.setcookie(cookie_type,is_allowed,max_age=None)
    return response

@csrf_exempt
def getregularcookie(request):
    cookie = request.POST['cookie']
    if cookie == 'cookie':
       cookie_value = request.COOKIES.get(cookie, 'SHOW')
    else:
        cookie_value = request.COOKIES.get(cookie)
    data = {
                'cookie_value': cookie_value
            }  
    return JsonResponse(data) 

# support Methods
def text_formating_for_images(page_description):
    page_txt = page_description.page_Text
    page_image_order = Page_Image_Order.objects.filter(page_description=page_description).order_by('appearnce_order')
    page_BA_image_order = Page_Before_After_Image_Order.objects.filter(page_description=page_description).order_by('appearnce_order_in_page')
    page_audio_page_order = audio_page.objects.filter(page_description=page_description).order_by('audio_appearnce_order')
    figure = '''<figure class="is-pulled-left image is-gallery-trigger" data-target="gallery-name-1 <-imgOrder->">
                    <img src="<-I->" class="is-clearfix" alt="">
                   <!-- <img src="/static/commune_de_paris/static/images/pages/steps/zoom-in-black.png"  style="all: initial; display: inline-block; width:10%; height:10%; float:right;" class="is-clearfix" alt="">-->

                    <figcaption><-C-></figcaption>
                    <input type="hidden" name="long_description" id="long_description" value="<-long_description->" >
                </figure>'''
    figureba = '''
                        <figure id="jssor_1" class="is-pulled-left image is-gallery-trigger" data-target="gallery-name-1 <-imgOrder->" >
                            <div class="wrapper_comparison_slider">
                                 <div class="js-comparison-container">
                                 <img class="comparison-image" src="<-I1->" alt="">
                                 <img class="comparison-image" src="<-I2->" alt="">
                                 </div>
                  </div>
                            <figcaption><-C-></figcaption>
                            <input type="hidden" name="long_description" id="long_description" value="<-long_description->" >
                        </figure>
                    '''
    figurevalue = []
    figurevalueba = []
    for image_order in page_image_order:
        newfigure = figure.replace("<-I->",image_order.page_image.filename.url)
        newfigure = newfigure.replace("<-C->",image_order.page_image.short_description)
        newfigure = newfigure.replace("<-imgOrder->",".img-"+str(image_order.appearnce_order+1))
        newfigure = newfigure.replace("<-long_description->",".img-"+image_order.page_image.long_description)
        figurevalue.append(newfigure)
    
    for image_order in page_BA_image_order:
        newfigureba = figureba.replace("<-I1->",image_order.page_image_before.filename.url)
        # print("image"+str(image_order.page_image_before))
        newfigureba = newfigureba.replace("<-I2->",image_order.page_image_after.filename.url)
        newfigureba = newfigureba.replace("<-C->",image_order.page_image_after.short_description)
        newfigureba = newfigureba.replace("<-imgOrder->",".img-"+str(image_order.appearnce_order_in_page+1))
        # newfigureba = newfigureba.replace("<-long_description->",".img-"+image_order.page_image_after.long_description)
        figurevalueba.append(newfigureba)
    page_txt_group_count = page_txt.count("<p>&lt;g")
    page_txt_img_count = page_txt.count("<p>&lt;")
    page_txt_audio_count = page_txt.count("-audio")
    
    # print(len(newfigure))
    divstart = '<div class="wrapper-content">'
    divend = '</div>'
    print(page_txt_group_count)
    
    for i in range(0,page_txt_group_count):
        page_txt = page_txt.replace("<p>&lt;gs"+str(i+1)+"&gt;</p>",divstart)
    
    for i in range(0,page_txt_group_count):
        page_txt = page_txt.replace("<p>&lt;ge"+str(i+1)+"&gt;</p>",divend)

    if len(figurevalue) > 0:
        for i in range(0, page_txt_img_count-page_txt_group_count): 
            page_txt = page_txt.replace("<p>&lt;"+str(i+1)+"&gt;</p>",figurevalue[i])
        # print(page_txt)
    page_txt_img_countba = page_txt.count("<p>&lt;ba")
    if len(figurevalueba) > 0:
        for i in range(0, page_txt_img_countba): 
            page_txt = page_txt.replace("<p>&lt;ba"+str(i+1)+"&gt;</p>",figurevalueba[i])
    
    audio_player = '''<div class="cta-icon-container">
                        <a class="audio-player-cta" data-track="MaPiste1" onclick="changeAudio('-A-')">
                            <img src="/static/commune_de_paris/static/images/Pictos_Big_Audio.svg" alt="">
                        </a>
                      </div>'''
    for i in range(len(page_audio_page_order)):
        audio_player_txt = audio_player.replace("-A-",page_audio_page_order[i].audio.audio_file.url)
        page_txt = page_txt.replace("-audio"+str(i+1)+"-",audio_player_txt)
        # page_txt = page_txt.replace("-audio"+str(i+1)+"-",page_audio_page_order[i].audio.audio_file.url)
        
    return page_txt

def retrieve_typewise_itinerary_details(page_introductions,menu_introductions,itin_itin,menu_itin,color_itin):
    # Itineraries = Itinerary.objects.all().order_by('itinerary_id')
    Itineraries = Itinerary.objects.filter(is_visible_on_homepage=True).order_by('itinerary_id')
    home_menu = Menu.objects.all().order_by('menu_id')
    home_main_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
    for itinerary in Itineraries:
        if (itinerary.itinerary_type == 'INTRO' or itinerary.itinerary_type == 'ITIN_INDEX') and itinerary.is_visible_on_homepage==True:
            
            if itinerary.itinerary_type == 'ITIN_INDEX':
                
                page = Page.objects.filter(itinerary=itinerary, page_title=itinerary.itinerary_name)
                page_introductions.append(page[0])
                introduction_menu = Menu.objects.filter(menu_type='Main', menu_title__iexact=itinerary.itinerary_name)
                menu_introductions.append(introduction_menu[0])
            else:
                page = Page.objects.filter(itinerary=itinerary, itinerary__is_visible_on_homepage=True)
                introduction_menu = Menu.objects.filter(menu_type='Main', menu_title__iexact=page[0].page_title, itinerary__is_visible_on_homepage=True)
                if introduction_menu.count()>0:
                    menu_introductions.append(introduction_menu[0])
                    page_introductions.append(page[0])    
                

        elif itinerary.itinerary_type == 'ITIN':
            
            itin_itin.append(itinerary)
            
            itin_menu = Menu.objects.filter(menu_type='Main', menu_title__iexact=itinerary.itinerary_name)
            # print(itin_menu[0].menu_images)
            menu_itin.append(itin_menu[0])
            itin_color =  ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary)
            color_itin.append(itin_color[0])

def retrieve_next_pages(count, next_pages, page,itin):
    for x in range(count):
        if x == 0:            
            qpage = page
        else:
            qpage = next_page[0]
        next_page = Page.objects.filter( itinerary=itin, page_type__icontains='step', page_order=qpage.page_order+1 )
        if next_page.count() > 0:
            next_page_menu = Menu.objects.filter(itinerary=itin, menu_title=next_page[0].page_title)
            next_page_menu_details = zip(next_page_menu,next_page)
        else:
            next_page_menu_details = "NA"
            break
        next_pages.append(next_page_menu_details)

def retrive_previous_page(page,itinerary):
    prev_page = Page.objects.filter( itinerary=itinerary[0], page_type__icontains='step', page_order=page[0].page_order-1 )
    
    # print("here"+str(next_page[0].page_title))
    if prev_page.count() > 0:
        prev_page_menu = Menu.objects.filter(itinerary=itinerary[0], menu_title=prev_page[0].page_title)
        prev_page_menu_details = zip(prev_page_menu,prev_page)
    else:
        prev_page_menu_details = "NA"
    return prev_page_menu_details

def retrieve_page_menu_by_order(itinenirary):
    with connections['CommunedeParisdb'].cursor() as cursor:
        cursor.execute("SELECT page_order, menu_title, menu_link, filename FROM commune_de_paris_cdp_menu, commune_de_paris_cdp_page,commune_de_paris_cdp_images WHERE commune_de_paris_cdp_menu.menu_title = commune_de_paris_cdp_page.page_title and (LOWER(commune_de_paris_cdp_menu.menu_type)='step' and LOWER(commune_de_paris_cdp_page.page_type)='step') and (commune_de_paris_cdp_menu.itinerary_id=commune_de_paris_cdp_page.itinerary_id and commune_de_paris_cdp_page.itinerary_id=%s) and commune_de_paris_cdp_menu.menu_images_id=commune_de_paris_cdp_images.image_id order by commune_de_paris_cdp_page.page_order asc",[itinenirary.itinerary_id])
        row = dictfetchall(cursor)
        # row = namedtuplefetchall(cursor)

    return row

def retrieve_index_page_menu_by_order(itinenirary):
    with connections['CommunedeParisdb'].cursor() as cursor:
        cursor.execute("SELECT page_order, menu_title, menu_link, filename FROM commune_de_paris_cdp_menu, commune_de_paris_cdp_page,commune_de_paris_cdp_images WHERE commune_de_paris_cdp_menu.menu_title = commune_de_paris_cdp_page.page_title and (LOWER(commune_de_paris_cdp_menu.menu_type)='step' and LOWER(commune_de_paris_cdp_page.page_type)='step_index') and (commune_de_paris_cdp_menu.itinerary_id=commune_de_paris_cdp_page.itinerary_id and commune_de_paris_cdp_page.itinerary_id=%s) and commune_de_paris_cdp_menu.menu_images_id=commune_de_paris_cdp_images.image_id order by commune_de_paris_cdp_page.page_order asc",[itinenirary.itinerary_id])
        row = dictfetchall(cursor)
        # row = namedtuplefetchall(cursor)

    return row

def retrieve_index_name_page_menu_by_order():
    with connections['CommunedeParisdb'].cursor() as cursor:
        cursor.execute('''SELECT  image_name, menu_title, menu_link, filename FROM commune_de_paris_cdp_page,commune_de_paris_cdp_images, commune_de_paris_cdp_menu WHERE commune_de_paris_cdp_menu.menu_title = commune_de_paris_cdp_page.page_title and (LOWER(commune_de_paris_cdp_menu.menu_type)='step' and LOWER(commune_de_paris_cdp_page.page_type)='step') and commune_de_paris_cdp_images.image_type = 'INDEX_IMAGE' and commune_de_paris_cdp_images."Page_id" = commune_de_paris_cdp_page.page_id order by commune_de_paris_cdp_images.image_name asc''')
        row = dictfetchall(cursor)
        # row = namedtuplefetchall(cursor)

    return row

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]
def namedtuplefetchall(cursor):
    "Return all rows from a cursor as a namedtuple"
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    return [nt_result(*row) for row in cursor.fetchall()]

# Itinerary methods

def regularItinerary(request, context, template, home_menu, itinerary, burger_menu):
    page = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step_introduction')
    step_menu = Menu.objects.filter(itinerary=itinerary[0], menu_type__iexact='Step').order_by('menu_id')
    step_pages = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step').order_by('page_order')
    step_pages_menus = retrieve_page_menu_by_order(itinerary[0])
    # print(str(step_pages_menus))
    # for spm in step_pages_menus:
    #     print("here"+str(spm))
        # print(str(spm.page_title))
    # step_menu_pages = Menu.objects.filter(itinerary=itinerary[0], menu_type__iexact='Step').select_related('Page').filter(Page__itinerary=itinerary[0], Page__page_type__iexact='step')
    step_menu_pages = zip(step_menu,step_pages)
    Itin_Color = ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary[0])
    # page_title = page[0].page_title
    # print(str(sorted(step_menu_pages, key = lambda x: x[1])))
    # for steps in step_menu:
        # print(steps.menu_title )
    page_description = Page_Description.objects.filter(page=page[0])
    if request.session.get('itinerary'):
        del request.session['itinerary']
    
    address_section="NO"
    LieuA = Lieu.objects.filter(Page=page[0])
    if LieuA.count()>0:
        Lieu_Results = LieuA
        address_section="YES"
    else:
        Lieu_Results = "NA"

    BarA = Bar.objects.filter(Page=page[0])
    if BarA.count()>0:
        Bar_Results = BarA
        address_section="YES"
    else:
        Bar_Results = "NA"

    CE = ChildrenEntertainment.objects.filter(Page=page[0])
    if CE.count()>0:
        CE_Results = CE
        address_section="YES"
    else:
        CE_Results = "NA"

    ResturantA =  Resturant.objects.filter(Page=page[0])
    if ResturantA.count()>0:
        Resturant_Results = ResturantA
        address_section="YES"
    else:
        Resturant_Results = "NA"

    ShoppingA = Shopping.objects.filter(Page=page[0])
    if ShoppingA.count()>0:
        Shopping_Results = ShoppingA
        address_section="YES"
    else:
        Shopping_Results = "NA"

    ToiletA = Toilets.objects.filter(Page=page[0])
    if ToiletA.count()>0:
        Toilet_Results = ToiletA
        address_section="YES"
    else:
        Toilet_Results = "NA"

    TransportA = transport.objects.filter(Page=page[0])
    if TransportA.count()>0:
        Transport_Results = TransportA 
        address_section="YES"
    else:
        Transport_Results = "NA"
    
    ohA = opening_hours.objects.filter(Page=page[0])
    if ohA.count()>0:
        oh_Results = ohA
        address_section="YES"
    else:
        oh_Results = "NA"
    
    TicketsA = tickets.objects.filter(Page=page[0])
    if TicketsA.count()>0:
        Tickets_Results = TicketsA
        address_section="YES"
    else:
        Tickets_Results = "NA"

    request.session['itinerary'] = Itin_Color[0].itinerary_colors
    page_title = page[0].page_title
    context={
        'page_title':page_title,
        'Itineraries':zip(itinerary,home_menu),
        'Itin_Color':Itin_Color[0].itinerary_colors,
        'burger_menu':burger_menu,
        'Page': page[0],
        'Page_Description':page_description[0],
        'Step_menu':step_menu_pages,
        'Lieu':Lieu_Results,
        'Bar':Bar_Results,
        'CE':CE_Results,
        'Resturant':Resturant_Results,
        'Shopping':Shopping_Results,
        'Toilet':Toilet_Results,
        'opening_hours':oh_Results,
        'Transport':Transport_Results,
        'Tickets':Tickets_Results,
        'info_section':address_section,
        'raw_step_menu':step_pages_menus
        
        
    }
    template = 'cdp_itinerary_template.html'
    return context

def indexItinerary(request, context, template, home_menu, itinerary, burger_menu):
    page = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step_introduction_index')
    step_menu = Menu.objects.filter(itinerary=itinerary[0], menu_type__iexact='Step').order_by('menu_id')
    step_pages = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step').order_by('page_order')
    step_pages_menus = retrieve_index_page_menu_by_order(itinerary[0])
    # print("here"+str(step_pages_menus))
    # for spm in step_pages_menus:
    #     print("here"+str(spm))
        # print(str(spm.page_title))
    # step_menu_pages = Menu.objects.filter(itinerary=itinerary[0], menu_type__iexact='Step').select_related('Page').filter(Page__itinerary=itinerary[0], Page__page_type__iexact='step')
    step_menu_pages = zip(step_menu,step_pages)
    # Itin_Color = ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary[0])
    # page_title = page[0].page_title
    # print(str(sorted(step_menu_pages, key = lambda x: x[1])))
    # for steps in step_menu:
        # print(steps.menu_title )
    page_description = Page_Description.objects.filter(page=page[0])
    if request.session.get('itinerary'):
        del request.session['itinerary']
    
    request.session['itinerary'] = "home"
    page_title = page[0].page_title
    context={
        'page_title':page_title,
        'Itineraries':zip(itinerary,home_menu),
        # 'Itin_Color':Itin_Color[0].itinerary_colors,
        'burger_menu':burger_menu,
        'Page': page[0],
        'Page_Description':page_description[0],
        'Step_menu':step_menu_pages,
        'raw_step_menu':step_pages_menus
        
        
    }
    template = 'cdp_index_itinerary_template.html'
    return context

def indexNameItinerary(request, context, home_menu, itinerary, burger_menu):
    page = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step_introduction_index')
    PIO = Page_Image_Order.objects.all()
    page_description = Page_Description.objects.filter(page=page[0])
    if request.session.get('itinerary'):
        del request.session['itinerary']
    index_pages_menus = retrieve_index_name_page_menu_by_order()
    print('here '+str(index_pages_menus))
    request.session['itinerary'] = "home"
    page_title = page[0].page_title
    context={
        'page_title':page_title,
        'Itineraries':zip(itinerary,home_menu),
        # 'Itin_Color':Itin_Color[0].itinerary_colors,
        'burger_menu':burger_menu,
        'Page': page[0],
        'Page_Description':page_description[0],
        # 'Step_menu':step_menu_pages,
        'raw_step_menu':index_pages_menus
        
        
    }
    return context    


def regularIntroduction(request, context, template, home_menu, itinerary, burger_menu):
    page = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='introduction')
    page_description = Page_Description.objects.filter(page=page[0])
    page_txt=text_formating_for_images(page_description[0])

    page_introductions = []
    menu_introductions = []
    itin_itin = []
    menu_itin = []
    color_itin = []
    retrieve_typewise_itinerary_details(page_introductions,menu_introductions,itin_itin,menu_itin,color_itin)
    itin_menu = zip(itin_itin,menu_itin,color_itin)
    current_itin = Burger_Menu_Ordering.objects.filter(itinerary=itinerary[0])    
    if current_itin.count()>0:
        next_itin = Burger_Menu_Ordering.objects.filter(appearnce_order_in_burger_menu=current_itin[0].appearnce_order_in_burger_menu+1)
    
        if next_itin.count()>0:
            next_itin_menu = next_itin
        else:
            next_itin_menu = "NA"
        prev_itin = Burger_Menu_Ordering.objects.filter(appearnce_order_in_burger_menu=current_itin[0].appearnce_order_in_burger_menu-1)
        
        if prev_itin.count()>0:
            prev_itin_menu = prev_itin
        else:
            prev_itin_menu = "NA"
    else:
        next_itin_menu = "NA"
        prev_itin_menu = "NA"
    
    itin_audio = audio_page.objects.filter(page_description=page_description[0])
    if itin_audio.count()>0:
        itin_audio_results = itin_audio[0]
    else:
        itin_audio_results = "NA"
    
    if request.session.get('itinerary'):
        del request.session['itinerary']
    request.session['itinerary'] = "home"
    page_title = page[0].page_title
    context={
        'page_title':page_title,
        'Itineraries':zip(itinerary,home_menu),
        'burger_menu':burger_menu,
        'Page': page[0],
        'Page_Description':page_description[0],
        'itin_menu':itin_menu,
        'page_text':page_txt,
        'next_itin':next_itin_menu,
        'prev_itin':prev_itin_menu,
        'itin_audio':itin_audio_results
        
    }
    template = 'cdp_introduction_template.html'
    return context
# step methods

def regularSteps(request,menu_link,home_menu,itinerary_name,itinerary,burger_menu):
    page = Page.objects.filter(page_title__iexact=home_menu[0].menu_title, itinerary=itinerary[0], page_type__iexact='step' )
    step_menu =  Menu.objects.filter(menu_link__icontains=itinerary_name, menu_type__iexact='Step')
    page_description = Page_Description.objects.filter(page=page[0])
    page_image_order = Page_Image_Order.objects.filter(page_description=page_description[0])

    page_txt = text_formating_for_images(page_description[0])
    # page_title = page[0].page_title
    # print(page[0])
    # print(page_txt)
    page_description[0].page_Text = page_txt

    address_section="NO"
    LieuA = Lieu.objects.filter(Page=page[0])
    if LieuA.count()>0:
        Lieu_Results = LieuA
        address_section="YES"
    else:
        Lieu_Results = "NA"

    BarA = Bar.objects.filter(Page=page[0])
    if BarA.count()>0:
        Bar_Results = BarA
        address_section="YES"
    else:
        Bar_Results = "NA"

    CE = ChildrenEntertainment.objects.filter(Page=page[0])
    if CE.count()>0:
        CE_Results = CE
        address_section="YES"
    else:
        CE_Results = "NA"

    ResturantA =  Resturant.objects.filter(Page=page[0])
    if ResturantA.count()>0:
        Resturant_Results = ResturantA
        address_section="YES"
    else:
        Resturant_Results = "NA"

    ShoppingA = Shopping.objects.filter(Page=page[0])
    if ShoppingA.count()>0:
        Shopping_Results = ShoppingA
        address_section="YES"
    else:
        Shopping_Results = "NA"

    ToiletA = Toilets.objects.filter(Page=page[0])
    if ToiletA.count()>0:
        Toilet_Results = ToiletA
        address_section="YES"
    else:
        Toilet_Results = "NA"

    TransportA = transport.objects.filter(Page=page[0])
    if TransportA.count()>0:
        Transport_Results = TransportA 
        address_section="YES"
    else:
        Transport_Results = "NA"

    ohA = opening_hours.objects.filter(Page=page[0])
    if ohA.count()>0:
        oh_Results = ohA
        address_section="YES"
    else:
        oh_Results = "NA"

    TicketsA = tickets.objects.filter(Page=page[0])
    if TicketsA.count()>0:
        Tickets_Results = TicketsA
        address_section="YES"
    else:
        Tickets_Results = "NA"
    # addresses = zip(LieuA,BarA, CE,ResturantA,ShoppingA,ToiletA)

    current_page_menu = Menu.objects.filter(itinerary=itinerary[0], menu_title=page[0].page_title)
    current_page_details = zip(current_page_menu,page)

    next_pages = []
    next_pages_top = []
    next_pages_bottom = []
    retrieve_next_pages(2, next_pages, page[0],itinerary[0])
    retrieve_next_pages(2, next_pages_top, page[0],itinerary[0])
    retrieve_next_pages(2, next_pages_bottom, page[0],itinerary[0])
    prev_page_menu_details_top =retrive_previous_page(page,itinerary)
    prev_page_menu_details_bottom = retrive_previous_page(page,itinerary)
    
    step_audio = audio_page.objects.filter(page_description=page_description[0])
    if step_audio.count()>0:
        if step_audio[0].page_description.show_title_audio==True:
            step_audio_results = step_audio[0]
        else:
            step_audio_results = "NA"    
    else:
        # step_audio_singular = audio_page.objects.filter(page_description=page_description[0],audio_appearnce_order=1)
        step_audio_results = "NA"

    Itin_Color = ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary[0])
    Itin_link = Menu.objects.filter(itinerary=itinerary[0], menu_title__iexact=itinerary[0].itinerary_name, menu_type__iexact='Burger')
    if request.session.get('itinerary'):
        del request.session['itinerary']
    request.session['itinerary'] = Itin_Color[0].itinerary_colors
    
    if request.session.get('page'):
        del request.session['page']
    
    if page[0].is_page_zero is not True:
    
        page_map = Map.objects.filter(Page=page[0])

        page_lat = page_map[0].lat
        page_longt = page_map[0].longt
        request.session['page'] = str(page_lat)+","+str(page_longt)

    page_title = page[0].page_title
    # print("color "+str(Itin_Color[0].itinerary_colors))
    context={
         'page_title':page_title,
         'Itineraries':zip(itinerary,home_menu),
         'burger_menu':burger_menu,
         'Page': page[0],
         'Page_Description':page_description[0],
         'page_text': page_txt,
         'Step_menu':step_menu,
         'next_pages': next_pages,   
         'next_pages_top':next_pages_top,
         'next_pages_bottom':next_pages_bottom, 
         'page_images': page_image_order,
         'Lieu':Lieu_Results,
         'Bar':Bar_Results,
         'CE':CE_Results,
         'Resturant':Resturant_Results,
         'Shopping':Shopping_Results,
         'Toilet':Toilet_Results,
         'opening_hours':oh_Results,
         'Transport':Transport_Results,
         'Tickets':Tickets_Results,
         'info_section':address_section,
         'step_audio':step_audio_results,
         'previous_page_top':prev_page_menu_details_top,
         'previous_page_bottom':prev_page_menu_details_bottom,
         'current_page':current_page_details,
         'Itin_Color':Itin_Color[0].itinerary_colors,
         'Itin_link':Itin_link[0].menu_link,
         'step_title':'step'

     }
    if request.session.get('level'):
        del request.session['level']
    if page[0].is_page_zero is True:    
        request.session['level'] = 'home'
    else:
        request.session['level'] = 'step'
    return context

def indexSteps(request,menu_link,home_menu,itinerary_name,itinerary,burger_menu):
    page = Page.objects.filter(page_title__iexact=home_menu[0].menu_title, itinerary=itinerary[0], page_type__icontains='step' )
    step_menu =  Menu.objects.filter(menu_link__icontains=itinerary_name, menu_type__iexact='Step')
    page_description = Page_Description.objects.filter(page=page[0])
    page_image_order = Page_Image_Order.objects.filter(page_description=page_description[0])

    page_txt = text_formating_for_images(page_description[0])
    # page_title = page[0].page_title
    # print(page[0])
    # print(page_txt)
    page_description[0].page_Text = page_txt

    
    current_page_menu = Menu.objects.filter(itinerary=itinerary[0], menu_title=page[0].page_title)
    current_page_details = zip(current_page_menu,page)

    next_pages = []
    next_pages_top = []
    next_pages_bottom = []
    retrieve_next_pages(2, next_pages, page[0],itinerary[0])
    retrieve_next_pages(2, next_pages_top, page[0],itinerary[0])
    retrieve_next_pages(2, next_pages_bottom, page[0],itinerary[0])
    prev_page_menu_details_top =retrive_previous_page(page,itinerary)
    prev_page_menu_details_bottom = retrive_previous_page(page,itinerary)
    # print(str(next_pages_top))
    step_audio = audio_page.objects.filter(page_description=page_description[0])
    if step_audio.count()>0:
        if step_audio[0].page_description.show_title_audio==True:
            step_audio_results = step_audio[0]
        else:
            step_audio_results = "NA"    
    else:
        step_audio_results = "NA"

    Itin_Color = ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary[0])
    Itin_link = Menu.objects.filter(itinerary=itinerary[0], menu_title__iexact=itinerary[0].itinerary_name, menu_type__iexact='Burger')
    if request.session.get('itinerary'):
        del request.session['itinerary']
    request.session['itinerary'] = "home"
    if request.session.get('page'):
        del request.session['page']
    request.session['page'] = page[0].page_order
    page_title = page[0].page_title
    # print("color "+str(Itin_Color[0].itinerary_colors))
    context={
         'page_title':page_title,
         'Itineraries':zip(itinerary,home_menu),
         'burger_menu':burger_menu,
         'Page': page[0],
         'Page_Description':page_description[0],
         'page_text': page_txt,
         'Step_menu':step_menu,
         'next_pages': next_pages,   
         'next_pages_top':next_pages_top,
         'next_pages_bottom':next_pages_bottom, 
         'page_images': page_image_order,
    
         'step_audio':step_audio_results,
         'previous_page_top':prev_page_menu_details_top,
         'previous_page_bottom':prev_page_menu_details_bottom,
         'current_page':current_page_details,
        #  'Itin_Color':Itin_Color[0].itinerary_colors,
         'Itin_link':Itin_link[0].menu_link,
         'step_title':'step'

     }
    if request.session.get('level'):
        del request.session['level']
    request.session['level'] = "home"
    return context 

#PWA

def generateHtmlpages(request):
    listpages = [
        '/',\
        '/le-mur-des-federes/',\
        '/articles-thematiques/',\
        '/les-communardars-au-pere-lachaise/',\
        '/name-index/',\
        '/a-propos/',\
        '/mentions-legales/',\
        '/articles-thematiques/presentation-de-la-commune',\
        '/articles-thematiques/le-contexte-de-la-commune',\
        '/articles-thematiques/la-garde-nationale',\
        '/articles-thematiques/adolphe-thiers',\
        '/articles-thematiques/le-debut-de-la-commune',\
        '/articles-thematiques/le-fonctionnement-de-la-commune',\
        '/articles-thematiques/l-oeuvre-de-la-commune',\
        '/articles-thematiques/les-femmes-dans-la-commune',\
        '/articles-thematiques/la-federation-des-artistes',\
        '/articles-thematiques/les-ecrivains-contre-la-commune-de-paris',\
        '/articles-thematiques/les-etrangers-sous-la-commune',\
        '/articles-thematiques/la-presse',\
        '/articles-thematiques/la-semaine-sanglante',\
        '/articles-thematiques/la-repression',\
        '/histoire-de-la-commune/le-temps-des-cerises',\
        '/les-communards-au-pere-lachaise/le-cimetiere-du-pere-lachaise',\
        '/les-communards-au-pere-lachaise/flourens-gustave',\
        '/les-communardars-au-pere-lachaise/valles-jules',\
        '/les-communards-au-pere-lachaise/monument-a-la-memoire-des-gardes-nationaux',\
        '/les-communards-au-pere-lachaise/cleray-eugene',\
        '/les-communards-au-pere-lachaise/miot-jules',\
        '/les-communards-au-pere-lachaise/le-site-des-derniers-combats-tombeau-de-charles-nodier',\
        '/les-communards-au-pere-lachaise/delecluze-charles',\
        '/les-communards-au-pere-lachaise/pyat-felix',\
        '/les-communards-au-pere-lachaise/capellaro-charles-romain',\
        '/les-communards-au-pere-lachaise/okolowicz-auguste',\
        '/les-communards-au-pere-lachaise/colombarium-et-crematorium',\
        '/les-communards-au-pere-lachaise/grousset-paschal',\
        '/les-communards-au-pere-lachaise/urbain-raoul',\
        '/les-communards-au-pere-lachaise/avrial-augustin',\
        '/les-communards-au-pere-lachaise/eudes-emile',\
        '/les-communards-au-pere-lachaise/blanqui-auguste',\
        '/les-communards-au-pere-lachaise/noir-victor',\
        '/les-communards-au-pere-lachaise/longuet-charles',\
        '/les-communards-au-pere-lachaise/chassin-charles-louis',\
        '/les-communards-au-pere-lachaise/cournet-frederic',\
        '/les-communards-au-pere-lachaise/gill-andre',\
        '/les-communards-au-pere-lachaise/pottier-eugene',\
        '/les-communards-au-pere-lachaise/joffrin-jules',\
        '/les-communards-au-pere-lachaise/rogeard-louis-auguste',\
        '/les-communards-au-pere-lachaise/delaplanche-eugene',\
        '/les-communards-au-pere-lachaise/frankel-leo',\
        '/les-communards-au-pere-lachaise/amouroux-charles',\
        '/les-communards-au-pere-lachaise/ranc-arthur',\
        '/les-communards-au-pere-lachaise/devant-le-mur-des-federes',\
        '/les-communards-au-pere-lachaise/le-mur-des-federes',\
        '/les-communards-au-pere-lachaise/lejeune-adrien',\
        '/les-communards-au-pere-lachaise/allemane-jean',\
        '/les-communards-au-pere-lachaise/lucipia-louis-adrien',\
        '/les-communards-au-pere-lachaise/moreau-vauthier-augustin-jean'
    ]
    
    for link in listpages:
        page = requests.get(request.build_absolute_uri(link)[:-1].strip("/")) 
        soup = BeautifulSoup(page.content, 'html.parser')
        page_title = str(link) 
        if page_title == '/':
            title = 'home'
        else:
            title = page_title.split('/')[-1]
            
        app_path = djangoSettings.BASE_DIR+"/static/commune_de_paris/static/pwa/"+title+'.json'
        file=open(app_path,'w')
        file.write(str(soup))
        file.close()
    return JsonResponse({"success":'1'})

@csrf_exempt
def getImageFiles(request):
    filenames = {}
    path=r"/var/www/dev.bluelion.icu/bluelion/media/media/commune_de_paris"  # insert the path to your directory   
    # media_files =os.listdir(path)
    background_files =pathlib.PurePath(path)
    p = Path(path).relative_to('/var/www/dev.bluelion.icu/bluelion/').glob('**/*')
    media_files = [x for x in p if x.is_file()]
    t_media_files = []
    for media in media_files:
        t_media_files.append(str(media))
    
    path=r"/var/www/dev.bluelion.icu/bluelion/media/media/communde_de_paris"  # insert the path to your directory   
    image_files =os.listdir(path)
    background_files =pathlib.PurePath(path)
    p = Path(path).relative_to('/var/www/dev.bluelion.icu/bluelion/').glob('**/*')
    image_files = [x for x in p if x.is_file()]
    t_image_files = []
    for image in image_files:
        t_image_files.append(str(image))

    path=r"/var/www/dev.bluelion.icu/bluelion/static/chatou_auto/static/images/"  # insert the path to your directory   
    background_files =pathlib.PurePath(path)
    p = Path(path).relative_to('/var/www/dev.bluelion.icu/bluelion/').glob('**/*')
    static_files = [x for x in p if x.is_file()]
    t_static_files = []
    for static in static_files:
        t_static_files.append(str(static))
    filenames = {
        'media_files':t_media_files,
        'image_files':t_image_files,
        'static_files':t_static_files
    }
    return JsonResponse(filenames)  