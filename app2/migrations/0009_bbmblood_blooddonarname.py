# Generated by Django 2.0.6 on 2019-04-09 06:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0008_auto_20190409_1146'),
    ]

    operations = [
        migrations.AddField(
            model_name='bbmblood',
            name='bloodDonarName',
            field=models.CharField(default='', max_length=255),
        ),
    ]
