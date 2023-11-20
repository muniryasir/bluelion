from django.shortcuts import render
from django.db.models.signals import post_save
from django.dispatch import receiver
import re 
from .models import Itinerary, Menu, Images, Page, Page_Description, Page_Image_Order, Map, Resturant, Shopping, Bar, ChildrenEntertainment, Lieu,Toilets,Page_Before_After_Image_Order,Burger_Menu_Ordering
from .models import ITINERARY_Color_Scheme
from slugify import slugify
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse

# Create your views here.
def home(request):
    page_title = "home"
    burger_menu = Burger_Menu_Ordering.objects.all().order_by('appearnce_order_in_burger_menu')
    # Itineraries = Itinerary.objects.all().order_by('itinerary_id')
    # home_menu = Menu.objects.all().order_by('menu_id')
    # home_main_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
    page_introductions = []
    menu_introductions = []
    itin_itin = []
    menu_itin = []
    color_itin = []
    # for itinerary in Itineraries:
    #     if itinerary.itinerary_type == 'INTRO':
    #         page = Page.objects.filter(itinerary=itinerary)
    #         page_introductions.append(page[0])
    #         introduction_menu = Menu.objects.filter(menu_type='Main', menu_title__iexact=page[0].page_title)
    #         menu_introductions.append(introduction_menu[0])
    #     elif itinerary.itinerary_type == 'ITIN':
            
    #         itin_itin.append(itinerary)
    #         itin_menu = Menu.objects.filter(menu_type='Main', menu_title__iexact=itinerary.itinerary_name)
    #         menu_itin.append(itin_menu[0])
    
    retrieve_typewise_itinerary_details(page_introductions,menu_introductions,itin_itin,menu_itin,color_itin)
    # home_menu_images = Menu.menu_images.all()
    page_menu_introductions = zip(page_introductions,menu_introductions)
    itin_menu = zip(itin_itin,menu_itin,color_itin)
    
    context={
         'page_title':page_title,
         'burger_menu':burger_menu,
         'Itineraries':itin_menu,
         'Page_introductions':page_menu_introductions
     }    
    return render(request,'home_auto.html',context)

# def introduction(request):
#     page_title = "introduction"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'introduction.html',context)


# def note_historique(request):
#     page_title = "Note Historique"
#     burger_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
#     home_main_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
#     context={
#         'burger_menu':burger_menu,
#         'page_title':page_title,
#         'Itineraries':home_main_menu
#      }     
#     return render(request,'note_historique_auto.html',context)

# def limpressionnisme(request):
#     page_title = "limpressionnisme"
#     burger_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
#     home_main_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
#     context={
#         'burger_menu':burger_menu,
#         'page_title':page_title,
#         'Itineraries':home_main_menu
#      }     
#     return render(request,'limpressionnisme_auto.html',context)

# def impressionistes_a(request):
#     page_title = "impressionistes_a"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'impressionistes_A.html',context)

# def impressionistes_b(request):
#     page_title = "impressionistes_b"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'impressionistes_B.html',context)

def author(request):
    page_title = "author"
    context={
         'page_title':page_title,
     }     
    return render(request,'author.html',context)

# def step_controller(request):
#                   #          step1               step2                   step3                   step4                           step5             step6                   step7                      step8               step9               step10
#     page_headings = ["La maison Fournaise","La maison Levanneur","L’église de Notre-Dame","L'ancien château Bertin","Le Nymphée de Soufflot","La villa Lambert","Boulevard de la République","L’hôtel de ville","La Place Berteaux","La gare de Chatou"]
#     url = request.path.split('/')
    
#     page_title = url[2]
#     step_file = url[2]+".html"
#     res = [re.findall(r'(\w+?)(\d+)', page_title)[0] ] 
#     step_number = int(res[0][1])
#     print(res[0][1])
#     page_heading = page_headings[step_number]
#     context={
#          'page_title':page_title,
#          'step_file':step_file,
#          'page_heading':page_heading,
#      }     
#     return render(request,'step_main.html',context)



@receiver(post_save, sender=Itinerary)
def admin_Itinerary_handler(sender, instance, **kwargs):
    app_name="chatou_auto"
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
        elif instance.itinerary_type == 'INTRO':
            link_str =  app_name+"/"+slugify(instance.itinerary_name) 
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Main'  )
            menu_object.save()
            menu_object = Menu.objects.create(itinerary=instance, menu_title=instance.itinerary_name, menu_link=link_str,menu_type='Burger'  )
            menu_object.save()

    print('post save callback')

