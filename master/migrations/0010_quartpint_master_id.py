# Generated by Django 2.1.7 on 2019-08-26 10:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('master', '0009_auto_20190826_1011'),
    ]

    operations = [
        migrations.AddField(
            model_name='quartpint',
            name='master_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='master.Master'),
        ),
    ]
