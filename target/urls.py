from django.contrib import admin
from django.urls import path ,include
from . import views

urlpatterns = [
	path('target_form/', views.target_form, name='target_form'),
	path('get_master_project_list/', views.master_project_list, name='get_master_project_list'),
	# path('target/', views.target, name='target'),
	path('', views.target_form, name='target'),
	path('target_list/', views.target_list, name='target_list'),
	path('edit_target_list',views.edit_target_list,name='edit_target_list'),
	path('project_name_autocomplete',views.project_name_autocomplete,name='project_name_autocomplete'),
	path('modal_pop_form',views.modal_pop_form,name='modal_pop_form'),
	path('check_project_name_exists',views.check_project_name_exists,name='check_project_name_exists'),
	path('delete_target/',views.delete_project_target,name='delete_target'),
	
]