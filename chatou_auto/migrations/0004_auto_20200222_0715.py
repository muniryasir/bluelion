# Generated by Django 2.2.6 on 2020-02-22 07:15

import ckeditor.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('chatou_auto', '0003_images'),
    ]

    operations = [
        migrations.AddField(
            model_name='menu',
            name='menu_images',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='chatou_auto.Images'),
        ),
        migrations.AlterField(
            model_name='images',
            name='filename',
            field=models.ImageField(max_length=300, upload_to='media/chatou_auto/'),
        ),
        migrations.AlterField(
            model_name='images',
            name='image_name',
            field=models.CharField(default='NA', max_length=1000, verbose_name='image name'),
        ),
        migrations.AlterField(
            model_name='images',
            name='long_description',
            field=ckeditor.fields.RichTextField(default='NA', max_length=2000, verbose_name='long description'),
        ),
        migrations.AlterField(
            model_name='images',
            name='short_description',
            field=ckeditor.fields.RichTextField(default='NA', max_length=2000, verbose_name='short description'),
        ),
    ]
