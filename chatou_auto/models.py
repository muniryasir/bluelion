from django.db import models
from ckeditor.fields import RichTextField

# Create your models here.
class Itinerary(models.Model):
    INTRODUCTION= 'INTRO'
    ITINERARY = 'ITIN'
    ITINERARY_TYPE_CHOICES = [
        (INTRODUCTION, 'INTRODUCTION'),
        (ITINERARY, 'ITINERARY'),
    ]
    itinerary_id = models.AutoField(primary_key=True)
    itinerary_name = models.CharField('Itinerary Name', max_length=520)
    itinerary_steps = models.IntegerField('Itinerary Steps', default=0)
    itinerary_type = models.CharField('Itinerary type', max_length=520,choices= ITINERARY_TYPE_CHOICES,default=ITINERARY)
    is_visible_on_homepage = models.BooleanField(default=True)
    def __str__(self):
        return self.itinerary_name

class Images(models.Model):
    image_id = models.AutoField(primary_key=True)
    # filename  = models.CharField('filename', max_length=1000)
    filename = models.ImageField(upload_to = 'media/chatou_auto/',max_length=300)
    image_name  = models.CharField('image name', max_length=1000, default='NA')
    long_description  = RichTextField('long description', max_length=2000, default='NA')
    short_description  = RichTextField('short description', max_length=2000,default='NA')
    
    def __str__(self):
        return str(self.filename.url)

class Menu(models.Model):
    menu_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(Itinerary, on_delete=models.CASCADE)
    menu_title = models.CharField('Menu Title', max_length=520)
    # menu_title = RichTextField()
    menu_link = models.CharField('Menu Link', max_length=520)
    menu_type = models.CharField('Menu Type', max_length=520)
    menu_images =  models.ForeignKey(Images, on_delete=models.DO_NOTHING, null=True, blank=True)
    def __str__(self):
        return self.menu_link

class Page(models.Model):
    page_id = models.AutoField(primary_key=True)
    page_title = models.CharField('Page Title', max_length=520)
    itinerary = models.ForeignKey(Itinerary, on_delete=models.CASCADE)
    page_type = models.CharField('Page Type', max_length=520)
    page_order = models.IntegerField('Page Order', null=True, blank=True)
    page_Summary  = models.CharField('Page Summary', max_length=100000, default='NA')
    def __str__(self):
        return self.page_title

class Map(models.Model):
    page_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(Itinerary, on_delete=models.CASCADE)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    map_images =  models.ForeignKey(Images, on_delete=models.DO_NOTHING, null=True, blank=True)
    lat = models.CharField('lat', max_length=520)
    longt = models.CharField('longt', max_length=520)
    def __str__(self):
        return self.Page.page_title

class Map_Controls(models.Model):
    MC_id = models.AutoField(primary_key=True)
    zoom_for_home = models.DecimalField('Zoom For Home', max_digits=3, decimal_places=1, default=15.0)
    pin_zoom = models.DecimalField('Pin Zoom', max_digits=3, decimal_places=1, default=15.0)

