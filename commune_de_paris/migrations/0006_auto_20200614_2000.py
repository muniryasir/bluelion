# Generated by Django 2.2.6 on 2020-06-14 20:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commune_de_paris', '0005_auto_20200526_1438'),
    ]

    operations = [
        migrations.AddField(
            model_name='cdp_images',
            name='image_type',
            field=models.CharField(choices=[('NORMAL_IMAGE', 'NORMAL_IMAGE'), ('INDEX_IMAGE', 'INDEX_IMAGE')], default='NORMAL_IMAGE', max_length=520, verbose_name='Image type'),
        ),
        migrations.AlterField(
            model_name='cdp_itinerary',
            name='itinerary_type',
            field=models.CharField(choices=[('INTRO', 'INTRODUCTION'), ('ITIN', 'ITINERARY'), ('ITIN_INDEX', 'ITINERARY_INDEX'), ('ITIN_NAME_INDEX', 'ITINERARY_NAME_INDEX')], default='ITIN', max_length=520, verbose_name='Itinerary type'),
        ),
    ]
