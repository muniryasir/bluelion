from django.contrib import admin
from commune_de_paris.models import *
from django.apps import apps

for model in apps.get_app_config('commune_de_paris').models.values():
    admin.site.register(model)