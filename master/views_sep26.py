#*****************************************************************************************
#  Project name : GDB
#  Filename : views.php
#  Developed by : Vijay.V
#*****************************************************************************************
from django.shortcuts import render,redirect,get_object_or_404
from django.conf import settings
from django.template import Context
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect
from django.core import serializers
from datetime import date, time


from django.utils.formats import date_format

# from django.core.serializers import serialize
from django import forms
from django.db import models
from django import forms
from .models import*
from .forms import*
from labour.models import *
from labour import views
from target.models import *
from target import views
from django.contrib import messages
from django.db.models import Count,Subquery,Sum,F,Max,Min,F,Value,FloatField, ExpressionWrapper,Q,DateTimeField
from django.db.models.functions import Cast

#Auth user & logout
from django.contrib.auth.models import User,Permission
from django.contrib import auth
from django.contrib.auth import update_session_auth_hash, authenticate, login as customlogin,logout as customlogout


#login/ajax check(csrf)/cache
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import cache_control
# from decimal import *
import decimal
from decimal import Decimal
import json
import openpyxl

import csv
import io
import re
import os
import pandas as pd 

from django.core.serializers.json import DjangoJSONEncoder
import datetime
import os
from django.conf import settings
from django.http import HttpResponse, Http404
# Create your views here.
def login(request):
    """
           Description: User Login
           Method:  POST 
           URL: login/

    """
    if request.user.is_authenticated:
       return redirect('index')
     
    else:
       if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            customlogin(request,user)
            current_user = request.user
            return redirect('/master/dashboard')
        else:
            messages.error(request,'username or password not correct')
            return redirect('login')
       else:
          form = LoginForm(request)

       context={
               'form': form
            }

    return render(request, 'login.html',context)

def logout(request):         
    for key in list(request.session.keys()):
        del request.session[key]
    auth.logout(request)
    return redirect('/master/login/')

@login_required
def index(request):      
  total_related_master_rel=Master.objects.filter(master_status='active').annotate(master_rel_count=Count('relationship__master_id')).values('relationship__project_unit_type')
  context={"relation":total_related_master_rel}
  return render(request, 'index.html',context)

