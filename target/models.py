from django.db import models
from master.models import Master,Project
# from master import models as master_models

# Create your models here.

class GdbTarget(models.Model):
    target_projectname = models.TextField()
    target_cpu = models.DecimalField(max_digits=10, decimal_places=2)
    target_cpg = models.DecimalField(max_digits=10, decimal_places=2)
    target = models.DecimalField(max_digits=10, decimal_places=2)
    target_project_id=models.ForeignKey('master.Project',related_name = 'project_ids',null=True,blank=True,on_delete=models.CASCADE)
    status = models.IntegerField(default=0)
    target_size = models.CharField(max_length=10,default='')

    # class Meta:
    #     managed = False
    #     db_table = 'gdb_target'
    def __str__(self):
        return str(self.target_projectname)