# Generated by Django 2.1.7 on 2019-08-27 06:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('master', '0010_quartpint_master_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='quartpint',
            name='others',
            field=models.IntegerField(default=0),
        ),
    ]