@csrf_exempt
def edit_list_home(request):

  if request.method == "POST":
    
    # end_date=request.POST['max'].strftime("%Y-%m-%d")
    if request.POST['min'] =="":
       
       Master_qry=Master.objects.filter(master_status='active')
    else:
       # print(type(request.POST['min']))
       # start_date= datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
       # # print(start_date)
       # Master_qry=Master.objects.filter(master_status='active',project_date=start_date)
       if request.POST['min'] and request.POST['max']:
          month,date,year = request.POST['min'].split('/')          
          start_date =datetime.date(year=int(year),month=int(month),day=int(date))
          month,date,year = request.POST['max'].split('/')
          end_date = datetime.date(year=int(year),month=int(month),day=int(date))          
          Master_qry=Master.objects.filter(master_status='active',project_date__range=(start_date,end_date))
          # print(Master_qry)
       elif request.POST['min']:
          month,date,year = request.POST['min'].split('/')           
          Master_qry=Master.objects.filter(master_status='active',project_date__year=int(year), project_date__month=int(month))          
       elif request.POST['max'] and request.POST['max'] !='':
          # print("Hello")
          month,date,year = request.POST['max'].split('/')           
          Master_qry=Master.objects.filter(master_status='active',project_date__year=int(year), project_date__month=int(month))
    

    # var={"master_status":}
    total_related_master=Master_qry.annotate(master_rel_count=Count('relationship__master_id'),
         master_unit_count=Sum('relationship__project_units'),
         master_unit_done_count=Sum('quartpint__project_total_units'),
         master_qp_rel_count=Count('quartpint__master_id'),
         # master_gallon_done_count=Sum('quartpint__project_total_gallons'),
         # master_cost_gallon_count=Sum('quartpint__project_cost_gallon'),
         # master_cost_unit_count=Sum('quartpint__project_cost_unit'),
         master_units_total_gallon_cal=Sum(F('relationship__project_size') * F('relationship__project_units')),
         master_qp_total_gallon_cal=ExpressionWrapper(F('quartpint__quarts') * 0.25 + F('quartpint__pints') * 0.125 , output_field = FloatField()),
         master_units_cal=Sum('relationship__project_units'),
         master_qp_unit_cal=F('quartpint__quarts') + F('quartpint__pints')
         ).values('id','project_date','project_group','project_shift','project_q','project_whse','size','project_tmp_labor_hrs',
        'project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost','project_description','project_customer','master_status',
        'project_id_id__id','project_id_id__project_name','product_id_id__id','product_id_id__product_category','supervisor_id_id__id','supervisor_id_id__supervisor_name','work_id_id__id','work_id_id__work_type',
        'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__quarts','quartpint__pints',
        'master_rel_count','master_unit_count','master_unit_done_count','master_units_total_gallon_cal','master_qp_total_gallon_cal','relationship__project_unit_type',
        'master_units_cal','master_qp_unit_cal')
    # print(total_related_master.query)
    # master_count=total_related_master.aggregate(mcount=Count('id'))  ExpressionWrapper(F('quartpint__quarts') * 0.25 + F('quartpint__pints') * 0.125 , output_field = FloatField())
    # total_master_count=sum(master_count.values()) F('relationship__project_units')+F('quartpint__quarts')+F('quartpint__pints')
    # total_master_count=Master.objects.filter(master_status='active').annotate(master_units_total_gallon_cal=Sum(F('relationship__project_size') * F('relationship__project_units'))
    #      ,master_quarts=ExpressionWrapper(F('quartpint__quarts') * 0.25, output_field = FloatField()),master_pints=ExpressionWrapper(F('quartpint__pints') * decimal.Decimal(0.125), output_field = FloatField())).values('master_units_total_gallon_cal','master_quarts','master_pints','quartpint__quarts','quartpint__pints')
    # total_master_count=Master.objects.filter(master_status='active').annotate(master_units_total_gallon_cal=Sum('relationship__project_units'),master_qp_units=F('quartpint__quarts') + F('quartpint__pints')).values('master_units_total_gallon_cal','quartpint__quarts','quartpint__pints','master_qp_units')
   
    results = []
    i=int(0)
    for master_relation in total_related_master:
          master_json = {}
          # master_json['project_whse'] = master_relation['project_whse']
          # master_json['project_shift'] = master_relation['project_shift']
          master_json['id'] = master_relation['id']
          master_json['project_date'] = master_relation['project_date'].strftime("%m/%d/%Y")
          master_json['project_shift'] = master_relation['project_shift']
          master_json['project_group'] = master_relation['project_group']
          master_json['project_q'] = master_relation['project_q']
          master_json['project_whse'] = master_relation['project_whse']
          master_json['size'] = master_relation['size']
          master_json['project_name'] = master_relation['project_id_id__project_name']
          master_json['supervisor_name'] = master_relation['supervisor_id_id__supervisor_name']
          master_json['product_category'] = master_relation['product_id_id__product_category']

          master_json['project_tmp_labor_hrs'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(master_relation['project_tmp_labor_hrs'])+'</span><input type="hidden" name="master_id_'+str(i)+'_1" id="master_id_'+str(i)+'_1" value="'+str(master_relation['id'])+'"><input type="hidden" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(master_relation['project_tmp_labor_hrs'])+'"><input type="hidden" name="temp_labor_field_'+str(i)+'_1" id="temp_labor_field_'+str(i)+'_1" value="'+str('project_tmp_labor_hrs')+'">'
          master_json['project_gdb_labor_hrs'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(master_relation['project_gdb_labor_hrs'])+'</span><input type="hidden" name="master_id_'+str(i)+'_1" id="master_id_'+str(i)+'_1" value="'+str(master_relation['id'])+'"><input type="hidden" name="gdb_labor_'+str(i)+'_1" id="gdb_labor_'+str(i)+'_1" value="'+str(master_relation['project_gdb_labor_hrs'])+'"><input type="hidden" name="gdb_labor_field_'+str(i)+'_1" id="gdb_labor_field_'+str(i)+'_1" value="'+str('project_gdb_labor_hrs')+'">'
          master_json['project_tmp_labor_cost'] = master_relation['project_tmp_labor_cost']
          master_json['project_gdb_labor_cost'] = master_relation['project_gdb_labor_cost']
          master_json['project_total_labor_cost'] = master_relation['project_total_labor_cost']

          master_json['related_unit_count'] = master_relation['master_rel_count']
          master_json['unit_count'] = master_relation['master_unit_count']
          master_json['relationship__project_unit_type'] = master_relation['relationship__project_unit_type']
          

          
          try:
            master_json['master_qp_total_gallon_cal'] = float(master_relation['master_qp_total_gallon_cal'])
          except Exception:
            master_json['master_qp_total_gallon_cal'] = 0

          try:
            master_json['master_qp_unit_cal'] = master_relation['master_qp_total_gallon_cal']
          except Exception:
            master_json['master_qp_unit_cal'] = 0

          print(type(master_relation['master_units_total_gallon_cal']),"TYPE CHECK")
          master_json['master_units_total_gallon_cal']=master_relation['master_units_total_gallon_cal'] if master_relation['master_units_total_gallon_cal'] is not None else 0
          master_json['cost_per_unit'] =float(master_relation['quartpint__project_cost_unit']) if master_relation['quartpint__project_cost_unit'] is not None else 0
          
          master_json['unit_done_count'] = master_relation['master_units_cal'] + master_relation['master_qp_unit_cal']  if str(master_json['relationship__project_unit_type'])== 'G'  else master_relation['quartpint__project_total_units']

          master_json['gallon_done_count'] = master_json['master_units_total_gallon_cal'] + master_json['master_qp_total_gallon_cal']
          
          master_json['master_cost_unit_count'] = float(master_relation['project_total_labor_cost']) / float(master_json['unit_done_count']) if master_json['unit_done_count'] is not None and master_json['unit_done_count']!=0 else master_json['cost_per_unit']
          
          master_json['master_cost_gallon_count'] = float(master_relation['project_total_labor_cost']) / float(master_json['gallon_done_count']) if float(master_json['gallon_done_count']) > 0 else 0
          
          i=i+1


          results.append(master_json)

     # print(master_relation['master_cost_gallon_count'])    
    # print(total_related_master)
          
    final_results = {}
    # final_master_json = {}
 
    final_results['data'] = results
    json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)

    # print(total_related_master)

    return HttpResponse(json_data,content_type = "application/json")




@csrf_exempt
def ajax_popup_unit_view(request):

  if request.method == "POST":

    master_relation_id=request.POST['m_id']
    master_project_name=request.POST['p_name']
    unit_type=request.POST['unit_type']
    print(request.POST['unit_type'])
    total_relationships= Quartpint.objects.filter(master_id=master_relation_id).annotate(quarts_count=Count('quarts'),pintss_count=Count('pints'),others_count=Count('others')).values('id','quarts','pints','others','quarts_count','pintss_count','others_count','project_total_units','project_total_gallons').distinct()
    context={'master_id':master_relation_id,"master_project_name":master_project_name,"gallon_unit":total_relationships,'unit_type':unit_type}
    # print(total_relationships)
  return render(request, 'popup_unit_detail.html',context)


@csrf_exempt
def ajax_popup_unit_details(request):
   if request.method == "POST":

      master_relation_id=request.POST['m_id']

      
      total_relationship=Relationship.objects.values(
          'id','project_size','project_unit_type',
          'project_units','quartpint_id_id__quarts').annotate(dcount=Sum('master_id'),q_count=Sum('quartpint_id_id')).filter(master_id=master_relation_id)


      results = []

      # gallon = [] {quarts:10,pints:5}
      i=int(0)
      for relationship_rel in total_relationship:
              relationship_json = {}

              relationship_json['id'] = relationship_rel['id']

              # relationship_rel['project_size'] != 1 else 0

              relationship_json['project_size'] = relationship_rel['project_size'] if relationship_rel['project_unit_type'] =='G' else ''

              relationship_json['project_unit_type'] = relationship_rel['project_unit_type'] if relationship_rel['project_unit_type'] =='G' else ''
              # relationship_json['project_units'] = relationship_rel['project_units'] if relationship_rel['project_unit_type'] =='G' else ''
              if relationship_rel['project_unit_type'] =='G':
                 relationship_json['project_units'] ='<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(relationship_rel['project_units'])+'</span><input type="hidden" name="master_id_'+str(i)+'_1" id="master_id_'+str(i)+'_1" value="'+str(relationship_rel['id'])+'"><input type="hidden" name="master_units_'+str(i)+'_1" id="master_units_'+str(i)+'_1" value="'+str(relationship_rel['project_units'])+'"><input type="hidden" name="master_units_field_'+str(i)+'_1" id="master_units_field_'+str(i)+'_1" value="'+str('project_units')+'">'
              else: 
                 relationship_json['project_units'] = ''
              relationship_json['project_total_units'] = ''
              relationship_json['project_new'] = ''
              i=i+1
              results.append(relationship_json)


      

        
      final_relationship_results = {}
     
      final_relationship_results['data'] = results
      # print(results)
      # final_relationship_results['gallon'] = gallon_unit
      json_relationship_data = json.dumps (final_relationship_results ,cls=DjangoJSONEncoder)
      
      return HttpResponse(json_relationship_data,content_type = "application/json")


      # return render(request, 'popup_unit_detail.html',context)

@csrf_exempt
def edit_master(request):

  
    if request.method == "GET":

        m_id=request.GET['id']
        clicked_field=request.GET['clicked_label']
        clicked_value=request.GET['clicked_value']
        
        
        # print(select_master.project_gdb_labor_cost)

        #----- Labor Calculation------------

    if clicked_field == "project_tmp_labor_hrs" or clicked_field=="project_gdb_labor_hrs":
        select_master=Master.objects.get(id=m_id)
        if clicked_field=="project_tmp_labor_hrs":
           
           tmp_labor_cost_update_value =int(clicked_value) *  14.50
           total_labor_cost_update_value=float(tmp_labor_cost_update_value)+float(select_master.project_gdb_labor_cost)
           updat = {'project_tmp_labor_hrs': clicked_value,'project_tmp_labor_cost': tmp_labor_cost_update_value,'project_total_labor_cost':total_labor_cost_update_value}

        if clicked_field=="project_gdb_labor_hrs":
           
           gdb_labor_cost_update_value =int(clicked_value) *  11.00
           total_labor_cost_update_value=float(gdb_labor_cost_update_value)+float(select_master.project_tmp_labor_cost)
           updat = {'project_gdb_labor_hrs': clicked_value,'project_gdb_labor_cost': gdb_labor_cost_update_value,'project_total_labor_cost':total_labor_cost_update_value}
        
        update_master=Master.objects.filter(id=m_id).update(**updat)
        if(update_master):
              # print("I AM IN")
              select_relationship=Master.objects.filter(master_status='active',id=m_id).annotate(master_rel_count=Count('relationship__master_id'),
                 master_unit_count=Sum('relationship__project_units'),
                 master_unit_done_count=Sum('quartpint__project_total_units'),
                 master_qp_rel_count=Count('quartpint__master_id'),
                 master_rel_unit_type=Sum('relationship__project_unit_type'),
                 master_sum_project_total_labor_cost=Sum('project_total_labor_cost'),
                 master_sum_project_tmp_labor_cost=Sum('project_tmp_labor_cost'),
                 master_sum_project_gdb_labor_cost=Sum('project_gdb_labor_cost'),
                 master_sum_project_tmp_labor_hrs=Sum('project_tmp_labor_hrs'),
                 master_sum_project_gdb_labor_hrs=Sum('project_gdb_labor_hrs'),
                 # master_gallon_done_count=Sum('quartpint__project_total_gallons'),
                 # master_cost_gallon_count=Sum('quartpint__project_cost_gallon'),
                 # master_cost_unit_count=Sum('quartpint__project_cost_unit'),
                 master_units_total_gallon_cal=Sum(F('relationship__project_size') * F('relationship__project_units')),
                 master_qp_total_gallon_cal=ExpressionWrapper(F('quartpint__quarts') * 0.25 + F('quartpint__pints') * 0.125 , output_field = FloatField()),
                 master_units_cal=Sum('relationship__project_units'),
                 master_qp_unit_cal=F('quartpint__quarts') + F('quartpint__pints')
                 ).values('id','project_date','project_group','project_shift','project_q','project_whse','size','project_tmp_labor_hrs',
                'project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost','project_description','project_customer','master_status',
                'project_id_id__id','project_id_id__project_name','product_id_id__id','product_id_id__product_category','supervisor_id_id__id','supervisor_id_id__supervisor_name','work_id_id__id','work_id_id__work_type',
                'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__quarts','quartpint__pints',
                'master_rel_count','master_unit_count','master_unit_done_count','master_units_total_gallon_cal','master_qp_total_gallon_cal','relationship__project_unit_type',
                'master_units_cal','master_qp_unit_cal','master_rel_unit_type',
                'master_sum_project_total_labor_cost','master_sum_project_tmp_labor_cost',
                'master_sum_project_gdb_labor_cost','master_sum_project_tmp_labor_hrs','master_sum_project_gdb_labor_hrs')



              # results = []
              # print(select_relationship)
              working=updat;
              for master_relation in select_relationship:
                    # master_json={}
            
                    try:
                      master_qp_total_gallon_cal = float(master_relation['master_qp_total_gallon_cal'])
                    except Exception:
                      master_qp_total_gallon_cal = 0

                    try:
                      master_qp_unit_cal = master_relation['master_qp_unit_cal']
                    except Exception:
                      master_qp_unit_cal = 0

                    
                    cost_per_unit =float(master_relation['quartpint__project_cost_unit']) if master_relation['quartpint__project_cost_unit'] is not None else 0
          
                    unit_done_count = master_relation['master_units_cal'] + master_qp_unit_cal  if str(master_relation['relationship__project_unit_type'])== 'G'  else master_relation['quartpint__project_total_units']

                    gallon_done_count= int(master_relation['master_units_total_gallon_cal']) + master_qp_total_gallon_cal
                    
                    master_cost_unit_count= float(master_relation['project_total_labor_cost']) / float(unit_done_count) if float(unit_done_count) > 0 else cost_per_unit
                    
                    master_cost_gallon_count= float(master_relation['project_total_labor_cost']) / float(gallon_done_count) if float(gallon_done_count) > 0 else 0
                    if master_relation['relationship__project_unit_type']== "others":
                       updat_labor={'project_total_units':unit_done_count,'project_cost_unit':master_cost_unit_count}
                    else:
                       updat_labor={'project_total_units':unit_done_count,'project_total_gallons':gallon_done_count,'project_cost_unit':master_cost_unit_count,'project_cost_gallon':master_cost_gallon_count}
                    
                    # updat={'project_total_units':unit_done_count,'project_total_gallons':gallon_done_count,'project_cost_unit':master_cost_unit_count,'project_cost_gallon':master_cost_gallon_count}
                    update_master=Quartpint.objects.filter(master_id=master_relation['id']).update(**updat_labor)
                    print(master_relation['relationship__project_unit_type'])
                    # working=updat;
                    return JsonResponse({'success':working})
        else:
             working='No it"s not working';
        return JsonResponse({'success':working})


        #-------- Labor Calculation --------------
    if clicked_field=="project_units":


           updat_unit = {'project_units': clicked_value}
       
           update_relationship=Relationship.objects.filter(id=m_id).update(**updat_unit)
           if(update_relationship):

              select_relationship=Master.objects.filter(master_status='active').annotate(master_rel_count=Count('relationship__master_id'),
                 master_unit_count=Sum('relationship__project_units'),
                 master_unit_done_count=Sum('quartpint__project_total_units'),
                 master_qp_rel_count=Count('quartpint__master_id'),
                 master_rel_unit_type=Sum('relationship__project_unit_type'),
                 # master_gallon_done_count=Sum('quartpint__project_total_gallons'),
                 # master_cost_gallon_count=Sum('quartpint__project_cost_gallon'),
                 # master_cost_unit_count=Sum('quartpint__project_cost_unit'),
                 master_units_total_gallon_cal=Sum(F('relationship__project_size') * F('relationship__project_units')),
                 master_qp_total_gallon_cal=ExpressionWrapper(F('quartpint__quarts') * 0.25 + F('quartpint__pints') * 0.125 , output_field = FloatField()),
                 master_units_cal=Sum('relationship__project_units'),
                 master_qp_unit_cal=F('quartpint__quarts') + F('quartpint__pints')
                 ).values('id','project_date','project_group','project_shift','project_q','project_whse','size','project_tmp_labor_hrs',
                'project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost','project_description','project_customer','master_status',
                'project_id_id__id','project_id_id__project_name','product_id_id__id','product_id_id__product_category','supervisor_id_id__id','supervisor_id_id__supervisor_name','work_id_id__id','work_id_id__work_type',
                'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__quarts','quartpint__pints',
                'master_rel_count','master_unit_count','master_unit_done_count','master_units_total_gallon_cal','master_qp_total_gallon_cal','relationship__project_unit_type',
                'master_units_cal','master_qp_unit_cal','master_rel_unit_type')



              # results = []
              # print(select_relationship)
              working='No it"s not working';
              for master_relation in select_relationship:
                    # master_json={}
            
                    try:
                      master_qp_total_gallon_cal = float(master_relation['master_qp_total_gallon_cal'])
                    except Exception:
                      master_qp_total_gallon_cal = 0

                    try:
                      master_qp_unit_cal = master_relation['master_qp_unit_cal']
                    except Exception:
                      master_qp_unit_cal = 0

                    
                    cost_per_unit =float(master_relation['quartpint__project_cost_unit']) if master_relation['quartpint__project_cost_unit'] is not None else 0
          
                    unit_done_count = master_relation['master_units_cal'] + master_qp_unit_cal  if str(master_relation['relationship__project_unit_type'])== 'G'  else master_relation['quartpint__project_total_units']

                    gallon_done_count= int(master_relation['master_units_total_gallon_cal']) + master_qp_total_gallon_cal
                    
                    master_cost_unit_count= float(master_relation['project_total_labor_cost']) / float(unit_done_count) if float(unit_done_count) > 0 else cost_per_unit
                    
                    master_cost_gallon_count= float(master_relation['project_total_labor_cost']) / float(gallon_done_count) if float(gallon_done_count) > 0 else 0
                    
                    updat={'project_total_units':unit_done_count,'project_total_gallons':gallon_done_count,'project_cost_unit':master_cost_unit_count,'project_cost_gallon':master_cost_gallon_count}
                    update_master=Quartpint.objects.filter(master_id=master_relation['id']).update(**updat)
                    # print(updat)
                    working=updat;
                    return JsonResponse({'success':working})
           else:
             working='No it"s not working';
           return JsonResponse({'success':working})
           # print(updat_unit)

 
    

@csrf_exempt
def edit_quartspints(request):
      if request.method == "GET":
        get_val=request.GET['get_val']

        qp_id=request.GET['qp_id']

        if get_val == "quarts":
          
          quarts_value=request.GET['quarts_value']
          0 if quarts_value =='' else quarts_value
          updat_qp = {'quarts': quarts_value}

        if get_val == "pints":
  
          pints_value=request.GET['pints_value']
          0 if pints_value =='' else pints_value
          updat_qp = {'pints': pints_value}

        if get_val == "others":
  
          others_value=request.GET['others_value']
          0 if others_value =='' else others_value
          updat_qp = {'project_total_units': others_value}
         

          
      quartspints_value =Quartpint.objects.filter(id=qp_id).update(**updat_qp)
      if quartspints_value:
        # print(updat_qp)
        select_relationship=Master.objects.filter(master_status='active').filter(relationship__quartpint_id=qp_id).annotate(master_rel_count=Count('relationship__master_id'),
           master_unit_count=Sum('relationship__project_units'),
           master_unit_done_count=Sum('quartpint__project_total_units'),
           master_qp_rel_count=Count('quartpint__master_id'),
           master_rel_unit_type=Sum('relationship__project_unit_type'),

           # master_gallon_done_count=Sum('quartpint__project_total_gallons'),
           # master_cost_gallon_count=Sum('quartpint__project_cost_gallon'),
           # master_cost_unit_count=Sum('quartpint__project_cost_unit'),
           master_units_total_gallon_cal=Sum(F('relationship__project_size') * F('relationship__project_units')),
           master_qp_total_gallon_cal=ExpressionWrapper(F('quartpint__quarts') * 0.25 + F('quartpint__pints') * 0.125 , output_field = FloatField()),
           master_units_cal=Sum('relationship__project_units'),
           master_qp_unit_cal=F('quartpint__quarts') + F('quartpint__pints')
           ).values('id','project_date','project_group','project_shift','project_q','project_whse','size','project_tmp_labor_hrs',
          'project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost','project_description','project_customer','master_status',
          'project_id_id__id','project_id_id__project_name','product_id_id__id','product_id_id__product_category','supervisor_id_id__id','supervisor_id_id__supervisor_name','work_id_id__id','work_id_id__work_type',
          'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__quarts','quartpint__pints',
          'master_rel_count','master_unit_count','master_unit_done_count','master_units_total_gallon_cal','master_qp_total_gallon_cal','relationship__project_unit_type',
          'master_units_cal','master_qp_unit_cal','master_rel_unit_type')



        # results = []
        # print(select_relationship)
        results=updat_qp
        working='No it"s not working';
        for master_relation in select_relationship:
              # master_json={}
      
          try:
            master_qp_total_gallon_cal = float(master_relation['master_qp_total_gallon_cal'])
          except Exception:
            master_qp_total_gallon_cal = 0

          try:
            master_qp_unit_cal = master_relation['master_qp_unit_cal']
          except Exception:
            master_qp_unit_cal = 0

          
          cost_per_unit =float(master_relation['quartpint__project_cost_unit']) if master_relation['quartpint__project_cost_unit'] is not None else 0

          unit_done_count = master_relation['master_units_cal'] + master_qp_unit_cal  if str(master_relation['relationship__project_unit_type'])== 'G'  else master_relation['quartpint__project_total_units']

          gallon_done_count= int(master_relation['master_units_total_gallon_cal']) + master_qp_total_gallon_cal
          
          master_cost_unit_count= float(master_relation['project_total_labor_cost']) / float(unit_done_count) if float(unit_done_count) > 0 else cost_per_unit
          
          master_cost_gallon_count= float(master_relation['project_total_labor_cost']) / float(gallon_done_count) if float(gallon_done_count) > 0 else 0
          
          if get_val== "others":
             updat={'project_total_units':unit_done_count,'project_cost_unit':master_cost_unit_count}
          else:
             updat={'project_total_units':unit_done_count,'project_total_gallons':gallon_done_count,'project_cost_unit':master_cost_unit_count,'project_cost_gallon':master_cost_gallon_count}
          update_master=Quartpint.objects.filter(id=qp_id).update(**updat)
          # print(master_relation['relationship__project_unit_type'])
          # results.append(updat)
          working=updat;
          # print(results)
          
        return JsonResponse(results)
      else:
        working='No it"s not working';
        return JsonResponse({'success':working})
      # return JsonResponse(updat_qp)


@csrf_exempt
def summary(request):
    total_related_labor=GdbLabour.objects.filter(date='2019-04-01').values('id','date','labour_cost','no_of_temp_labour','no_of_gdb_labour')
    total_related_master=Master.objects.filter(project_date='2019-04-01').annotate(master_rel_count=Count('relationship__master_id'),
         # master_unit_count=Sum('relationship__project_units'),
         # master_total_labor_cost=Sum('project_total_labor_cost'),
         
         master_gallon_done_count=Count('quartpint__project_total_gallons'),
         master_unit_done_count=Sum('quartpint__project_total_units'),
         # master_cost_per_gallon=Sum('quartpint__project_cost_gallon'),
         # master_cost_per_unit=Sum('quartpint__project_cost_unit'),
         # master_qp_rel_count=Count('quartpint__master_id'),
         summary_rel_count=Count('project_id_id__project_ids'),
         pl_gallon=(F('project_id_id__project_ids__target') - F('quartpint__project_cost_gallon')) * F('quartpint__project_total_gallons'),
         pl_units=Count(F('project_id_id__project_ids__target') - F('quartpint__project_cost_unit') * F('quartpint__project_total_units'),output_field=FloatField())
         ).values('pl_gallon','pl_units','project_id_id__project_ids__target','quartpint__project_cost_gallon')
    # print(total_related_master)
    context={"labour_list":total_related_labor,'pl_net':total_related_master}
    return render(request,'everyday_summary.html',context)

@csrf_exempt
def report(request):
  if request.method == "POST":
    
    # end_date=request.POST['max'].strftime("%Y-%m-%d")
    # print(request.POST['min'])
    if request.POST['min'] =="":
       # print("oNE")
       Labor_qry=GdbLabour.objects.filter(date='2019-04-01')
    else:
       # print(type(request.POST['min']))
       # print("tWO")
       start_date= datetime.datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
       # print(start_date)
       Labor_qry=GdbLabour.objects.filter(date=start_date)
    total_related_labor=Labor_qry.values('id','date','labour_cost','no_of_temp_labour','no_of_gdb_labour')
    results = []
    for labor_relation in total_related_labor:
          labor_json = {}
          # master_json['project_whse'] = master_relation['project_whse']
          # master_json['project_shift'] = master_relation['project_shift']
          labor_json['id'] = labor_relation['id']
          labor_json['report_date'] = labor_relation['date'].strftime("%m/%d/%Y")
         
          labor_json['report_labour_cost'] = labor_relation['labour_cost']
          labor_json['report_no_of_temp_labour'] = labor_relation['no_of_temp_labour']
          labor_json['report_no_of_gdb_labour'] = labor_relation['no_of_gdb_labour']

          results.append(labor_json)
    final_results = {}
    final_results['data'] = results
    json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)

    # print(total_related_master)

    return HttpResponse(json_data,content_type = "application/json")