class Lieu(models.Model):
    Lieu_id = models.AutoField(primary_key=True)
    Lieu_Description = RichTextField('Lieu Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class Bar(models.Model):
    Bar_id = models.AutoField(primary_key=True)
    Bar_Description = RichTextField('Bar Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class ChildrenEntertainment(models.Model):
    CE_id = models.AutoField(primary_key=True)
    CE_Description = RichTextField('CE Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class Resturant(models.Model):
    Resturant_id = models.AutoField(primary_key=True)
    Resturant_Description = RichTextField('Resturant Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class Shopping(models.Model):
    Shopping_id = models.AutoField(primary_key=True)
    Shopping_Description = RichTextField('Shopping Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class Toilets(models.Model):
    Toilet_id = models.AutoField(primary_key=True)
    Toilet_Description = RichTextField('Toilet Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class opening_hours(models.Model):
    oh_id = models.AutoField(primary_key=True)
    oh_Description = RichTextField('oh Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class tickets(models.Model):
    tickets_id = models.AutoField(primary_key=True)
    tickets_Description = RichTextField('tickets Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title

class transport(models.Model):
    transport_id = models.AutoField(primary_key=True)
    transport_Description = RichTextField('transport Description', max_length=2000, null=True, blank=True)
    Page = models.ForeignKey(Page, on_delete=models.CASCADE)
    def __str__(self):
        return self.Page.page_title
# class Menu_Images(models.Model):
#     menu_images_id  = models.AutoField(primary_key=True)
#     menu = models.ManyToManyField(Menu)
#     images = models.ManyToManyField(Images)

#     def int(self):
#         return self.menu_images_id
class Page_Description(models.Model):
    PD_id = models.AutoField(primary_key=True)
    page = models.ForeignKey(Page, on_delete=models.CASCADE)
    page_map = models.ForeignKey(Map, on_delete=models.DO_NOTHING, null=True, blank=True)
    page_title_image =  models.ForeignKey(Images, on_delete=models.DO_NOTHING, null=True, blank=True)
    page_Text  = RichTextField('Page Text', max_length=100000, default='NA')
    def __str__(self):
        return self.page.page_title

class Page_Image_Order(models.Model):
    PD_id = models.AutoField(primary_key=True)
    page_description = models.ForeignKey(Page_Description, on_delete=models.CASCADE)
    page_image = models.ForeignKey(Images, on_delete=models.CASCADE)
    appearnce_order = models.IntegerField('Appearnce Order', default=1)
    is_page_present = models.BooleanField(default=True)
    def __str__(self):
        return self.page_description.page.page_title

class Page_Before_After_Image_Order(models.Model):
    PD_id = models.AutoField(primary_key=True)
    page_description = models.ForeignKey(Page_Description, on_delete=models.CASCADE)
    page_image_before = models.ForeignKey(Images, on_delete=models.CASCADE, related_name="image_before")
    page_image_after = models.ForeignKey(Images, on_delete=models.CASCADE, related_name="image_after")
    is_page_in_present = models.BooleanField(default=True)
    appearnce_order_in_page = models.IntegerField('Appearnce Order Page', default=1)
    def __str__(self):
        return self.page_description.page.page_title

class Burger_Menu_Ordering(models.Model):
    BMO_id = models.AutoField(primary_key=True)
    itinerary = models.ForeignKey(Itinerary, on_delete=models.CASCADE)
    menu =  models.ForeignKey(Menu, 
                            on_delete=models.DO_NOTHING, 
                                null=True, 
                                blank=True,
                                limit_choices_to={'menu_type': 'Burger'},
                            )
    appearnce_order_in_burger_menu = models.IntegerField('Appearnce Order Burger Menu', default=1)
    def __str__(self):
            return self.itinerary.itinerary_name

class ITINERARY_Color_Scheme(models.Model):
    ICS_id = models.AutoField(primary_key=True)
    itinerary =  models.ForeignKey(Itinerary, 
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
    
class audios(models.Model):
    audio_id = models.AutoField(primary_key=True)
    audio_title = models.CharField('Audio Title', max_length=520 )
    audio_description = RichTextField('audio description', max_length=2000, default='NA') 
    audio_file = models.FileField(upload_to='media/chatou_auto/audio_files/')
    def __str__(self):
        return str(self.audio_file.url)

class audio_page(models.Model):
    ap_id = models.AutoField(primary_key=True)
    page_description = models.ForeignKey(Page_Description, on_delete=models.CASCADE)
    audio = models.ForeignKey(audios, on_delete=models.CASCADE)
    audio_appearnce_order = models.IntegerField('Audio Appearnce Order', default=1)
    is_audio_present_on_page = models.BooleanField(default=True)
    def __str__(self):
        return self.page_description.page.page_title + '-audio-'+self.audio.audio_file.url