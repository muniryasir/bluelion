from django.contrib import admin
from chatou_auto.models import Itinerary, Menu, Images,Page,Map,Lieu,Bar,ChildrenEntertainment,Resturant,Shopping
from chatou_auto.models import Page_Description, Page_Image_Order, Toilets, Page_Before_After_Image_Order,Burger_Menu_Ordering
from chatou_auto.models import ITINERARY_Color_Scheme, audios, audio_page, Map_Controls, opening_hours, tickets, transport

# Register your models here.
admin.site.register(Itinerary)
admin.site.register(Menu)
admin.site.register(Images)
admin.site.register(Page)
admin.site.register(Map)
admin.site.register(Lieu)
admin.site.register(Bar)
admin.site.register(ChildrenEntertainment)
admin.site.register(Resturant)
admin.site.register(Shopping)
admin.site.register(Toilets)
admin.site.register(audios)
admin.site.register(audio_page)
admin.site.register(Page_Description)
admin.site.register(Page_Image_Order)
admin.site.register(Page_Before_After_Image_Order)
admin.site.register(Burger_Menu_Ordering)
admin.site.register(ITINERARY_Color_Scheme)
admin.site.register(Map_Controls)
admin.site.register(opening_hours)
admin.site.register(transport)
admin.site.register(tickets)
# class ItineraryAdmin(admin.ModelAdmin):
#     list_display = ('Itinerary Name','Itinerary')