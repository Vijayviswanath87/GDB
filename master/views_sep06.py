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
from datetime import datetime, date, time
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
import decimal

import json

from django.core.serializers.json import DjangoJSONEncoder
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
            return redirect('/master/index')
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
       start_date= datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
       # print(start_date)
       Master_qry=Master.objects.filter(master_status='active',project_date=start_date)

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

          master_json['project_tmp_labor_hrs'] = master_relation['project_tmp_labor_hrs']
          master_json['project_gdb_labor_hrs'] = master_relation['project_gdb_labor_hrs']
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

          # print(master_relation['quartpint__project_total_units'])
          master_json['cost_per_unit'] =float(master_relation['quartpint__project_cost_unit']) if master_relation['quartpint__project_cost_unit'] is not None else 0
          
          master_json['unit_done_count'] = master_relation['master_units_cal'] + master_relation['master_qp_unit_cal']  if str(master_json['relationship__project_unit_type'])== 'G'  else master_relation['quartpint__project_total_units']

          master_json['gallon_done_count'] = int(master_relation['master_units_total_gallon_cal']) + master_json['master_qp_total_gallon_cal']
          
          master_json['master_cost_unit_count'] = float(master_relation['project_total_labor_cost']) / float(master_json['unit_done_count']) if float(master_json['unit_done_count']) > 0 else master_json['cost_per_unit']
          
          master_json['master_cost_gallon_count'] = float(master_relation['project_total_labor_cost']) / float(master_json['gallon_done_count']) if float(master_json['gallon_done_count']) > 0 else 0
          


          results.append(master_json)

     # print(master_relation['master_cost_gallon_count'])    
    # print(total_related_master)
          
    final_results = {}
    # final_master_json = {}
 
    final_results['data'] = results
    json_data = json.dumps (final_results ,cls=DjangoJSONEncoder)

    # print(total_related_master)

    return HttpResponse(json_data,content_type = "application/json")

# @csrf_exempt
# def quarts_pint(request):
#    if request.method == "POST":

#       master_relation_id=request.POST['m_id']
#       total_relationships= Quartpint.objects.filter(master_id=master_relation_id).values('id','quarts','pints').distinct()
#       context_val={"gallon":total_relationships}
#       context.update(context_val)
#       return context

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
      
      for relationship_rel in total_relationship:
              relationship_json = {}

              relationship_json['id'] = relationship_rel['id']

              # relationship_rel['project_size'] != 1 else 0

              relationship_json['project_size'] = relationship_rel['project_size'] if relationship_rel['project_unit_type'] =='G' else ''

              relationship_json['project_unit_type'] = relationship_rel['project_unit_type'] if relationship_rel['project_unit_type'] =='G' else ''
              relationship_json['project_units'] = relationship_rel['project_units'] if relationship_rel['project_unit_type'] =='G' else ''
              relationship_json['project_total_units'] = ''
              relationship_json['project_new'] = ''
              results.append(relationship_json)

             #gallon_f = "G"+int(relationship_rel['project_size'])
              # gallon_arr = {'id':relationship_rel['project_size']}
      # results.append(total_relationships)


      # relationship_gallon = {'project_size':'Quarts','project_units':10}
      # results.append(relationship_gallon)
          
      # relationship_gallon = {'project_size':'Pints','project_units':5}
      # results.append(relationship_gallon)
      

        
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
              print("I AM IN")
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
                print(updat_qp)
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
       start_date= datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
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
       Master_qry=Master.objects.filter(project_date='2019-04-01')
    else:
       # print(type(request.POST['min']))
       # print("tWO")
       start_date= datetime.strptime(request.POST['min'], '%m/%d/%Y').strftime("%Y-%m-%d")
       # print(start_date)
       Master_qry=Master.objects.filter(project_date=start_date)
    total_related_master=Master_qry.annotate(master_rel_count=Count('relationship__master_id'),
         master_unit_count=Sum('relationship__project_units'),
         master_total_labor_cost=Sum('project_total_labor_cost'),
         master_unit_done_count=Sum('quartpint__project_total_units'),
         master_gallon_done_count=Sum('quartpint__project_total_gallons'),
         master_cost_per_gallon=Sum('quartpint__project_cost_gallon'),
         master_cost_per_unit=Sum('quartpint__project_cost_unit'),
         master_qp_rel_count=Count('quartpint__master_id'),
         summary_rel_count=Count('project_id_id__project_ids')
         ).values('id','project_date','project_group','project_shift','project_q',
          'project_whse','size','project_tmp_labor_hrs',
          'project_gdb_labor_hrs','project_tmp_labor_cost',
          'project_gdb_labor_cost','project_total_labor_cost',
          'project_description','project_customer','master_status',
          'project_id_id__id','project_id_id__project_name',
          'product_id_id__id','product_id_id__product_category',
          'supervisor_id_id__id','supervisor_id_id__supervisor_name',
          'work_id_id__id','work_id_id__work_type',
          'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__project_total_gallons','quartpint__project_cost_gallon','relationship__project_unit_type',
          'project_id_id__project_ids__target','relationship__project_unit_type',
          'master_rel_count','master_unit_count','master_unit_done_count','master_gallon_done_count','master_cost_per_gallon','master_cost_per_unit','master_qp_rel_count',
          'master_total_labor_cost','summary_rel_count'
        )
    # print(total_related_master.query)
    # master_count=total_related_master.aggregate(mcount=Count('id'))
    # total_master_count=sum(master_count.values())
    results = []
    for master_relation in total_related_master:
          master_json = {}
          # master_json['project_whse'] = master_relation['project_whse']
          # master_json['project_shift'] = master_relation['project_shift']
          master_json['id'] = master_relation['id']
          master_json['project_date'] = master_relation['project_date']

          
          master_json['project_name'] = master_relation['project_id_id__project_name']
          master_json['supervisor_name'] = master_relation['supervisor_id_id__supervisor_name']

          master_json['project_total_labor_cost'] = master_relation['project_total_labor_cost']

          master_json['related_unit_count'] = master_relation['master_rel_count']
          master_json['unit_count'] = master_relation['master_unit_count']

          master_json['master_total_labor_cost'] = master_relation['master_total_labor_cost']
          master_json['unit_done_count'] = master_relation['quartpint__project_total_units']
          master_json['gallon_done_count'] = master_relation['quartpint__project_total_gallons']
          master_json['master_cost_per_gallon'] = master_relation['quartpint__project_cost_gallon']
          master_json['master_cost_per_unit'] = master_relation['quartpint__project_cost_unit']
          master_json['summary_target'] = master_relation['project_id_id__project_ids__target']
          master_json['unit_type'] = master_relation['relationship__project_unit_type']

          if master_json['unit_type'] =='G':
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
def savings_loss(request):

    context={
    # "labour_list":total_related_labor,'pl_net':total_related_master
    }
    return render(request,'savings_loss.html',context)


