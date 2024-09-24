from django.contrib import admin
from django.urls import path ,include
from . import views

urlpatterns = [
	path('target_form/', views.target_form, name='target_form'),
	path('get_master_project_list/', views.master_project_list, name='get_master_project_list'),
	# path('target/', views.target, name='target'),
	path('', views.target_list_page, name='target'),
	path('target_list/', views.target_list, name='target_list'),
	path('edit_target_list',views.edit_target_list,name='edit_target_list'),
]