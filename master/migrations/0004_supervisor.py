# Generated by Django 2.1.7 on 2019-08-21 12:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('master', '0003_work'),
    ]

    operations = [
        migrations.CreateModel(
            name='Supervisor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('supervisor_name', models.CharField(blank=True, max_length=100, null=True)),
                ('supervisor_status', models.CharField(choices=[('active', 'active'), ('inactive', 'inactive')], default='active', max_length=20)),
            ],
        ),
    ]