def itinerary_handler(request, itinerary_name):

    # page_title = "link is - %s %s" % (appname, itinerary_name)
    # menu_link = appname+"/"+itinerary_name
    home_menu = Menu.objects.filter(menu_link__icontains=itinerary_name, menu_type='Burger')
    itinerary = Itinerary.objects.filter(itinerary_id=home_menu[0].itinerary.itinerary_id)
    burger_menu = Burger_Menu_Ordering.objects.all().order_by('appearnce_order_in_burger_menu')

    template = ""
    if itinerary[0].itinerary_type=='ITIN':
        
        page = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step_introduction')
        step_menu = Menu.objects.filter(itinerary=itinerary[0], menu_type__iexact='Step').order_by('menu_id')
        step_pages = Page.objects.filter(itinerary=itinerary[0], page_type__iexact='step').order_by('page_order')
        # step_menu_pages = Menu.objects.filter(itinerary=itinerary[0], menu_type__iexact='Step').select_related('Page').filter(Page__itinerary=itinerary[0], Page__page_type__iexact='step')
        step_menu_pages = zip(step_menu,step_pages)
        Itin_Color = ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary[0])
        # page_title = page[0].page_title
        # print(str(sorted(step_menu_pages, key = lambda x: x[1])))
        # for steps in step_menu:
            # print(steps.menu_title )
        page_description = Page_Description.objects.filter(page=page[0])
        
        context={
            'Itineraries':zip(itinerary,home_menu),
            'Itin_Color':Itin_Color[0].itinerary_colors,
            'burger_menu':burger_menu,
            'Page': page[0],
            'Page_Description':page_description[0],
            'Step_menu':step_menu_pages,
            
            
        }
        template = 'itinerary_template.html'
    elif itinerary[0].itinerary_type=='INTRO':
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
        context={
            'Itineraries':zip(itinerary,home_menu),
            'burger_menu':burger_menu,
            'Page': page[0],
            'Page_Description':page_description[0],
            'itin_menu':itin_menu,
            'page_text':page_txt,
            'next_itin':next_itin_menu,
            'prev_itin':prev_itin_menu
            
        }
        template = 'introduction_template.html'

    return render(request,template,context)

@receiver(post_save, sender=Page)
def admin_page_handler(sender, instance, **kwargs):
    app_name="chatou_auto"
    if kwargs['created']: #make sure its a new record
        # print(instance.itinerary_name)
    #print(sender.itinerary_name)
        link_str =  app_name+"/"+slugify(instance.itinerary.itinerary_name)+"/"+slugify(instance.page_title) 
        menu_object = Menu.objects.create(itinerary=instance.itinerary, menu_title=instance.page_title, menu_link=link_str,menu_type='Step'  )
        menu_object.save()
        
    print('post save callback')