@csrf_exempt
def savings_loss_list(request):

      total_related_master=Master.objects.filter(project_date='2019-04-01').annotate(master_rel_count=Count('relationship__master_id'),
           master_unit_count=Sum('relationship__project_units'),
           master_total_labor_cost=Sum('project_total_labor_cost'),
           master_unit_done_count=Sum('quartpint__project_total_units'),
           master_gallon_done_count=Sum('quartpint__project_total_gallons'),
           master_cost_per_gallon=Sum('quartpint__project_cost_gallon'),
           master_cost_per_unit=Sum('quartpint__project_cost_unit'),
           master_qp_rel_count=Count('quartpint__master_id'),
           summary_rel_count=Count('project_id_id__project_ids')
           ).values('id','project_date','project_group','project_shift','project_q',
            'project_whse','size','project_tmp_labor_hrs',
            'project_gdb_labor_hrs','project_tmp_labor_cost',
            'project_gdb_labor_cost','project_total_labor_cost',
            'project_description','project_customer','master_status',
            'project_id_id__id','project_id_id__project_name',
            'product_id_id__id','product_id_id__product_category',
            'supervisor_id_id__id','supervisor_id_id__supervisor_name',
            'work_id_id__id','work_id_id__work_type',
            'quartpint__project_total_units','quartpint__project_cost_unit','quartpint__project_total_gallons','quartpint__project_cost_gallon','relationship__project_unit_type',
            'project_id_id__project_ids__target','relationship__project_unit_type',
            'master_rel_count','master_unit_count','master_unit_done_count','master_gallon_done_count','master_cost_per_gallon','master_cost_per_unit','master_qp_rel_count',
            'master_total_labor_cost','summary_rel_count'
          )
      # print(total_related_master.query)
      # master_count=total_related_master.aggregate(mcount=Count('id'))
      # total_master_count=sum(master_count.values())
      results = []
      for master_relation in total_related_master:
            master_json = {}
            # master_json['project_whse'] = master_relation['project_whse']
            # master_json['project_shift'] = master_relation['project_shift']
            master_json['id'] = master_relation['id']
            master_json['project_date'] = master_relation['project_date']

            
            master_json['project_name'] = master_relation['project_id_id__project_name']
            master_json['supervisor_name'] = master_relation['supervisor_id_id__supervisor_name']

            master_json['project_total_labor_cost'] = master_relation['project_total_labor_cost']

            master_json['related_unit_count'] = master_relation['master_rel_count']
            master_json['unit_count'] = master_relation['master_unit_count']

            master_json['master_total_labor_cost'] = master_relation['master_total_labor_cost']
            master_json['unit_done_count'] = master_relation['quartpint__project_total_units']
            master_json['gallon_done_count'] = master_relation['quartpint__project_total_gallons']
            master_json['master_cost_per_gallon'] = master_relation['quartpint__project_cost_gallon']
            master_json['master_cost_per_unit'] = master_relation['quartpint__project_cost_unit']
            master_json['summary_target'] = master_relation['project_id_id__project_ids__target']
            master_json['unit_type'] = master_relation['relationship__project_unit_type']
            if master_json['project_name'] =="CUT & COMP":
               master_json['last_year']='$0.38'
            elif master_json['project_name'] =="Ollie's Aerosol Sorting":
               master_json['last_year']='$0.17'
            elif master_json['project_name'] =="Compactor":
               master_json['last_year']='$0.05'
            elif master_json['project_name'] =="Roller Cover Sleeving":
               master_json['last_year']='$0.00'
            elif master_json['project_name'] =="Roller Sorting":
               master_json['last_year']='$0.08'
            elif master_json['project_name'] =="Applicator Stickering":
               master_json['last_year']='$0.14'
            elif master_json['project_name'] =="Aerosol Stickering":
               master_json['last_year']='$0.05'
               
            else:
               master_json['last_year']='$0'
            # master_json['last_year']='$0'
            if master_json['unit_type'] =='G':
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
        summary_date=datetime.strptime(request.GET['summary_date'], '%m/%d/%Y').strftime("%Y-%m-%d")
        # Need to change the above date like this ->  datetime.datetime.now().strftime ("%Y%m%d")


        # print(summary_date)
        if summary_date !="":
            net_profit=request.GET['net_profit']
            net_loss=request.GET['net_loss']
            total_pl=request.GET['total_pl']
            
            updat_pl = {'profit': float(net_profit),'loss': float(net_loss),'net_pl':float(total_pl)}
        quartspints_value =GdbLabour.objects.filter(date=summary_date).update(**updat_pl)

    return JsonResponse(updat_pl)