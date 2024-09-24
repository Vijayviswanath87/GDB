from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
from master.models import Project,Product,Work,Supervisor,Master,Relationship,Quartpint
import openpyxl
# Register your models here.


class ProjectAdmin(ImportExportModelAdmin):

    list_display = ['project_name', 'status']
    search_fields = ['project_name']

class ProductAdmin(ImportExportModelAdmin):

    list_display = ['product_category','product_status']
    search_fields = ['product_category']

class WorkAdmin(ImportExportModelAdmin):

    list_display = ['work_type','work_status']
    search_fields = ['work_type']
class SupervisorAdmin(ImportExportModelAdmin):

    list_display = ['supervisor_name','supervisor_status']
    search_fields = ['supervisor_name']

class MasterAdmin(ImportExportModelAdmin):

    list_display = ['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']
    search_fields =['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']


class RelationshipAdmin(ImportExportModelAdmin):

    list_display = ['master_id','project_size','project_unit_type']
    search_fields = ['master_id','project_size','project_unit_type','project_units']

class QuartpintAdmin(ImportExportModelAdmin):

    list_display = ['quarts','pints','others','project_total_units','project_total_gallons','project_cost_gallon']
    search_fields = ['quarts','pints','others']

admin.site.register(Project,ProjectAdmin)
admin.site.register(Product,ProductAdmin)
admin.site.register(Work,WorkAdmin)
admin.site.register(Supervisor,SupervisorAdmin)
admin.site.register(Master,MasterAdmin)
admin.site.register(Relationship,RelationshipAdmin)
admin.site.register(Quartpint,QuartpintAdmin)