def step_handler(request, itinerary_name, step_name):

    # page_title = "link is - %s %s" % (appname, itinerary_name)
    menu_link = itinerary_name+"/"+step_name
    home_menu = Menu.objects.filter(menu_link__icontains=menu_link, menu_type__iexact='Step')
    itinerary = Itinerary.objects.filter(itinerary_id=home_menu[0].itinerary.itinerary_id)
    burger_menu = Burger_Menu_Ordering.objects.all().order_by('appearnce_order_in_burger_menu')

    # print(home_menu[0].menu_title)
    page = Page.objects.filter(page_title__iexact=home_menu[0].menu_title, itinerary=itinerary[0], page_type__iexact='step' )
    step_menu =  Menu.objects.filter(menu_link__icontains=itinerary_name, menu_type__iexact='Step')
    page_description = Page_Description.objects.filter(page=page[0])
    page_image_order = Page_Image_Order.objects.filter(page_description=page_description[0])
    # page_BA_image_order = Page_Before_After_Image_Order.objects.filter(page_description=page_description[0])
    

    # figure = '''<figure class="is-pulled-left image is-gallery-trigger" data-target="gallery-name-1 <-imgOrder->">
    #                 <img src="<-I->" class="is-clearfix" alt="">
    #                 <figcaption><-C-></figcaption>
    #                 <input type="hidden" name="long_description" id="long_description" value="<-long_description->" >
    #             </figure>'''
    # figureba = '''
    #                     <figure class="is-pulled-left image is-gallery-trigger" data-target="gallery-name-1 <-imgOrder->">
    #                         <div class="wrapper_comparison_slider">
    #                              <div class="js-comparison-container">
    #                              <img class="comparison-image" src="<-I1->" alt="">
    #                              <img class="comparison-image" src="<-I2->" alt="">
    #                              </div>
    #               </div>
    #                         <figcaption><-C-></figcaption>
    #                         <input type="hidden" name="long_description" id="long_description" value="<-long_description->" >
    #                     </figure>
    #                 '''
    # figurevalue = []
    # figurevalueba = []
    # for image_order in page_image_order:
    #     newfigure = figure.replace("<-I->",image_order.page_image.filename.url)
    #     newfigure = newfigure.replace("<-C->",image_order.page_image.short_description)
    #     newfigure = newfigure.replace("<-imgOrder->",".img-"+str(image_order.appearnce_order+1))
    #     newfigure = newfigure.replace("<-long_description->",".img-"+image_order.page_image.long_description)
    #     figurevalue.append(newfigure)
    # page_txt = page_description[0].page_Text
   
    # for image_order in page_BA_image_order:
    #     newfigureba = figureba.replace("<-I1->",image_order.page_image_before.filename.url)
    #     # print("image"+str(image_order.page_image_before))
    #     newfigureba = newfigureba.replace("<-I2->",image_order.page_image_after.filename.url)
    #     newfigureba = newfigureba.replace("<-C->",image_order.page_image_after.short_description)
    #     newfigureba = newfigureba.replace("<-imgOrder->",".img-"+str(image_order.appearnce_order_in_page+1))
    #     # newfigureba = newfigureba.replace("<-long_description->",".img-"+image_order.page_image_after.long_description)
    #     figurevalueba.append(newfigureba)
    
    # page_txt_img_count = page_txt.count("<p>&lt;")
    
    # # print(len(newfigure))
    # # print(page_txt_img_count)
    # if len(figurevalue) > 0:
    #     for i in range(0, page_txt_img_count): 
    #         page_txt = page_txt.replace("<p>&lt;"+str(i+1)+"&gt;</p>",figurevalue[i])
    #     # print(page_txt)
    # page_txt_img_countba = page_txt.count("<p>&lt;ba")
    # if len(figurevalueba) > 0:
    #     for i in range(0, page_txt_img_countba): 
    #         page_txt = page_txt.replace("<p>&lt;ba"+str(i+1)+"&gt;</p>",figurevalueba[i])
    page_txt = text_formating_for_images(page_description[0])
    # page_title = page[0].page_title
    # print(page[0])
    # print(page_txt)
    page_description[0].page_Text = page_txt
    LieuA = Lieu.objects.filter(Page=page[0])
    if LieuA.count()>0:
        Lieu_Results = LieuA
    else:
        Lieu_Results = "NA"
    BarA = Bar.objects.filter(Page=page[0])
    if BarA.count()>0:
        Bar_Results = BarA
    else:
        Bar_Results = "NA"
    CE = ChildrenEntertainment.objects.filter(Page=page[0])
    if CE.count()>0:
        CE_Results = CE
    else:
        CE_Results = "NA"
    ResturantA =  Resturant.objects.filter(Page=page[0])
    if ResturantA.count()>0:
        Resturant_Results = ResturantA
    else:
        Resturant_Results = "NA"
    ShoppingA = Shopping.objects.filter(Page=page[0])
    if ShoppingA.count()>0:
        Shopping_Results = ShoppingA
    else:
        Shopping_Results = "NA"
    ToiletA = Toilets.objects.filter(Page=page[0])
    if ToiletA.count()>0:
        Toilet_Results = ToiletA
    else:
        Toilet_Results = "NA"
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



    Itin_Color = ITINERARY_Color_Scheme.objects.filter(itinerary=itinerary[0])
    Itin_link = Menu.objects.filter(itinerary=itinerary[0], menu_title__iexact=itinerary[0].itinerary_name, menu_type__iexact='Burger')
    # print(itinerary[0].itinerary_name)
    context={
        'page_title':'step',
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
         'Lieu':LieuA,
         'Bar':BarA,
         'CE':CE,
         'Resturant':Resturant,
         'Shopping':Shopping,
         'Toilet':ToiletA,
         
         'previous_page_top':prev_page_menu_details_top,
         'previous_page_bottom':prev_page_menu_details_bottom,
         'current_page':current_page_details,
         'Itin_Color':Itin_Color[0].itinerary_colors,
         'Itin_link':Itin_link[0].menu_link

     }  
    return render(request,'step_main_auto.html',context)
    # return render(request,'itinerary_template.html',context)

