# Generated by Django 2.2.6 on 2020-02-12 00:36

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Itinerary',
            fields=[
                ('itinerary_id', models.AutoField(primary_key=True, serialize=False)),
                ('itinerary_name', models.CharField(max_length=520, verbose_name='Itinerary Name')),
                ('itinerary_steps', models.IntegerField(default=0, verbose_name='Itinerary Steps')),
            ],
        ),
    ]