@csrf_exempt
def edit_list_summary(request):
   if request.method == "POST":
    
    # end_date=request.POST['max'].strftime("%Y-%m-%d")
    # print(request.POST['min'])
    if request.POST['min'] =="":
       # print("oNE")
       Project_qry=Project.objects.filter(master__project_date='2019-04-01')
    else:
       # print(type(request.POST['min']))
       # print("tWO")
       start_date= datetime.datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
       # print(start_date)
       Project_qry=Project.objects.filter(master__project_date=start_date)
    total_related_project=Project_qry.select_related('master__project_id').select_related('master__quartpint__master_id').annotate(master_total_labor_cost=Sum('master__project_total_labor_cost'),
        master_unit_done_count=Sum('master__quartpint__project_total_units'),
        master_gallon_done_count=Sum('master__quartpint__project_total_gallons'),
        master_cost_per_gallon=Sum('master__quartpint__project_cost_gallon'),
        master_cost_per_unit=Sum('master__quartpint__project_cost_unit'),

        dcount=Count('id'),
        dcount_master=Count('master'),
        others=Count('master__quartpint__others')
       
        ).values('id','project_name',
        'master_total_labor_cost',
        'master_unit_done_count','master_gallon_done_count','master_cost_per_gallon','master_cost_per_unit',
        'others','project_ids__target','dcount_master')

    # print(total_related_project.query)

      
      # master_count=total_related_master.aggregate(mcount=Count('id'))
      # total_master_count=sum(master_count.values())
    results = []
    for master_relation in total_related_project:
          master_json = {}

          master_json['id'] = master_relation['dcount_master']
         
          master_json['project_name'] = master_relation['project_name']

          master_json['master_total_labor_cost'] = float(master_relation['master_total_labor_cost']) if master_relation['master_total_labor_cost']!=None else 0
          print(master_relation['master_total_labor_cost'],"PROJECT NAME===>",master_relation['project_name'],"COUNT ==>")
          master_json['unit_done_count'] = master_relation['master_unit_done_count'] if master_relation['master_unit_done_count']!=None else 0
          master_json['gallon_done_count'] = master_relation['master_gallon_done_count'] if master_relation['master_gallon_done_count']!=None else 0
          master_json['master_cost_per_gallon'] = master_relation['master_cost_per_gallon'] if master_relation['master_cost_per_gallon']!=None else 0
          master_json['master_cost_per_unit'] = master_relation['master_cost_per_unit'] if master_relation['master_cost_per_unit']!=None else 0
          master_json['summary_target'] = float(master_relation['project_ids__target']) if master_relation['project_ids__target']!=None else 0
          # master_json['unit_type'] = master_relation['master__relationship__project_unit_type']

          if master_json['project_name'] =="CUT & COMP":
             master_json['last_year']='$0.38'
          elif master_json['project_name'] =="Ollie's Aerosol Sorting":
             master_json['last_year']='$0.17'
          elif master_json['project_name'] =="Compactor":
             master_json['last_year']='$0.05'
          elif master_json['project_name'] =="Roller Cover Sleeving":
             master_json['last_year']='$0'
          elif master_json['project_name'] =="Roller Sorting":
             master_json['last_year']='$0.08'
          elif master_json['project_name'] =="Applicator Stickering":
             master_json['last_year']='$0.14'
          elif master_json['project_name'] =="Aerosol Stickering":
             master_json['last_year']='$0.05'
             
          else:
             master_json['last_year']='$0'
          # master_json['last_year']='$'
          if master_relation['others']=='':
             master_json['minus_pl_gallon']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_gallon']),2)
             master_json['multi_pl_gallon']=round(float(master_json['minus_pl_gallon']),2) * round(float(master_json['gallon_done_count']),2)
             master_json['pl_color']=round(float(master_json['multi_pl_gallon']),2)
          else:
             master_json['minus_pl_unit']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_unit']),2)
             master_json['multi_pl_unit']=round(float(master_json['minus_pl_unit']),2) * round(float(master_json['unit_done_count']),2)
             master_json['pl_color']=round(float(master_json['multi_pl_unit']),2)
             
          # if master_json['unit_type'] =='G':
            
          # else:
             

          if master_json['pl_color'] > 0:
             master_json['profit']=master_json['pl_color']
             master_json['pl']='<span style=color:green;  class=\'green_values\'>$'+str(master_json['pl_color'])+'</span><input type="hidden" name="hid_green[]" class=\'green_hid_class\' value="'+str(master_json['pl_color'])+'"><input type="hidden" name="hid_green_master_id[]" value="'+str(master_json['id'])+'">'
            
          else:
              master_json['loss']=master_json['pl_color']
              master_json['pl']='<span style=color:red; class=\'red_values\'>$'+str(master_json['pl_color'])+'</span><input type="hidden" name="hid_red[]" class=\'red_hid_class\' value="'+str(master_json['pl_color'])+'"><input type="hidden" name="hid_red_master_id[]" value="'+str(master_json['id'])+'">'

   
          

          results.append(master_json)

     # print(master_relation['master_cost_gallon_count'])    
    # print(total_related_master)
    # print(total_related_master)
    final_results = {}
    # final_master_json = {}
 
    final_results['data'] = results
    json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)

    # print(total_related_master)

    return HttpResponse(json_data,content_type = "application/json")


