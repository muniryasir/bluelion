# Generated by Django 2.2.6 on 2020-02-13 03:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('chatou_auto', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('menu_id', models.AutoField(primary_key=True, serialize=False)),
                ('menu_title', models.CharField(max_length=520, verbose_name='Menu Title')),
                ('menu_link', models.CharField(max_length=520, verbose_name='Menu Link')),
                ('menu_type', models.CharField(max_length=520, verbose_name='Menu Type')),
                ('itinerary', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='chatou_auto.Itinerary')),
            ],
        ),
    ]
