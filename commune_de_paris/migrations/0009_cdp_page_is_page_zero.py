# Generated by Django 2.2.6 on 2020-06-22 02:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commune_de_paris', '0008_auto_20200622_0151'),
    ]

    operations = [
        migrations.AddField(
            model_name='cdp_page',
            name='is_page_zero',
            field=models.BooleanField(default=True),
        ),
    ]
