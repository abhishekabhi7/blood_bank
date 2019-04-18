# Generated by Django 2.0.6 on 2019-04-08 07:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0005_auto_20190408_1217'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bbmadmin',
            name='adminid',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='app2.bbmUser1'),
        ),
        migrations.AlterField(
            model_name='bbmbankmanager',
            name='managerid',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='app2.bbmUser1'),
        ),
        migrations.AlterField(
            model_name='bbmdonar',
            name='donarid',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='app2.bbmUser1'),
        ),
    ]