# Generated by Django 2.2.6 on 2020-09-30 06:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commune_de_paris', '0012_auto_20200908_0235'),
    ]

    operations = [
        migrations.AddField(
            model_name='cdp_page_description',
            name='show_title_audio',
            field=models.BooleanField(default=True),
        ),
    ]