# Generated by Django 2.0.6 on 2019-04-16 05:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0011_auto_20190412_1402'),
    ]

    operations = [
        migrations.AddField(
            model_name='bbmdonar',
            name='donarotp',
            field=models.CharField(default='', max_length=255, null=True),
        ),
    ]