# @csrf_exempt
# def edit_list_summary(request):
#    if request.method == "POST":
    
#     # end_date=request.POST['max'].strftime("%Y-%m-%d")
#     # print(request.POST['min'])
#     if request.POST['min'] =="":
#        # print("oNE")
#        Master_qry=Master.objects.filter(project_date='2019-04-01')
#     else:
#        # print(type(request.POST['min']))
#        # print("tWO")
#        start_date= datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
#        # print(start_date)
#        Master_qry=Master.objects.filter(project_date=start_date)
#     total_related_master=Master_qry.annotate(master_rel_count=Count('relationship__master_id'),
#          master_unit_count=Sum('relationship__project_units'),
#          master_total_labor_cost=Sum('project_total_labor_cost'),
#          master_unit_done_count=Sum('quartpint__project_total_units'),
#          master_gallon_done_count=Sum('quartpint__project_total_gallons'),
#          master_cost_per_gallon=Sum('quartpint__project_cost_gallon'),
#          master_cost_per_unit=Sum('quartpint__project_cost_unit'),
#          master_qp_rel_count=Count('quartpint__master_id'),
#          summary_rel_count=Count('project_id_id__project_ids')
#          ).values('id','project_date','project_group','project_shift','project_q',
#           'project_whse','size','project_tmp_labor_hrs',
#           'project_gdb_labor_hrs','project_tmp_labor_cost',
#           'project_gdb_labor_cost','project_total_labor_cost',
#           'project_description','project_customer','master_status',
#           'project_id_id__id','project_id_id__project_name',
#           'product_id_id__id','product_id_id__product_category',
#           'supervisor_id_id__id','supervisor_id_id__supervisor_name',
#           'work_id_id__id','work_id_id__work_type',
#           'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__project_total_gallons','quartpint__project_cost_gallon','relationship__project_unit_type',
#           'project_id_id__project_ids__target','relationship__project_unit_type',
#           'master_rel_count','master_unit_count','master_unit_done_count','master_gallon_done_count','master_cost_per_gallon','master_cost_per_unit','master_qp_rel_count',
#           'master_total_labor_cost','summary_rel_count'
#         )
#     # print(total_related_master.query)
#     # master_count=total_related_master.aggregate(mcount=Count('id'))
#     # total_master_count=sum(master_count.values())
#     results = []
#     for master_relation in total_related_master:
#           master_json = {}
#           # master_json['project_whse'] = master_relation['project_whse']
#           # master_json['project_shift'] = master_relation['project_shift']
#           master_json['id'] = master_relation['id']
#           master_json['project_date'] = master_relation['project_date']

          
#           master_json['project_name'] = master_relation['project_id_id__project_name']
#           master_json['supervisor_name'] = master_relation['supervisor_id_id__supervisor_name']

