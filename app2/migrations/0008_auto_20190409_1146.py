# Generated by Django 2.0.6 on 2019-04-09 06:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0007_auto_20190409_1131'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bbmblood',
            name='bloodCode',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]
