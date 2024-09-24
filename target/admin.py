from django.contrib import admin
from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from master.models import Project,Product,Work,Supervisor,Master,Relationship,Quartpint
# from labour.models import *
from target.models import GdbTarget
from labor.models import *


# Register your models here.

class GdbTargetAdmin(ImportExportModelAdmin):
	list_display = ['target_projectname','target_cpu','target_cpg','target','target_project_id']
	search = ['target_projectname','target_cpu','target_cpg','target','target_project_id']
	# list_editable = ['date','target_projectname','target_cpu','target_cpg','target','target_project_id']
	# list_display_links = ['date','target_projectname','target_cpu','target_cpg','target','target_project_id']

admin.site.register(GdbTarget,GdbTargetAdmin)
