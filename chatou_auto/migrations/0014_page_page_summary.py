# Generated by Django 2.2.6 on 2020-03-11 08:28

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chatou_auto', '0013_itinerary_itinerary_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='page_Summary',
            field=ckeditor.fields.RichTextField(default='NA', max_length=100000, verbose_name='Page Summary'),
        ),
    ]