#           master_json['project_total_labor_cost'] = master_relation['project_total_labor_cost']

#           master_json['related_unit_count'] = master_relation['master_rel_count']
#           master_json['unit_count'] = master_relation['master_unit_count']

#           master_json['master_total_labor_cost'] = master_relation['master_total_labor_cost']
#           master_json['unit_done_count'] = master_relation['quartpint__project_total_units']
#           master_json['gallon_done_count'] = master_relation['quartpint__project_total_gallons']
#           master_json['master_cost_per_gallon'] = master_relation['quartpint__project_cost_gallon']
#           # master_json['master_cost_per_unit'] = master_relation['quartpint__project_cost_unit']
#           master_json['master_cost_per_unit']=round(float(master_relation['quartpint__project_cost_unit']),2)
#           # master_json['summary_target'] = master_relation['project_id_id__project_ids__target']
#           master_json['summary_target'] = round(float(master_relation['project_id_id__project_ids__target']),2) if master_relation['project_id_id__project_ids__target']!=None else 0
#           master_json['unit_type'] = master_relation['relationship__project_unit_type']

#           if master_json['unit_type'] =='G':
#              master_json['minus_pl_gallon']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_gallon']),2)
#              master_json['multi_pl_gallon']=round(float(master_json['minus_pl_gallon']),2) * round(float(master_json['gallon_done_count']),2)
#              master_json['pl_color']=round(float(master_json['multi_pl_gallon']),2)
#           else:
#              master_json['minus_pl_unit']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_unit']),2)
#              master_json['multi_pl_unit']=round(float(master_json['minus_pl_unit']),2) * round(float(master_json['unit_done_count']),2)
#              master_json['pl_color']=round(float(master_json['multi_pl_unit']),2)

#           # if master_json['unit_type'] =='G':
            
#           # else:
             

#           if master_json['pl_color'] > 0:
#              master_json['profit']=master_json['pl_color']
#              master_json['pl']='<span style=color:green;  class=\'green_values\'>$'+str(master_json['pl_color'])+'</span><input type="hidden" name="hid_green[]" class=\'green_hid_class\' value="'+str(master_json['pl_color'])+'"><input type="hidden" name="hid_green_master_id[]" value="'+str(master_json['id'])+'">'
            
#           else:
#               master_json['loss']=master_json['pl_color']
#               master_json['pl']='<span style=color:red; class=\'red_values\'>$'+str(master_json['pl_color'])+'</span><input type="hidden" name="hid_red[]" class=\'red_hid_class\' value="'+str(master_json['pl_color'])+'"><input type="hidden" name="hid_red_master_id[]" value="'+str(master_json['id'])+'">'

          

#           results.append(master_json)

#      # print(master_relation['master_cost_gallon_count'])    
#     # print(total_related_master)
#     # print(total_related_master)
#     final_results = {}
#     # final_master_json = {}
 
#     final_results['data'] = results
#     json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)

#     # print(total_related_master)

#     return HttpResponse(json_data,content_type = "application/json")

@csrf_exempt
def savings_loss(request):
    today = datetime.datetime.now()
    a = date(date.today().year, 1, 1).strftime("%B %d, %Y")
    # date(date.today().year, 1, 1).strftime("%B %d %Y")
    project_min_date=a
    # print(project_min_date)
    q=Master.objects.filter(project_date__year=today.year)
    project_max_date=q.aggregate(Max('project_date'))
    # print(type(project_max_date['project_date__max']))

    context={
    # "labour_list":total_related_labor,'pl_net':total_related_master
    "project_max_date":project_max_date['project_date__max'].strftime("%B %d, %Y"), "project_min_date":project_min_date
    }
    return render(request,'savings_loss.html',context)

@csrf_exempt
def savings_loss_list(request):


      total_related_project=Project.objects.filter(master__project_total_labor_cost__isnull=False).select_related('master__project_id').annotate(master_total_labor_cost=Sum('master__project_total_labor_cost'),
        master_unit_done_count=Sum('master__quartpint__project_total_units'),
        master_gallon_done_count=Sum('master__quartpint__project_total_gallons'),
        master_cost_per_gallon=Sum('master__quartpint__project_cost_gallon'),
        master_cost_per_unit=Sum('master__quartpint__project_cost_unit'),

        dcount=Count('id'),
        dcount_master=Count('master'),
        others=Count('master__quartpint__others'),
        master_cost_per_gallon_count=Count('master__quartpint__project_cost_gallon'),
        master_cost_per_unit_count=Count('master__quartpint__project_cost_unit')
        
       
        ).values('id','project_name',
        'master_total_labor_cost',
        'master_unit_done_count','master_gallon_done_count','master_cost_per_gallon','master_cost_per_unit',
        'others','master_cost_per_gallon_count','master_cost_per_unit_count','project_ids__target','dcount_master')

      # print(total_related_project.query)


      results = []
      for master_relation in total_related_project:
            master_json = {}
            if master_relation['master_total_labor_cost'] != 0:
              master_json['id'] = master_relation['dcount_master']
             
              master_json['project_name'] = "<a class='view_project_details' href='javascript:void(0);' data-project='"+str(master_relation['id'])+"'>"+master_relation['project_name']+"</a>"

              master_json['master_total_labor_cost'] = float(master_relation['master_total_labor_cost']) if master_relation['master_total_labor_cost']!=None else 0
              print(master_relation['master_total_labor_cost'],"PROJECT NAME===>",master_relation['project_name'],"TARGET ==>")
              master_json['unit_done_count'] = master_relation['master_unit_done_count'] if master_relation['master_unit_done_count']!=None else 0
              master_json['gallon_done_count'] = master_relation['master_gallon_done_count'] if master_relation['master_gallon_done_count']!=None else 0
              master_json['master_cost_per_gallon'] = float(master_relation['master_cost_per_gallon']) / float(master_relation['master_cost_per_gallon_count']) if master_relation['master_cost_per_gallon']!=None else 0
              master_json['master_cost_per_unit'] = float(master_relation['master_cost_per_unit']) / float(master_relation['master_cost_per_unit_count']) if master_relation['master_cost_per_unit']!=None else 0
              master_json['summary_target'] = round(float(master_relation['project_ids__target']),2) if master_relation['project_ids__target']!=None else 0
              # master_json['unit_type'] = master_relation['master__relationship__project_unit_type']

              if master_json['project_name'] =="CUT & COMP":
                 master_json['last_year']='$0.38'
              elif master_json['project_name'] =="Ollie's Aerosol Sorting":
                 master_json['last_year']='$0.17'
              elif master_json['project_name'] =="Compactor":
                 master_json['last_year']='$0.05'
              elif master_json['project_name'] =="Roller Cover Sleeving":
                 master_json['last_year']='$0'
              elif master_json['project_name'] =="Roller Sorting":
                 master_json['last_year']='$0.08'
              elif master_json['project_name'] =="Applicator Stickering":
                 master_json['last_year']='$0.14'
              elif master_json['project_name'] =="Aerosol Stickering":
                 master_json['last_year']='$0.05'
                 
              else:
                 master_json['last_year']='$0'
              # master_json['last_year']='$'
              if master_relation['others']=='':
                 master_json['minus_pl_gallon']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_gallon']),2)
                 master_json['multi_pl_gallon']=round(float(master_json['minus_pl_gallon']),2) * round(float(master_json['gallon_done_count']),2)
                 master_json['pl_color']=round(float(master_json['multi_pl_gallon']),2)
              else:
                 master_json['minus_pl_unit']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_unit']),2)
                 master_json['multi_pl_unit']=round(float(master_json['minus_pl_unit']),2) * round(float(master_json['unit_done_count']),2)
                 master_json['pl_color']=round(float(master_json['multi_pl_unit']),2)
                 
              # if master_json['unit_type'] =='G':
                
              # else:
                 

              if master_json['pl_color'] > 0:
                 master_json['profit']=master_json['pl_color']
                 master_json['pl']='<span style=color:green;  class=\'green_values\'>$'+str(master_json['pl_color'])+'</span><input type="hidden" name="hid_green[]" class=\'green_hid_class\' value="'+str(master_json['pl_color'])+'"><input type="hidden" name="hid_green_master_id[]" value="'+str(master_json['id'])+'">'
                
              else:
                  master_json['loss']=master_json['pl_color']
                  master_json['pl']='<span style=color:red; class=\'red_values\'>$'+str(master_json['pl_color'])+'</span><input type="hidden" name="hid_red[]" class=\'red_hid_class\' value="'+str(master_json['pl_color'])+'"><input type="hidden" name="hid_red_master_id[]" value="'+str(master_json['id'])+'">'



            

            results.append(master_json)

       # print(master_relation['master_cost_gallon_count'])    
      # print(total_related_master)
      # print(total_related_master)
      final_results = {}
      # final_master_json = {}
   
      final_results['data'] = results
      json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)

    # print(total_related_master)

      return HttpResponse(json_data,content_type = "application/json")



