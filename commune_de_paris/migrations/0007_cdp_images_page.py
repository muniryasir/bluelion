# Generated by Django 2.2.6 on 2020-06-18 13:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('commune_de_paris', '0006_auto_20200614_2000'),
    ]

    operations = [
        migrations.AddField(
            model_name='cdp_images',
            name='Page',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='commune_de_paris.cdp_Page'),
        ),
    ]
