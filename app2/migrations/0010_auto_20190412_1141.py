# Generated by Django 2.0.6 on 2019-04-12 06:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0009_bbmblood_blooddonarname'),
    ]

    operations = [
        migrations.AddField(
            model_name='bbmadmin',
            name='adminotp',
            field=models.CharField(default='', max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='bbmadmin',
            name='adminotptime',
            field=models.CharField(default='', max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='bbmbankmanager',
            name='managerotp',
            field=models.CharField(default='', max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='bbmbankmanager',
            name='managerotptime',
            field=models.CharField(default='', max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='bbmdonar',
            name='donarotp',
            field=models.CharField(default='', max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='bbmdonar',
            name='donarotptime',
            field=models.CharField(default='', max_length=255, null=True),
        ),
    ]