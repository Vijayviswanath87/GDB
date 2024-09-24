# Generated by Django 2.1.7 on 2019-08-21 12:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('master', '0004_supervisor'),
    ]

    operations = [
        migrations.CreateModel(
            name='Master',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_date', models.DateField()),
                ('project_group', models.CharField(blank=True, max_length=100, null=True)),
                ('project_shift', models.CharField(blank=True, max_length=100, null=True)),
                ('project_q', models.CharField(blank=True, max_length=100, null=True)),
                ('project_whse', models.IntegerField(default=0)),
                ('project_tmp_labor_hrs', models.IntegerField(default=0)),
                ('project_gdb_labor_hrs', models.IntegerField(default=0)),
                ('project_tmp_labor_cost', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('project_gdb_labor_cost', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('project_total_labor_cost', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('project_description', models.TextField(null=True)),
                ('project_customer', models.CharField(blank=True, max_length=100, null=True)),
                ('master_status', models.CharField(choices=[('active', 'active'), ('inactive', 'inactive')], default='active', max_length=20)),
                ('product_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='master.Product')),
                ('project_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='master.Project')),
                ('supervisor_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='master.Supervisor')),
                ('work_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='master.Work')),
            ],
        ),
    ]