@csrf_exempt
def master_pl_update(request):
    if request.method == "GET":
        m_id=request.GET['m_id']
        pl_value=request.GET['pl_value']

        # print(pl_value)
        if pl_value !="":
           pl_value=request.GET['pl_value']
           updat_qp = {'project_pl': str(pl_value)}
        quartspints_value =Master.objects.filter(id=m_id).update(**updat_qp)

    return JsonResponse(updat_qp)

@csrf_exempt
def master_pl_update_to_labor(request):
  
    if request.method == "GET":
        summary_date=datetime.datetime.strptime(request.GET['summary_date'], '%m/%d/%Y').strftime("%Y-%m-%d")
        # Need to change the above date like this ->  datetime.datetime.now().strftime ("%Y%m%d")


        # print(summary_date)
        if summary_date !="":
            net_profit=request.GET['net_profit']
            net_loss=request.GET['net_loss']
            total_pl=request.GET['total_pl']
            
            updat_pl = {'profit': float(net_profit),'loss': float(net_loss),'net_pl':float(total_pl)}
        quartspints_value =GdbLabour.objects.filter(date=summary_date).update(**updat_pl)

    return JsonResponse(updat_pl)
    
@csrf_exempt
def delete_master(request):




  if request.method == "POST":
    
    master_id=request.POST['deleteids_arr']
    selected_leads=json.loads(master_id)

    # print(request.POST['deleteids_arr'])
   
    for i,del_master_id in enumerate(selected_leads):
      del_relationship = Relationship.objects.filter(master_id=del_master_id).delete()
      del_quartpint = Quartpint.objects.filter(master_id=del_master_id).delete()
      del_master = Master.objects.filter(id=del_master_id).delete()
      if del_master:
        return_message="success"
      else:
        return_message="fail"
    return JsonResponse({'return_message':return_message})


@csrf_exempt
def graph_representation(request):
    phead_profit  = [['PROJECTS', 'NET PROFIT']]
    phead_loss    = [['PROJECTS', 'NET LOSS']]
    profit        = []
    loss          = []
    today_profit  = []
    today_loss    = []
    result        = get_project_profilt_loss(request,'chart')
    today_result  = get_project_profilt_loss(request,'today')
    # print(result)
    profit        = phead_profit + profit
    loss          = phead_loss   + loss
    today_profit  = phead_profit + today_profit
    today_loss    = phead_profit + today_loss

    for res in result:
      if res['status'] == 'profit':
        sol = [res['project_name'],abs(res['amount'])]
        profit.append(sol) 
      else:
        sol = [res['project_name'],abs(res['amount'])]
        loss.append(sol) 

    for res in today_result:
      if res['status'] == 'profit':
        sol = [res['project_name'],abs(res['amount'])]
        today_profit.append(sol) 
      else:
        sol = [res['project_name'],abs(res['amount'])]
        today_loss.append(sol)         

    pprofit       = json.dumps(profit)    
    lloss         = json.dumps(loss)
    ttoday_profit = json.dumps(today_profit)
    ttoday_loss   = json.dumps(today_loss)  
    labour_cost   = GdbLabour.objects.order_by('date').all()
    return render(request,'graphical_representation.html', {'today_profit':ttoday_profit,'today_loss':ttoday_loss,'profit': pprofit, 'loss': lloss,'labour':labour_cost})




def get_project_profilt_loss(request,param=None):
    if param != 'chart':
      start_date= datetime.datetime.strptime("04/01/2019", '%m/%d/%Y').strftime("%Y-%m-%d")
      Project_qry=Project.objects.filter(master__project_date=start_date)
    else:
      Project_qry=Project.objects

    total_related_project=Project_qry.select_related('master__project_id').select_related('master__quartpint__master_id').annotate(master_total_labor_cost=Sum('master__project_total_labor_cost'),
        master_unit_done_count=Sum('master__quartpint__project_total_units'),
        master_gallon_done_count=Sum('master__quartpint__project_total_gallons'),
        master_cost_per_gallon=Sum('master__quartpint__project_cost_gallon'),
        master_cost_per_unit=Sum('master__quartpint__project_cost_unit'),

        dcount=Count('id'),
        dcount_master=Count('master'),
        others=Count('master__quartpint__others'),
        master_cost_per_gallon_count=Count('master__quartpint__project_cost_gallon'),
        master_cost_per_unit_count=Count('master__quartpint__project_cost_unit')
        
       
        ).values('id','project_name',
        'master_total_labor_cost',
        'master_unit_done_count','master_gallon_done_count','master_cost_per_gallon','master_cost_per_unit',
        'master__project_total_labor_cost','others','master_cost_per_gallon_count','master_cost_per_unit_count','project_ids__target','dcount_master')

    # print(total_related_project.query)

    results = []
    profit_loss=[]
    for master_relation in total_related_project:
      d_profit_loss = {}      
      master_json = {}
      if master_relation['master_total_labor_cost'] != 0:
          master_json['id'] = master_relation['dcount_master']
          d_profit_loss['id']           = master_relation['dcount_master']
          d_profit_loss['project_name'] = master_relation['project_name']
         
          master_json['project_name'] = master_relation['project_name']
          master_json['master_total_labor_cost'] = float(master_relation['master_total_labor_cost']) if master_relation['master_total_labor_cost']!=None else 0
          # print(master_relation['master_total_labor_cost'],"PROJECT NAME===>",master_relation['project_name'],"TARGET ==>")
          master_json['unit_done_count'] = master_relation['master_unit_done_count'] if master_relation['master_unit_done_count']!=None else 0
          master_json['gallon_done_count'] = master_relation['master_gallon_done_count'] if master_relation['master_gallon_done_count']!=None else 0
          master_json['master_cost_per_gallon'] = float(master_relation['master_cost_per_gallon']) / float(master_relation['master_cost_per_gallon_count']) if master_relation['master_cost_per_gallon']!=None else 0
          master_json['master_cost_per_unit'] = float(master_relation['master_cost_per_unit']) / float(master_relation['master_cost_per_unit_count']) if master_relation['master_cost_per_unit']!=None else 0
          master_json['summary_target'] = round(float(master_relation['project_ids__target']),2) if master_relation['project_ids__target']!=None else 0
          # master_json['unit_type'] = master_relation['master__relationship__project_unit_type']
          
          # master_json['last_year']='$'
          if master_relation['others']=='':
             master_json['minus_pl_gallon']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_gallon']),2)
             master_json['multi_pl_gallon']=round(float(master_json['minus_pl_gallon']),2) * round(float(master_json['gallon_done_count']),2)
             master_json['pl_color']=round(float(master_json['multi_pl_gallon']),2)             
          else:
             master_json['minus_pl_unit']=round(float(master_json['summary_target']),2)-round(float(master_json['master_cost_per_unit']),2)
             master_json['multi_pl_unit']=round(float(master_json['minus_pl_unit']),2) * round(float(master_json['unit_done_count']),2)
             master_json['pl_color']=round(float(master_json['multi_pl_unit']),2)

          if master_json['pl_color'] > 0:
             master_json['profit']=master_json['pl_color']
             master_json['status']='profit'
             d_profit_loss['status'] = 'profit'
             d_profit_loss['amount'] = master_json['pl_color']             
          else:              
              master_json['loss']=master_json['pl_color']
              d_profit_loss['status'] = 'loss'
              d_profit_loss['amount'] = master_json['pl_color']              
          results.append(master_json) 
          profit_loss.append(d_profit_loss)

    return profit_loss 

