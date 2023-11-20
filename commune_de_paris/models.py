from django.db import models
from ckeditor.fields import RichTextField

# Create your models here.
class cdp_Itinerary(models.Model):
    INTRODUCTION= 'INTRO'
    ITINERARY = 'ITIN'
    ITINERARY_INDEX = 'ITIN_INDEX'
    ITINERARY_NAME_INDEX = 'ITIN_NAME_INDEX'

    ITINERARY_TYPE_CHOICES = [
        (INTRODUCTION, 'INTRODUCTION'),
        (ITINERARY, 'ITINERARY'),
        (ITINERARY_INDEX, 'ITINERARY_INDEX'),
        (ITINERARY_NAME_INDEX, 'ITINERARY_NAME_INDEX'),
    ]
    itinerary_id = models.AutoField(primary_key=True)
    itinerary_name = models.CharField('Itinerary Name', max_length=520)
    itinerary_steps = models.IntegerField('Itinerary Steps', default=0)
    itinerary_type = models.CharField('Itinerary type', max_length=520,choices= ITINERARY_TYPE_CHOICES,default=ITINERARY)
    is_visible_on_homepage = models.BooleanField(default=True)
    def __str__(self):
        return self.itinerary_name

class cdp_Page(models.Model):
    STEP= 'step'
    STEP_INDEX = 'step_index'
    STEP_INTRODUCTION = 'step_introduction'
    STEP_INTRODUCTION_INDEX = 'step_introduction_index'
    INTRODUCTION = 'introduction'

    PAGE_TYPE_CHOICES = [
        (STEP, 'step'),
        (STEP_INDEX, 'step_index'),
        (STEP_INTRODUCTION, 'step_introduction'),
        (STEP_INTRODUCTION_INDEX, 'step_introduction_index'),
        (INTRODUCTION, 'introduction'),
    ]
    page_id = models.AutoField(primary_key=True)
    page_title = models.CharField('Page Title', max_length=520)
    page_display_title = models.CharField('Page Display Title', max_length=520, default="",null=True)
    show_display_title = models.BooleanField(default=False)
    itinerary = models.ForeignKey(cdp_Itinerary, on_delete=models.CASCADE)
    page_type = models.CharField('Page Type', max_length=520,choices= PAGE_TYPE_CHOICES,default=STEP)
    page_order = models.IntegerField('Page Order', null=True, blank=True)
    page_Summary  = models.CharField('Page Summary', max_length=100000, default='NA')
    is_page_zero = models.BooleanField(default=False)
    def __str__(self):
        return self.page_title

class cdp_Images(models.Model):
    NORMAL_IMAGE = 'NORMAL_IMAGE'
    INDEX_IMAGE = 'INDEX_IMAGE'
    IMAGE_TYPE_CHOICES = [
        (NORMAL_IMAGE, 'NORMAL_IMAGE'),
        (INDEX_IMAGE, 'INDEX_IMAGE'),
    ]
    image_id = models.AutoField(primary_key=True)
    # filename  = models.CharField('filename', max_length=1000)
    filename = models.ImageField(upload_to = 'media/communde_de_paris/',max_length=300)
    image_name  = models.CharField('image name', max_length=1000, default='NA')
    long_description  = RichTextField('long description', max_length=2000, default='NA')
    short_description  = RichTextField('short description', max_length=2000,default='NA')
    image_type = models.CharField('Image type', max_length=520,choices= IMAGE_TYPE_CHOICES,default=NORMAL_IMAGE)
    Page = models.ForeignKey(cdp_Page, on_delete=models.DO_NOTHING, null=True, blank=True)
    def __str__(self):
        return str(self.filename.url)


class cdp_Menu(models.Model):
    menu_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(cdp_Itinerary, on_delete=models.CASCADE)
    menu_title = models.CharField('Menu Title', max_length=520)
    # menu_title = RichTextField()
    menu_link = models.CharField('Menu Link', max_length=520)
    menu_type = models.CharField('Menu Type', max_length=520)
    menu_images =  models.ForeignKey(cdp_Images, on_delete=models.DO_NOTHING, null=True, blank=True)
    def __str__(self):
        return self.menu_link



class cdp_Map(models.Model):
    page_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(cdp_Itinerary, on_delete=models.CASCADE)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    map_images =  models.ForeignKey(cdp_Images, on_delete=models.DO_NOTHING, null=True, blank=True)
    lat = models.CharField('lat', max_length=520)
    longt = models.CharField('longt', max_length=520)
    geo_coordinates = models.CharField('Geo Coordinates (latitude,longitude)', max_length=520, null=True, blank=True)
    def __str__(self):
        return self.Page.page_title

class cdp_Map_Controls(models.Model):
    MC_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(cdp_Itinerary, on_delete=models.CASCADE,blank=True, null=True)
    map_center = models.CharField('Map Center', max_length=520, default='NA')
    zoom_for_home = models.DecimalField('Zoom For Home', max_digits=3, decimal_places=1, default=15.0)
    pin_zoom = models.DecimalField('Pin Zoom', max_digits=3, decimal_places=1, default=15.0)
    def __str__(self):
        if self.itinerary:
           return self.itinerary.itinerary_name
        else:
            return 'home'   

