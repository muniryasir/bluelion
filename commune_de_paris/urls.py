from django.urls import path
from . import views
from django.views.generic import TemplateView

from django.conf import settings
from django.conf.urls.static import static
1
urlpatterns = [
path('', views.home, name='home'),
path('mapdata/', views.map_data2, name='mapdata'),
path('gcookie/',views.getcookie),
path('set_cookie/',views.setcookie),
path('get_cookie/',views.getregularcookie),
path('gmapcontrols/',views.get_map_controls),
path('preparepwa/',views.generateHtmlpages),
path('getmediafiles/',views.getImageFiles),
path('<slug:itinerary_name>/', views.itinerary_handler, name='itinerary_handler'),
path('<slug:itinerary_name>/<slug:step_name>', views.step_handler, name='step_handler'),
path( 'commune_sw.js',  TemplateView.as_view(template_name='commune_sw.js', content_type='application/javascript'),  name=views.ServiceWorkerView.name ),
path( '.well-known/assetlinks.json',  TemplateView.as_view(template_name='assetslinks.json', content_type='json'),  name=views.digitalAssetsLink.name ),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)