@csrf_exempt
def map_data(request):
    map_data = Map.objects.all()
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
        map_str = map_str + map_item.lat+"-t-"
        map_str = map_str + map_item.longt+"-t-"
        step_menu = Menu.objects.filter(menu_link__icontains=slugify(map_item.Page.page_title), menu_type='Step')
        if step_menu.count() > 0:
            map_str = map_str + step_menu[0].menu_link+"-t-"
            map_str = map_str + str(map_item.Page.page_order)+"-t-"
            itin_color =  ITINERARY_Color_Scheme.objects.filter(itinerary=step_menu[0].itinerary)
            map_str = map_str + itin_color[0].itinerary_colors +"-t-"
            map_str = map_str + "-M-"  
           
        else:    
            map_str = map_str +"NA"
            map_str = map_str + "-M-"
        
        # print(map_str)

    data["map_data"]=map_str
    return JsonResponse(data)


# support Methods
def text_formating_for_images(page_description):
    page_txt = page_description.page_Text
    page_image_order = Page_Image_Order.objects.filter(page_description=page_description)
    page_BA_image_order = Page_Before_After_Image_Order.objects.filter(page_description=page_description)
    figure = '''<figure class="is-pulled-left image is-gallery-trigger" data-target="gallery-name-1 <-imgOrder->">
                    <img src="<-I->" class="is-clearfix" alt="">
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
    
    page_txt_img_count = page_txt.count("<p>&lt;")
    
    # print(len(newfigure))
    # print(page_txt_img_count)
    if len(figurevalue) > 0:
        for i in range(0, page_txt_img_count): 
            page_txt = page_txt.replace("<p>&lt;"+str(i+1)+"&gt;</p>",figurevalue[i])
        # print(page_txt)
    page_txt_img_countba = page_txt.count("<p>&lt;ba")
    if len(figurevalueba) > 0:
        for i in range(0, page_txt_img_countba): 
            page_txt = page_txt.replace("<p>&lt;ba"+str(i+1)+"&gt;</p>",figurevalueba[i])
    
    return page_txt

def retrieve_typewise_itinerary_details(page_introductions,menu_introductions,itin_itin,menu_itin,color_itin):
    Itineraries = Itinerary.objects.all().order_by('itinerary_id')
    home_menu = Menu.objects.all().order_by('menu_id')
    home_main_menu = Menu.objects.filter(menu_type='Main').order_by('menu_id')
    for itinerary in Itineraries:
        if itinerary.itinerary_type == 'INTRO' and itinerary.is_visible_on_homepage==True:
            page = Page.objects.filter(itinerary=itinerary)
            page_introductions.append(page[0])
            introduction_menu = Menu.objects.filter(menu_type='Main', menu_title__iexact=page[0].page_title)
            menu_introductions.append(introduction_menu[0])
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
        next_page = Page.objects.filter( itinerary=itin, page_type__iexact='step', page_order=qpage.page_order+1 )
        if next_page.count() > 0:
            next_page_menu = Menu.objects.filter(itinerary=itin, menu_title=next_page[0].page_title)
            next_page_menu_details = zip(next_page_menu,next_page)
        else:
            next_page_menu_details = "NA"
            break
        next_pages.append(next_page_menu_details)

def retrive_previous_page(page,itinerary):
    prev_page = Page.objects.filter( itinerary=itinerary[0], page_type__iexact='step', page_order=page[0].page_order-1 )
    
    # print("here"+str(next_page[0].page_title))
    if prev_page.count() > 0:
        prev_page_menu = Menu.objects.filter(itinerary=itinerary[0], menu_title=prev_page[0].page_title)
        prev_page_menu_details = zip(prev_page_menu,prev_page)
    else:
        prev_page_menu_details = "NA"
    return prev_page_menu_details