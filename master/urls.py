"""mydjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from . import views
from django.contrib.auth import views as auth_views
# from django.urls import re_path


urlpatterns = [
    path('', views.login,name='login'),
    path('login/', views.login,name='login'),
    path('logout/', views.logout,name='logout'),
    path('index', views.index,name='index'),
    path('edit_list_home/', views.edit_list_home,name='edit_list_home'),
    path('edit_master/', views.edit_master,name='edit_master'),
    path('ajax_popup_unit_view/', views.ajax_popup_unit_view,name='ajax_popup_unit_view'),
    path('ajax_popup_unit_details/', views.ajax_popup_unit_details,name='ajax_popup_unit_details'),
    path('summary/', views.summary,name='summary'),
    path('edit_list_summary/', views.edit_list_summary,name='edit_list_summary'),
    path('edit_quartspints/', views.edit_quartspints,name='edit_quartspints'),
    path('savings_loss/', views.savings_loss,name='savings_loss'),
    path('savings_loss_list/', views.savings_loss_list,name='savings_loss_list'),
    path('master_pl_update/', views.master_pl_update,name='master_pl_update'),
    path('master_pl_update_to_labor/', views.master_pl_update_to_labor,name='master_pl_update_to_labor'),
    path('report/', views.report,name='report'),
    
    path('import_data/', views.import_data,name='import_data'),
    path('dashboard/', views.graph_representation,name='dashboard'),
    path('delete_master/', views.delete_master,name='delete_master'),    
    path('view_details/', views.view_details,name='view_details'),
    path('download/<slug>',views.download,name='download'),
    path('edit_master_last_year/', views.edit_master_last_year,name='edit_master_last_year'),
    
   
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)+static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)