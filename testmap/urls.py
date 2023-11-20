from django.urls import path
from . import views

urlpatterns = [
path('', views.test_google_map, name='googlemap'),
path('description/', views.description, name='description'),
]