@csrf_exempt
def import_data(request):

    if request.method == "POST":
        # print(request.FILES['data'],"<==FILE==>")
        data = pd.read_csv(request.FILES['data'],keep_default_na=False,dtype={'TEMP_LABOR_COST':float})
        data.head()
        # data['TOTAL_GALLONS_DONE'] = data.TOTAL_GALLONS_DONE.astype(float)

        # print(data.dtypes)
        # return
        # data_set=request.FILES['data'].read().decode('UTF-8')
        # io_string= io.StringIO(data_set)
        # next(io_string)
        


        matched_alldate=Master.objects.all().values('project_date','project_id_id__project_name')
        data_set = {}
        for x in matched_alldate:
          
          x['project_date'] = x['project_date'].strftime('%Y-%m-%d')

          if x['project_date'] not in data_set:
            data_set[x['project_date']] = [x['project_id_id__project_name']]
          else:
            data_set[x['project_date']].append(x['project_id_id__project_name'])

        
        # print(data_set)

        ct=0
        for i,j in data.iterrows():
        # for j in csv.reader(io_string,delimiter=',',quotechar='|'):
            
              # print(j[0],j[4],"IO CSV READ CHECK")
            data_insert=True

            if not j[0] and  not j[4]:
              continue

            master_date= datetime.datetime.strptime(j[0], '%m/%d/%Y').strftime("%Y-%m-%d") if j[0] else ""
            
            if data_set.get(master_date,False):
              
              if j[0] in data_set.get(master_date):
                data_insert=False
                # print(j[0],j[4],"TOP===match")
            #   else:
            #     print(j[0],j[4],"TOP===project no match")

            # else:
            #   print(j[0],j[4],"no match")
             
            
            else:

              # print(j[0],j[4],"TOP NEXT")
              
              master_date=master_date if j[0]!='' else ''
              project_group=j[3] if j[3]!='' else ''
              #Project
              project_obj,created_project= Project.objects.get_or_create(project_name=j[4])
              if(created_project==False):  
                  project_id=project_obj.id
                  # print(project_obj.id,project_obj.project_name,created_project,"project available")  # Work available take id
              else:
                project_obj_last_insert_id = Project.objects.latest('id')
                project_id=project_obj_last_insert_id.id
                # print(project_obj.id,project_obj.project_name,created_project,"project not available")


              project_shift=j[5] if j[5]!='' else ''
              project_q=j[6] if j[6]!='' else ''
              project_customer=j[7] if j[7]!='' else ''
              project_whse=j[8] if j[8]!='' else 0

              #Supervisor
              s_obj,created_super= Supervisor.objects.get_or_create(supervisor_name=j[9])
              if(created_super==False):  
                  supervisor_id=s_obj.id
                  # print(s_obj.id,s_obj.supervisor_name,created_super,"Supervisor available") 
                  # print(W_obj.id,created_work,"Work available")  # Work available take id
              else:
                s_obj_last_insert_id = Supervisor.objects.latest('id')
                supervisor_id=s_obj_last_insert_id.id
                # print(s_obj.id,s_obj.supervisor_name,created_super,"Supervisor not available")
              
              #Work
              W_obj,created_work= Work.objects.get_or_create(work_type=j[10])
              if(created_work==False):  
                  work_id=W_obj.id
                  # print(W_obj.id,W_obj.work_type,created_work,"Work available")  # Work available take id
              else:
                W_obj_last_insert_id = Work.objects.latest('id')
                work_id=W_obj_last_insert_id.id
                # print(W_obj.id,W_obj.work_type,created_work,"Work not available")

              
              #Product
              product_obj,created_product= Product.objects.get_or_create(product_category=j[11])
              if(created_product==False):  
                  product_id=product_obj.id
                  # print(product_obj.id,product_obj.product_category,created_product,"product available")  # Work available take id
              else:
                product_obj_last_insert_id = Product.objects.latest('id')
                product_id=product_obj_last_insert_id.id
                # print(product_obj.id,product_obj.product_category,created_product,"product not available")
              
              project_size=j[12] if j[12]!='' else ''

              project_temp_labor_hrs=j[13] if j[13]!='' else 0
              project_gdb_labor_hrs=j[14] if j[14]!='' else 0
              project_temp_labor_cost=j[15] if j[15]!='' else 0
              project_gdb_labor_cost=j[16] if j[16]!='' else 0
              project_total_labor_cost=j[17] if j[17]!='' else 0
              
              project_temp_labor_cost_split=project_temp_labor_cost.split("$")
              project_gdb_labor_cost_split=project_gdb_labor_cost.split("$")
              project_total_labor_cost_split=project_total_labor_cost.split("$")
              
              print(project_temp_labor_cost)
              # print(type(project_total_labor_cost_split[1]))

              try:
                  if project_temp_labor_cost_split[1]!='':
                     project_temp_labor_cost=float(project_temp_labor_cost_split[1].replace(',',''))
              except :
                  project_temp_labor_cost='0.00'
              try:
                  if project_gdb_labor_cost_split[1]!='':
                     project_gdb_labor_cost=float(project_gdb_labor_cost_split[1].replace(',',''))
              except :
                  project_gdb_labor_cost='0.00'
              try:
                  if project_total_labor_cost_split[1]!='':
                     project_total_labor_cost=float(project_total_labor_cost_split[1].replace(',',''))
              except :
                  project_total_labor_cost='0.00'
              # project_temp_labor_cost=float(project_temp_labor_cost_split[1].replace(',','')) if project_temp_labor_cost_split[1]!='' or project_temp_labor_cost_split[1]!='-   ' else ''
              # project_gdb_labor_cost=float(project_gdb_labor_cost_split[1].replace(',','')) if project_gdb_labor_cost_split[1]!='' or project_gdb_labor_cost_split[1]!='-   ' else ''
              # project_total_labor_cost=float(project_total_labor_cost_split[1].replace(',','')) if project_total_labor_cost_split[1]!='' or project_total_labor_cost_split[1]!='-   ' else ''

             

              gallon_one=j[18] if j[18]!='' else 0 # G1
               
              gallon_five=j[19] if j[19]!='' else 0 #G5
                
              quarts=j[20] if j[20]!='' else 0 #Quarts
                
              pints=j[21] if j[21]!='' else 0 #Pints
              # others=j[22] if j[22]!='' or j[22]!= None else 0 #others
              if j[22]!='' and j[22]!= None:
                 others=j[22]
              else:
                others=0


              total_units=j[23] if j[23]!='' else 0 #Total_units
              total_gallons_done=j[24] if j[24]!='' else 0 #Total_gallons_done
              
              
              cost_per_gallons_sht=j[25] if j[25]!='' else 0
              cost_per_units_sht=j[26] if j[26]!='' else 0
              # print("COST GALLON SHT",cost_per_gallons_sht)
              try:
                  if cost_per_gallons_sht!='' or cost_per_gallons_sht!=0:
                     cost_per_gallons_split=cost_per_gallons_sht.split("$")
              except:
                  cost_per_gallons_split=0
              
              cost_per_units_split=cost_per_units_sht.split("$")
              # print("COST GALLON SHT",cost_per_gallons_split)

              try:
                  if cost_per_gallons_split[1]!='' or cost_per_gallons_split[1]!='-   ' or cost_per_gallons_split[1]!=0:
                     cost_per_gallons=float(cost_per_gallons_split[1].replace(',',''))
              except:
                  cost_per_gallons=0
              # cost_per_gallons=float(cost_per_gallons_split[1].replace(',','')) if cost_per_gallons_split[1]!='' or cost_per_gallons_split[1]!='-   ' else '' #Cost_per_gallons
              cost_per_units=float(cost_per_units_split[1].replace(',','')) if cost_per_units_split[1]!='' or cost_per_units_split[1]!='-   ' else '' #Cost_per_units
              
              description=str(j[27]) if j[27]!='' else ''  #Description

              master_fields={'project_date':master_date,'project_group':project_group,
              'project_id_id':project_id,'project_shift':project_shift,
              'project_q':project_q,'project_customer':project_customer,
              'project_whse':project_whse,'supervisor_id_id':supervisor_id,'work_id_id':work_id,
              'product_id_id':product_id,'size':project_size,'project_tmp_labor_hrs':project_temp_labor_hrs,
              'project_gdb_labor_hrs':project_gdb_labor_hrs,'project_tmp_labor_cost':float(project_temp_labor_cost),
              'project_gdb_labor_cost':project_gdb_labor_cost,'project_total_labor_cost':project_total_labor_cost,
              'project_description':description,'master_status':'active'}
              
              # print("MASTER===>",cost_per_gallons)
              master_add=Master.objects.create(**master_fields)
              master_last_insert = Master.objects.latest('id')
              master_last_insert_id=master_last_insert.id

             
              # if type(total_gallons_done) == float :  print(type(total_gallons_done),round(Decimal(float(total_gallons_done)),3),"GALLON DONE FLOAT")
              # elif type(total_gallons_done) == int : print(type(total_gallons_done),total_gallons_done,"GALLON DONE INT")
              # else: print(type(total_gallons_done),total_gallons_done,"GALLON DONE STR")
              
              # if type(total_gallons_done)=='float' or type(total_gallons_done)=='str':
              #       with_total_gallon_done=round(Decimal(float(total_gallons_done)),3)


              #       with_total_gallon_done=float(total_gallons_done) if type(total_gallons_done)=='float' else ''
              # else:
              #       with_total_gallon_done=total_gallons_done
              # try:
              #    if type(total_gallons_done)=='str':
              #     with_total_gallon_done=float(total_gallons_done)
              # except:

              #     with_total_gallon_done=float(total_gallons_done)
                   
              # project_total_gallons=float(total_units)
              # if '.' not in total_gallons_done :
              #   total_gallons_done+=".00"
              # print(type(Decimal(total_gallons_done)),"CHECKING TYPE",float("%.3f" % float(str(total_gallons_done)+'00')),"ROUND",round(float(total_gallons_done),3))
              
              quart_pint_fields={'quarts':quarts,'pints':pints,
              'master_id_id':master_last_insert_id,'others':others,
              'project_cost_gallon':cost_per_gallons,
              'project_cost_unit':cost_per_units,
              'project_total_gallons':decimal.Decimal(round(float(total_gallons_done),3)),
              'project_total_units':total_units
              }
              # aList = [
              #     Quartpint(quarts=int(quarts)),
              #     Quartpint(pints=int(pints)),
              #     Quartpint(master_id_id=master_last_insert_id),
              #     Quartpint(others=int(others)),
              #     Quartpint(project_cost_gallon=float(cost_per_gallons)),
              #     Quartpint(project_cost_unit=float(cost_per_units)),
              #     Quartpint(project_total_gallons=with_total_gallon_done),
              #     Quartpint(project_total_units=total_units)
              # ]
             
              print("QUart values",quart_pint_fields)

              quart_pint_add=Quartpint.objects.create(**quart_pint_fields)
              
              quart_pint_last_insert = Quartpint.objects.latest('id')
              quart_pint_last_insert_id = quart_pint_last_insert.id
              # print(quart_pint_last_insert_id,"Quartpint ID")

              project_size_one='1' if gallon_one !=0 or gallon_one !='' else ''
              project_size_five='5' if gallon_five !=0 or gallon_five !='' else ''
              project_unit_type='G' if gallon_one !=0 or gallon_five !=0 or quarts!=0 or pints!=0 else 'Others'

              # print(type(gallon_one),"TYPE CHECK")
              if gallon_one !=0 or gallon_five ==0 or gallon_five !=0:
                relationship_fields_one={'project_size':project_size_one,'project_unit_type':project_unit_type,'project_units':int(gallon_one),
                'relationship_status':'active','master_id_id':master_last_insert_id,'quartpint_id_id':quart_pint_last_insert_id}
                               
                quart_pint_add_one=Relationship.objects.create(**relationship_fields_one)
              
              if gallon_five !=0 or gallon_one ==0 or gallon_one !=0:
                relationship_fields_five={'project_size':project_size_five,'project_unit_type':project_unit_type,'project_units':int(gallon_five),
                'relationship_status':'active','master_id_id':master_last_insert_id,'quartpint_id_id':quart_pint_last_insert_id
                }
                quart_pint_add_five=Relationship.objects.create(**relationship_fields_five)
              if project_unit_type=='Others':
                relationship_fields_others={'project_size':0,'project_unit_type':project_unit_type,'project_units':total_units,
                'relationship_status':'active','master_id_id':master_last_insert_id,'quartpint_id_id':quart_pint_last_insert_id
                  }
                quart_pint_add_others=Relationship.objects.create(**relationship_fields_others)
              if master_add:
                return_message="Successfully inserted"
                retun_display="success"
              else:
                return_message="No data's insert in application(Please check data's are already excist)"
                retun_display="fail"      
                
           
    return JsonResponse({'status':return_message,'display':retun_display})    
    # return HttpResponse({'status':'success'})

