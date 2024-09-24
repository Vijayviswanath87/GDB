from django.db import models
from django.contrib.auth import settings
from model_utils import Choices
# from master.models import *
# from model_utils import Choices

# Create your models here.

class GdbLabour(models.Model):
	date = models.DateField()
	no_of_temp_labour = models.IntegerField()
	no_of_gdb_labour = models.IntegerField()
	# temp_hours = models.IntegerField()
	# gdb_hours = models.IntegerField()
	temp_hours = models.FloatField(null=True, blank=True, default=None)
	gdb_hours = models.FloatField(null=True, blank=True, default=None)
	temp_cost = models.DecimalField(max_digits=10, decimal_places=3)
	gdb_cost = models.DecimalField(max_digits=10, decimal_places=3)
	labour_cost = models.DecimalField(max_digits=10, decimal_places=3)
	profit = models.DecimalField(max_digits=10, decimal_places=3,blank=True, null=True)
	loss = models.DecimalField(max_digits=10, decimal_places=3,blank=True, null=True)
	net_pl = models.DecimalField(max_digits=10, decimal_places=3,blank=True, null=True)

	class Meta:
		managed = False
		db_table = 'gdb_labour'