# Generated by Django 2.2.6 on 2020-02-24 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chatou_auto', '0006_auto_20200223_2234'),
    ]

    operations = [
        migrations.AlterField(
            model_name='page',
            name='page_type',
            field=models.CharField(max_length=520, verbose_name='Page Type'),
        ),
    ]
