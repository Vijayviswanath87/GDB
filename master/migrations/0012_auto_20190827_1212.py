# Generated by Django 2.1.7 on 2019-08-27 12:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('master', '0011_quartpint_others'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='relationship',
            name='project_cost_gallon',
        ),
        migrations.RemoveField(
            model_name='relationship',
            name='project_cost_unit',
        ),
        migrations.RemoveField(
            model_name='relationship',
            name='project_total_gallons',
        ),
        migrations.RemoveField(
            model_name='relationship',
            name='project_total_units',
        ),
        migrations.AddField(
            model_name='quartpint',
            name='project_cost_gallon',
            field=models.DecimalField(blank=True, decimal_places=3, max_digits=6, null=True),
        ),
        migrations.AddField(
            model_name='quartpint',
            name='project_cost_unit',
            field=models.DecimalField(blank=True, decimal_places=3, max_digits=6, null=True),
        ),
        migrations.AddField(
            model_name='quartpint',
            name='project_total_gallons',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='quartpint',
            name='project_total_units',
            field=models.IntegerField(default=0),
        ),
    ]
