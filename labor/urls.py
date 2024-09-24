from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from django.conf.urls import url
from . import views
from django.contrib.auth import views as auth_views
# from django.urls import re_path

urlpatterns = [
	# path('', views.login,name='login'),
 #    path('login/', views.login,name='login'),
 #    path('logout/', views.logout,name='logout'),
 #    path('index/', views.index,name='index'),
    path('listing', views.index, name='listing'),
    path('ajax_fetch_labour_list',views.ajax_fetch_labour_list,name='ajax_fetch_labour_list'),
    path('edit_labour_list',views.edit_labour_list,name='edit_labour_list'),
    path('labor_import_data',views.labor_import_data,name='labor_import_data'),
    path('delete_labour_list/',views.delete_labour,name='delete_labour_list'),
    path('report_labour_list/',views.report_labour_list,name='report_labour_list'),
    path('download/<slug>',views.download,name='download'),
    # path('target_form', views.target_form, name='target_form'),
    
    # path('labour_cost/' ,views.total_labour_cost, name='labour_cost')

    

]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)+static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)