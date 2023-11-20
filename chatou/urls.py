from django.urls import path
from . import views

urlpatterns = [
path('', views.home, name='home'),
path('introduction/', views.introduction, name='introduction'),
path('historique/', views.note_historique, name='historique'),
path('limpressionnisme/', views.limpressionnisme, name='limpressionnisme'),
path('impressionistes_a/', views.impressionistes_a, name='impressionistes_a'),
path('impressionistes_b/', views.impressionistes_b, name='impressionistes_b'),
path('author/', views.author, name='author'),
path('step0/', views.step_controller, name='step0'),
path('step1/', views.step_controller, name='step1'),
path('step2/', views.step_controller, name='step2'),
path('step3/', views.step_controller, name='step3'),
path('step4/', views.step_controller, name='step4'),
path('step5/', views.step_controller, name='step5'),
path('step6/', views.step_controller, name='step6'),
path('step7/', views.step_controller, name='step7'),
path('step8/', views.step_controller, name='step8'),
path('step9/', views.step_controller, name='step9'),
]