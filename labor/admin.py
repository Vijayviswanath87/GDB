from django.contrib import admin
from labor.models import GdbLabour

# Register your models here.

from import_export.admin import ImportExportModelAdmin
from master.models import Project,Product,Work,Supervisor,Master,Relationship

# Register your models here.
# class HistoryAdmin(ImportExportModelAdmin):

#     list_display = ['name']
#     search_fields = ['name']

# class ProjectAdmin(ImportExportModelAdmin):

#     list_display = ['project_name', 'status']
#     search_fields = ['project_name']

# class ProductAdmin(ImportExportModelAdmin):

#     list_display = ['product_category','product_status']
#     search_fields = ['product_category']

# class WorkAdmin(ImportExportModelAdmin):

#     list_display = ['work_type','work_status']
#     search_fields = ['work_type']
# class SupervisorAdmin(ImportExportModelAdmin):

#     list_display = ['supervisor_name','supervisor_status']
#     search_fields = ['supervisor_name']

# class MasterAdmin(ImportExportModelAdmin):

#     list_display = ['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_size','project_unit_type','project_units','project_total_units','project_total_gallons','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']
#     search_fields =['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_size','project_unit_type','project_units','project_total_units','project_total_gallons','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']


# class ProjectAdmin(ImportExportModelAdmin):

#     list_display = ['project_name', 'status']
#     search_fields = ['project_name']

# class ProductAdmin(ImportExportModelAdmin):

#     list_display = ['product_category','product_status']
#     search_fields = ['product_category']

# class WorkAdmin(ImportExportModelAdmin):

#     list_display = ['work_type','work_status']
#     search_fields = ['work_type']
# class SupervisorAdmin(ImportExportModelAdmin):

#     list_display = ['supervisor_name','supervisor_status']
#     search_fields = ['supervisor_name']

# class MasterAdmin(ImportExportModelAdmin):

#     list_display = ['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']
#     search_fields =['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']


# class RelationshipAdmin(ImportExportModelAdmin):

#     list_display = ['master_id','project_size','project_unit_type','project_units','project_total_units','project_cost_gallon','project_cost_unit']
#     search_fields = ['master_id','project_size','project_unit_type','project_units','project_total_units','project_cost_gallon','project_cost_unit']




class GdbLabourAdmin(ImportExportModelAdmin):
	list_display = ['date','no_of_temp_labour','no_of_gdb_labour','temp_hours','gdb_hours','temp_cost','gdb_cost','labour_cost']
	search = ['date','no_of_temp_labour','no_of_gdb_labour','temp_hours','gdb_hours','temp_cost','gdb_cost','labour_cost']
	list_editable = ['no_of_temp_labour','no_of_gdb_labour']
	list_display_links = ['date']

	# def no_of_temp_labour(self, obj):
 #        if obj.no_of_temp_labour:
 #            return obj.no_of_temp_labour
 #        else:
 #            return 'Not Available'

 #    no_of_temp_labour.short_description = ''

# admin.site.register(History,HistoryAdmin)
# admin.site.register(Project,ProjectAdmin)
# admin.site.register(Product,ProductAdmin)
# admin.site.register(Work,WorkAdmin)
# admin.site.register(Supervisor,SupervisorAdmin)
# admin.site.register(Master,MasterAdmin)

# admin.site.register(Project,ProjectAdmin)
# admin.site.register(Product,ProductAdmin)
# admin.site.register(Work,WorkAdmin)
# admin.site.register(Supervisor,SupervisorAdmin)
# admin.site.register(Master,MasterAdmin)
# admin.site.register(Relationship,RelationshipAdmin)

admin.site.register(GdbLabour,GdbLabourAdmin)


# class MasterAdmin(ImportExportModelAdmin):

#     list_display = ['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_size','project_unit_type','project_units','project_total_units','project_total_gallons','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']
#     search_fields =['project_date', 'project_group','project_shift','project_id','product_id','supervisor_id','project_size','project_unit_type','project_units','project_total_units','project_total_gallons','project_tmp_labor_hrs','project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost']

# admin.site.register(Master,MasterAdmin)
