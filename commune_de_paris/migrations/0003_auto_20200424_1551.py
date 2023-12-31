# Generated by Django 2.2.6 on 2020-04-24 15:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('commune_de_paris', '0002_auto_20200423_1212'),
    ]

    operations = [
        migrations.AddField(
            model_name='cdp_map_controls',
            name='itinerary',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='commune_de_paris.cdp_Itinerary'),
        ),
        migrations.AddField(
            model_name='cdp_map_controls',
            name='map_center',
            field=models.CharField(default='NA', max_length=520, verbose_name='Map Center'),
        ),
    ]
