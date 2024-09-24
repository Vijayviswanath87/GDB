from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth import settings
from model_utils import Choices
user=settings.AUTH_USER_MODEL


class Project(models.Model):
        project_name=models.CharField(max_length=100,blank=True, null=True)
        eighteen_year_target=models.FloatField(null=True, blank=True, default=None)
        STATUS = Choices('active', 'inactive')
        status = models.CharField(choices=STATUS, default=STATUS.active, max_length=20)

        def __str__(self):
            return self.project_name
class Product(models.Model):
        product_category=models.CharField(max_length=100,blank=True, null=True)
        
        STATUS = Choices('active', 'inactive')
        product_status = models.CharField(choices=STATUS, default=STATUS.active, max_length=20)

        def __str__(self):
            return self.product_category
class Work(models.Model):
        work_type=models.CharField(max_length=100,blank=True, null=True)
        STATUS = Choices('active', 'inactive')
        work_status = models.CharField(choices=STATUS, default=STATUS.active, max_length=20)

        def __str__(self):
            return self.work_type

class Supervisor(models.Model):
        supervisor_name=models.CharField(max_length=100,blank=True, null=True)
        STATUS = Choices('active', 'inactive')
        supervisor_status = models.CharField(choices=STATUS, default=STATUS.active, max_length=20)

        def __str__(self):
            return self.supervisor_name

class Master(models.Model):
        project_date=models.DateField()
        project_group=models.CharField(max_length=100,blank=True, null=True)
        project_shift=models.CharField(max_length=100,blank=True, null=True)
        project_q=models.CharField(max_length=100,blank=True, null=True)
        # project_whse=models.IntegerField(default=0)
        project_whse=models.CharField(max_length=100,blank=True, null=True)
        size=models.CharField(max_length=100,blank=True, null=True)
        project_id=models.ForeignKey(Project,null=True,blank=True,on_delete=models.CASCADE)
        product_id=models.ForeignKey(Product,null=True,blank=True,on_delete=models.CASCADE)
        supervisor_id=models.ForeignKey(Supervisor,null=True,blank=True,on_delete=models.CASCADE)
        work_id=models.ForeignKey(Work,null=True,blank=True,on_delete=models.CASCADE)

       
        # project_tmp_labor_hrs=models.IntegerField(default=0)
        # project_gdb_labor_hrs=models.IntegerField(default=0)
        project_tmp_labor_hrs=models.FloatField(null=True, blank=True, default=None)
        project_gdb_labor_hrs=models.FloatField(null=True, blank=True, default=None)
        project_tmp_labor_cost=models.DecimalField(max_digits=6, decimal_places=2 ,blank=True, null=True)
        project_gdb_labor_cost=models.DecimalField(max_digits=6, decimal_places=2 ,blank=True, null=True)
        project_total_labor_cost=models.DecimalField(max_digits=6, decimal_places=2 ,blank=True, null=True)
        project_description=models.TextField(null=True)
        project_customer=models.CharField(max_length=100,blank=True, null=True)
        project_pl=models.DecimalField(max_digits=10, decimal_places=2 ,blank=True, null=True)
        eighteen_year_target=models.FloatField(null=True, blank=True, default=None)
        STATUS = Choices('active', 'inactive')
        master_status = models.CharField(choices=STATUS, default=STATUS.active, max_length=20)

        def __str__(self):
            return str(self.project_group)+" ("+str(self.project_id)+")" + "("+str(self.product_id)+")" +"("+str(self.work_id)+")"
        # def __unicode__(self):
        #     return self.species.species_english+" "+self.species.species+" "+" 'str(self.subspecies)'"
class Quartpint(models.Model):
        quarts=models.IntegerField(default=0)
        pints=models.IntegerField(default=0)
        others=models.IntegerField(default=0)
        project_total_units=models.IntegerField(default=0)
        # project_total_gallons=models.DecimalField(max_digits=6, decimal_places=3 ,blank=True, null=True)
        project_total_gallons=models.FloatField(null=True, blank=True, default=None)
        project_cost_gallon=models.DecimalField(max_digits=6, decimal_places=3 ,blank=True, null=True)
        project_cost_unit=models.DecimalField(max_digits=6, decimal_places=3 ,blank=True, null=True)
        master_id=models.ForeignKey(Master,null=True,blank=True,on_delete=models.CASCADE)
        def __str__(self):
            return str(self.quarts)+" ("+str(self.pints)+")" + "("+str(self.others)+")"+ "("+str(self.master_id)+")"

class Relationship(models.Model):


        project_size=models.IntegerField(default=0)
        project_unit_type=models.CharField(max_length=100,blank=True, null=True)
        project_units=models.IntegerField(default=0)
        
        master_id=models.ForeignKey(Master,null=True,blank=True,on_delete=models.CASCADE)
        quartpint_id=models.ForeignKey(Quartpint,null=True,blank=True,on_delete=models.CASCADE)
        STATUS = Choices('active', 'inactive')
        relationship_status = models.CharField(choices=STATUS, default=STATUS.active, max_length=20)

        def __str__(self):
            return self.project_unit_type