class cdp_Lieu(models.Model):
    Lieu_id = models.AutoField(primary_key=True)
    Lieu_Address = models.CharField('Lieu Address', max_length=520)
    Lieu_Comment = models.CharField('Lieu Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_Bar(models.Model):
    Bar_id = models.AutoField(primary_key=True)
    Bar_Address = models.CharField('Bar Address', max_length=520)
    Bar_Comment = models.CharField('Bar Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_ChildrenEntertainment(models.Model):
    CE_id = models.AutoField(primary_key=True)
    CE_Address = models.CharField('CE Address', max_length=520)
    CE_Comment = models.CharField('CE Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_Resturant(models.Model):
    Resturant_id = models.AutoField(primary_key=True)
    Resturant_Address = models.CharField('Resturant Address', max_length=520)
    Resturant_Comment = models.CharField('Resturant Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_Shopping(models.Model):
    Shopping_id = models.AutoField(primary_key=True)
    Shopping_Address = models.CharField('Shopping Address', max_length=520)
    Shopping_Comment = models.CharField('Shopping Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_Toilets(models.Model):
    Toilet_id = models.AutoField(primary_key=True)
    Toilet_Address = models.CharField('Shopping Address', max_length=520)
    Toilet_Comment = models.CharField('Shopping Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_opening_hours(models.Model):
    oh_id = models.AutoField(primary_key=True)
    oh_Details = models.CharField('Opening Hours Details', max_length=520)
    oh_Comment = models.CharField('Opening Hours Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_tickets(models.Model):
    tickets_id = models.AutoField(primary_key=True)
    tickets_Details = models.CharField('Tickets Address', max_length=520)
    tickets_Comment = models.CharField('Tickets Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class cdp_transport(models.Model):
    transport_id = models.AutoField(primary_key=True)
    transport_Details = models.CharField('transport Address', max_length=520)
    transport_Comment = models.CharField('transport Comment', max_length=520)
    Page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title
# class cdp_Menu_Images(models.Model):
#     menu_images_id  = models.AutoField(primary_key=True)
#     menu = models.ManyToManyField(Menu)
#     images = models.ManyToManyField(Images)

#     def int(self):
#         return self.menu_images_id
class cdp_Page_Description(models.Model):
    PD_id = models.AutoField(primary_key=True)
    page = models.ForeignKey(cdp_Page, on_delete=models.CASCADE)
    page_map = models.ForeignKey(cdp_Map, on_delete=models.DO_NOTHING, null=True, blank=True)
    page_title_image =  models.ForeignKey(cdp_Images, on_delete=models.DO_NOTHING, null=True, blank=True)
    page_Text  = RichTextField('Page Text', max_length=100000, default='NA')
    show_title_audio = models.BooleanField(default=True)
    def __str__(self):
        return self.page.page_title

class cdp_Page_Image_Order(models.Model):
    PD_id = models.AutoField(primary_key=True)
    page_description = models.ForeignKey(cdp_Page_Description, on_delete=models.CASCADE)
    page_image = models.ForeignKey(cdp_Images, on_delete=models.CASCADE)
    appearnce_order = models.IntegerField('Appearnce Order', default=1)
    is_page_present = models.BooleanField(default=True)
    def __str__(self):
        return self.page_description.page.page_title + "----" + self.page_image.image_name +"------"+str(self.appearnce_order)

class cdp_Page_Before_After_Image_Order(models.Model):
    PD_id = models.AutoField(primary_key=True)
    page_description = models.ForeignKey(cdp_Page_Description, on_delete=models.CASCADE)
    page_image_before = models.ForeignKey(cdp_Images, on_delete=models.CASCADE, related_name="image_before")
    page_image_after = models.ForeignKey(cdp_Images, on_delete=models.CASCADE, related_name="image_after")
    is_page_in_present = models.BooleanField(default=True)
    appearnce_order_in_page = models.IntegerField('Appearnce Order Page', default=1)
    def __str__(self):
        return self.page_description.page.page_title

class cdp_Burger_Menu_Ordering(models.Model):
    BMO_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(cdp_Itinerary, on_delete=models.CASCADE)
    menu =  models.ForeignKey(cdp_Menu, 
                            on_delete=models.DO_NOTHING, 
                                null=True, 
                                blank=True,
                                limit_choices_to={'menu_type': 'Burger'},
                            )
    appearnce_order_in_burger_menu = models.IntegerField('Appearnce Order Burger Menu', default=1)
    def __str__(self):
            return self.itinerary.itinerary_name+'-------'+str(self.appearnce_order_in_burger_menu)

class cdp_ITINERARY_Color_Scheme(models.Model):
    ICS_id = models.AutoField(primary_key=True)
    itinerary =  models.ForeignKey(cdp_Itinerary, 
                            on_delete=models.DO_NOTHING, 
                                null=True, 
                                blank=True,
                                limit_choices_to={'itinerary_type': 'ITIN'},
                            )
    BLUE='BLUE'
    RED='RED'
    ITINERARY_COLOR_CHOICES = [
        (BLUE, 'BLUE'),
        (RED, 'RED'),
    ]
    itinerary_colors = models.CharField('Itinerary colors', max_length=520,choices= ITINERARY_COLOR_CHOICES,default=BLUE)
    def __str__(self):
            return self.itinerary.itinerary_name
    
class cdp_audios(models.Model):
    audio_id = models.AutoField(primary_key=True)
    audio_title = models.CharField('Audio Title', max_length=520 )
    audio_description = RichTextField('audio description', max_length=2000, default='NA') 
    audio_file = models.FileField(upload_to='media/commune_de_paris/audio_files/')
    def __str__(self):
        return str(self.audio_file.url)

class cdp_audio_page(models.Model):
    ap_id = models.AutoField(primary_key=True)
    page_description = models.ForeignKey(cdp_Page_Description, on_delete=models.CASCADE)
    audio = models.ForeignKey(cdp_audios, on_delete=models.CASCADE)
    audio_appearnce_order = models.IntegerField('Audio Appearnce Order', default=1)
    is_audio_present_on_page = models.BooleanField(default=True)
    def __str__(self):
        return 'order - '+str(self.audio_appearnce_order) + ' - ' +self.page_description.page.page_title + '-audio-'+self.audio.audio_file.url