@csrf_exempt
def view_details(request):
  if request.method == "POST":    
    if request.POST.get('min') and request.POST.get('max'):
      month,date,year = request.POST.get('min').split('/')          
      start_date = datetime.date(year=int(year),month=int(month),day=int(date))
      month,date,year = request.POST.get('max').split('/')
      end_date = datetime.date(year=int(year),month=int(month),day=int(date))          
      Master_qry=Master.objects.filter(master_status='active',project_id_id=request.POST.get('project_id'),project_date__range=(start_date,end_date))
    elif request.POST.get('min') and request.POST.get('min') !='':
      month,date,year = request.POST['min'].split('/')
      Master_qry=Master.objects.filter(master_status='active',project_id_id=request.POST.get('project_id'),project_date__year=int(year),project_date__month=int(month))          
    elif request.POST.get('max') and request.POST.get('max') !='':
      month,date,year = request.POST['max'].split('/')
      Master_qry=Master.objects.filter(master_status='active',project_id_id=request.POST.get('project_id'),project_date__year=int(year), project_date__month=int(month))
    else:
      Master_qry=Master.objects.filter(master_status='active',project_id_id=request.POST.get('project_id'))

    total_related_master=Master_qry.annotate(master_rel_count=Count('relationship__master_id'),
       master_unit_count=Sum('relationship__project_units'),
       master_unit_done_count=Sum('quartpint__project_total_units'),
       master_qp_rel_count=Count('quartpint__master_id'),
       master_quarts=Count('quartpint__quarts'),
       master_units_total_gallon_cal=Sum(F('relationship__project_size') * F('relationship__project_units')),
       master_qp_total_gallon_cal=ExpressionWrapper(F('quartpint__quarts') * 0.25 + F('quartpint__pints') * 0.125 , output_field = FloatField()),
       master_units_cal=Sum('relationship__project_units'),
       master_qp_unit_cal=F('quartpint__quarts') + F('quartpint__pints')
       ).values('id','project_date','project_group','project_shift','project_q','project_whse','size','project_tmp_labor_hrs',
      'project_gdb_labor_hrs','project_tmp_labor_cost','project_gdb_labor_cost','project_total_labor_cost','project_description','project_customer','master_status',
      'project_id_id__id','project_id_id__project_name','product_id_id__id','product_id_id__product_category','supervisor_id_id__id','supervisor_id_id__supervisor_name','work_id_id__id','work_id_id__work_type',
      'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__quarts','quartpint__pints',
      'master_rel_count','master_unit_count','master_unit_done_count','master_units_total_gallon_cal','master_qp_total_gallon_cal','relationship__project_unit_type',
      'master_units_cal','master_qp_unit_cal','master_quarts').order_by('-project_date')

    # print(Master_qry.query)    

    results = []
    i=int(0)
    for master_relation in total_related_master:          
        master_json = {}
        if type(master_relation['master_qp_total_gallon_cal']) == float:          
            master_json['id'] = master_relation['id']
            master_json['project_date'] = master_relation['project_date'].strftime("%m/%d/%Y")
            master_json['project_shift'] = master_relation['project_shift']
            master_json['project_group'] = master_relation['project_group']
            master_json['project_q'] = master_relation['project_q']
            master_json['project_whse'] = master_relation['project_whse']
            master_json['size'] = master_relation['size']
            master_json['project_name'] = master_relation['project_id_id__project_name']
            master_json['supervisor_name'] = master_relation['supervisor_id_id__supervisor_name']
            master_json['product_category'] = master_relation['product_id_id__product_category']

            master_json['project_tmp_labor_hrs'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(master_relation['project_tmp_labor_hrs'])+'</span><input type="hidden" name="master_id_'+str(i)+'_1" id="master_id_'+str(i)+'_1" value="'+str(master_relation['id'])+'"><input type="hidden" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(master_relation['project_tmp_labor_hrs'])+'"><input type="hidden" name="temp_labor_field_'+str(i)+'_1" id="temp_labor_field_'+str(i)+'_1" value="'+str('project_tmp_labor_hrs')+'">'
            master_json['project_gdb_labor_hrs'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(master_relation['project_gdb_labor_hrs'])+'</span><input type="hidden" name="master_id_'+str(i)+'_1" id="master_id_'+str(i)+'_1" value="'+str(master_relation['id'])+'"><input type="hidden" name="gdb_labor_'+str(i)+'_1" id="gdb_labor_'+str(i)+'_1" value="'+str(master_relation['project_gdb_labor_hrs'])+'"><input type="hidden" name="gdb_labor_field_'+str(i)+'_1" id="gdb_labor_field_'+str(i)+'_1" value="'+str('project_gdb_labor_hrs')+'">'
            master_json['project_tmp_labor_cost'] = master_relation['project_tmp_labor_cost']
            master_json['project_gdb_labor_cost'] = master_relation['project_gdb_labor_cost']
            master_json['project_total_labor_cost'] = master_relation['project_total_labor_cost']

            master_json['related_unit_count'] = master_relation['master_rel_count']
            master_json['unit_count'] = master_relation['master_unit_count']
            master_json['relationship__project_unit_type'] = master_relation['relationship__project_unit_type']
            master_json['master_qp_total_gallon_cal'] = float(master_relation['master_qp_total_gallon_cal']) if master_relation['master_qp_total_gallon_cal']!=0  else 0            
            master_json['master_qp_unit_cal'] = float(master_relation['master_qp_total_gallon_cal']) if master_relation['master_qp_total_gallon_cal']!=0  else 0
            master_json['units_total_gallon_cal']= int(master_relation['master_units_total_gallon_cal']) if master_relation['master_units_total_gallon_cal']!=0 and master_relation['master_units_total_gallon_cal']is not None  else 0
            master_json['cost_per_unit'] =float(master_relation['quartpint__project_cost_unit']) if master_relation['quartpint__project_cost_unit'] is not None else 0
            master_json['unit_done_count'] = master_relation['master_units_cal'] + master_relation['master_qp_unit_cal']  if str(master_json['relationship__project_unit_type'])== 'G'  else master_relation['quartpint__project_total_units']
            master_json['gallon_done_count'] = master_json['units_total_gallon_cal'] + master_json['master_qp_total_gallon_cal']
            master_json['master_cost_unit_count'] = float(master_relation['project_total_labor_cost']) / float(master_json['unit_done_count']) if float(master_json['unit_done_count']) > 0 else master_json['cost_per_unit']
            master_json['master_cost_gallon_count'] = float(master_relation['project_total_labor_cost']) / float(master_json['gallon_done_count']) if float(master_json['gallon_done_count']) > 0 else 0
            i=i+1
            results.append(master_json)
    final_results = {}
    final_results['data'] = results
    json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)
    return HttpResponse(json_data,content_type = "application/json")