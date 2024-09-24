#*****************************************************************************************
#  Project name : GDB
#  Filename : views.py
#  Developed by : Dhivya Sri V.M
#*****************************************************************************************
from django.shortcuts import render,redirect,get_object_or_404
from django.conf import settings
from django.template import Context
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode

from django import forms
from django.db import models
# from django import forms
from .models import*
from .forms import*
from django.contrib import messages

#Auth user & logout
from django.contrib.auth.models import User,Permission
from django.contrib import auth
from django.contrib.auth import update_session_auth_hash, authenticate, login as customlogin,logout as customlogout

#login/ajax check(csrf)/cache
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import cache_control

#Added
from django.http import HttpResponseRedirect,HttpResponse,JsonResponse
from master.models import *
from master import views as master
# from master.models import *
# from master import views as master
from django.views.decorators.csrf import csrf_exempt
import json
from django.core.serializers.json import DjangoJSONEncoder

from decimal import Decimal, getcontext
import decimal
import datetime
import pandas as pd 
import csv
import os
# Create your views here.
# print(pi.quantize(Decimal('1.000'), Context(prec=4)))

def login(request):
    """
           Description: User Login
           Method:  POST 
           URL: login/

    """
    if request.method == "POST":
      username = request.POST['username']
      password = request.POST['password']
      user = authenticate(request, username=username, password=password)
      if user is not None:
          customlogin(request,user)
          current_user = request.user
          return redirect('index')
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
    return redirect('/login/')

# @login_required
# def index(request):         
    
#     return render(request, 'index.html')

# @csrf_exempt
def index(request):
    return render(request, 'labour.html')

@csrf_exempt
def ajax_fetch_labour_list(request):
    
    datatables = request.POST
    draw = int(datatables.get('draw'))
    start = int(datatables.get('start'))
    length = int(datatables.get('length'))
    search = datatables.get('search[value]')
    # records_total = GdbLabour.objects.count()
    # records_filtered = records_total

    if request.POST.get('min') and request.POST.get('max'):
      month,date,year = request.POST['min'].split('/')          
      start_date = datetime.date(year=int(year),month=int(month),day=int(date))
      month,date,year = request.POST['max'].split('/')
      end_date = datetime.date(year=int(year),month=int(month),day=int(date))          
      records_total=GdbLabour.objects.filter(date__range=(start_date,end_date)).count()
      records=GdbLabour.objects.filter(date__range=(start_date,end_date)).all()
      # print(Master_qry)
    elif request.POST.get('min'):
      month,date,year = request.POST['min'].split('/')           
      records_total=GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).count()          
      records=GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).all()          
    elif request.POST.get('max') and request.POST.get('max') !='':    
      month,date,year = request.POST['max'].split('/')           
      records_total=GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).count()
      records      =GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).all()
    else:
        records_total = GdbLabour.objects.count()
        records       = GdbLabour.objects.all()

    records_filtered = records_total

    if search != "":
        # result = GdbAppLabour.objects.filter(~Q(emp_status=2) &(
        # Q(date__icontains=search) |
        # Q(no_of_temp_labour__icontains=search) |
        # Q(no_of_gdb_labour__icontains=search) |
        # Q(temp_hours=search) |
        # Q(gdb_hours__icontains=search))
        # ).order_by('emp_id')
        result=""
        records_filtered = len(result)
        result = result[start:length+start]
    else:
        result = records
        result = result[start:length+start]
        json_data = []
    
    if records_total > 0:
        i=int(0)
        for record in result:
            json_record = {}
            json_record['id'] =  record.id
            json_record['date'] = record.date.strftime("%m/%d/%Y")
            # json_record['no_of_temp_labour'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(record.no_of_temp_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_1" id="labor_id_'+str(i)+'_1" value="'+str(record.id)+'"><input type="hidden" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.no_of_temp_labour)+'"><input type="hidden" name="temp_labor_field_'+str(i)+'_1" id="temp_labor_field_'+str(i)+'_1" value="'+str('no_of_temp_labour')+'">'
            # # json_record['no_of_temp_labour'] = '<input type="text" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.id)+'">'
            # json_record['no_of_gdb_labour'] ='<span id="span_id_'+str(i)+'_2" class=\'green_values\'>'+str(record.no_of_gdb_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_2" id="labor_id_'+str(i)+'_2" value="'+str(record.id)+'"><input type="hidden" name="gdb_labor_'+str(i)+'_2" id="gdb_labor_'+str(i)+'_2" value="'+str(record.no_of_gdb_labour)+'"><input type="hidden" name="gdb_labor_field_'+str(i)+'_2" id="gdb_labor_field_'+str(i)+'_2" value="'+str('no_of_gdb_labour')+'">'
            # json_record['no_of_gdb_labour'] =record.no_of_gdb_labour
            json_record['no_of_temp_labour'] = '<span id="span_id_'+str(i)+'_2"  class=\'green_values\'>'+str(record.no_of_temp_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_2" id="labor_id_'+str(i)+'_2" value="'+str(record.id)+'"><input type="hidden" name="temp_labor_'+str(i)+'_2" id="temp_labor_'+str(i)+'_2" value="'+str(record.no_of_temp_labour)+'"><input type="hidden" name="temp_labor_field_'+str(i)+'_2" id="temp_labor_field_'+str(i)+'_2" value="'+str('no_of_temp_labour')+'">'
            # json_record['no_of_temp_labour'] = '<input type="text" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.id)+'">'
            json_record['no_of_gdb_labour'] ='<span id="span_id_'+str(i)+'_3" class=\'green_values\'>'+str(record.no_of_gdb_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_3" id="labor_id_'+str(i)+'_3" value="'+str(record.id)+'"><input type="hidden" name="gdb_labor_'+str(i)+'_3" id="gdb_labor_'+str(i)+'_3" value="'+str(record.no_of_gdb_labour)+'"><input type="hidden" name="gdb_labor_field_'+str(i)+'_3" id="gdb_labor_field_'+str(i)+'_3" value="'+str('no_of_gdb_labour')+'">'

            json_record['temp_hours'] = record.temp_hours
            json_record['gdb_hours'] = record.gdb_hours
            json_record['temp_cost'] = record.temp_cost
            json_record['gdb_cost'] = record.gdb_cost
            json_record['labour_cost'] = record.labour_cost
            # if record.profit > 0:
            json_record['profit'] ='<span style=color:green; class=\'green_values\'>$'+str(record.profit)+'</span>'
            # else:
            #   json_record['profit']=record.profit<input type="hidden" name="hid_temp'+str(i)+'" id="hid_temp'+str(i)+'" class=\'hid_temp\' value="'+str(record.id)+'">
            # if record.loss > 0:
            json_record['loss'] ='<span style=color:red; class=\'red_values\'>$'+str(record.loss)+'</span>'
            # else:
            #   json_record['loss']=record.loss             
            # json_record['profit'] = '<span style=color:red; class=\'red_values\'>$' + record.profit +'</span>' if record.profit > 0 else 0
            # json_record['loss'] = record.loss
            i=i+1
            if record.net_pl > 0:
                json_record['net_pl'] ='<span style=color:green; class=\'green_values\'>$'+str(record.net_pl)+'</span>'
            else:
                json_record['net_pl'] ='<span style=color:red; class=\'red_values\'>$'+str(record.net_pl)+'</span>'
            
            # json_record['net_pl'] = record.net_pl
            #json_record['created'] = str(record.created.strftime("%m/%d/%Y at %I:%m%p")).lower()
            json_data.append(json_record)
            
            # print(record.profit)
# # for data option with list 
# json_data.append([record.instructor_name,record.instructor_email,str(record.created),status,action])

    data = {
    'draw': draw,
    'recordsTotal': records_total,
    'recordsFiltered': records_filtered,
    'data': json_data,
    }
    return HttpResponse(json.dumps(data, cls=DjangoJSONEncoder), content_type='application/json')

@csrf_exempt
def edit_labour_list(request):
    datatables = request.POST
    #values = datatables.get('clicked_value')
    values = request.GET.get('clicked_value')
    labour_id = request.GET.get('id')
    # print("EDITED",values)
    hours = int(values) * 8
    
    cost = decimal.Decimal(hours)
    
    if request.GET.get('clicked_label') == 'no_of_temp_labour':

        #temporary_labour_cost calculation
        costs = int(cost) * 14.5

        #update for temp_labour_hours and temp_cost
        GdbLabour.objects.filter(id=labour_id).update(no_of_temp_labour=values,temp_hours=hours,temp_cost=costs)
        temp_labour_cost = GdbLabour.objects.filter(id=labour_id).latest('gdb_cost')
        labour_cost_calculation = temp_labour_cost.gdb_cost

        #Labour cost calculation
        total = int(costs) + int(labour_cost_calculation)

        update_values={'no_of_temp_labour':values}
        # Labour_cost update
        GdbLabour.objects.filter(id=labour_id).update(labour_cost=total)

        
    else:

        #GDB_cost_calculation
        costs = int(cost) * 11

        #update done for temp_labour_hours and temp_cost
        GdbLabour.objects.filter(id=labour_id).update(no_of_gdb_labour=values,gdb_hours=hours,gdb_cost=costs)
        gdb_labour_cost = GdbLabour.objects.filter(id=labour_id).latest('temp_cost')
        labour_cost_calculation = gdb_labour_cost.temp_cost

        #Labour cost calculation
        total = int(costs) + int(labour_cost_calculation)
        update_values={'no_of_gdb_labour':values}
        # Labour_cost update
        GdbLabour.objects.filter(id=labour_id).update(labour_cost=total)


    return JsonResponse(update_values)

@csrf_exempt
def labor_import_data(request):

    if request.method == "POST":
      # print(request.FILES['data'],"<==FILE==>")
        data = pd.read_csv(request.FILES['data'],keep_default_na=False)
        data.head()
        header = list(data.columns)
        matched_alldate=GdbLabour.objects.all().values('date')
        data_set = []
        for x in matched_alldate:
            
            x['date'] = x['date'].strftime('%Y-%m-%d')

            if x['date'] not in data_set:
                data_set.append(x['date'])
                print(data_set,"IF ====")
         # filename =  os.path.basename('labour/Labor_Invalid_Records')
        #  s
        with open('Labor_Invalid_Records', 'w+') as file:
            writer = csv.writer(file, delimiter=',')
            writer.writerow(y for y in header)
            fl_ct=0    
            for i,j in data.iterrows():
                    # print(j[0],"DATE ====")
                data_insert=True
                if not j[0]:
                    continue
                labor_date= datetime.datetime.strptime(j[0], '%m/%d/%Y').strftime("%Y-%m-%d") if j[0] else ""


                if labor_date in data_set:
                    writer.writerow(j)
                    fl_ct=fl_ct+1
                else:

                    
                    data_set.append(labor_date)

                    labor_date=labor_date if j[0]!='' else ''
                    labor_no_of_temp=j[1] if j[1]!='' else ''
                    labor_no_of_gdb=j[2] if j[2]!='' else ''
                    labor_temp_hrs=j[3] if j[3]!='' else ''
                    labor_gdb_hrs=j[4] if j[4]!='' else ''
                    
                    labor_temp_cost=j[5] if j[5]!='' else ''
                    labor_temp_cost_split=labor_temp_cost.split("$")
                    try:
                        if labor_temp_cost_split[1]!='':
                             labor_temp_cost=float(labor_temp_cost_split[1].replace(',',''))
                    except :
                        labor_temp_cost='0.00'            
                    

                    labor_gdb_cost=j[6] if j[6]!='' else ''
                    labor_gdb_cost_split=labor_gdb_cost.split("$")
                    try:
                        if labor_gdb_cost_split[1]!='':
                             labor_gdb_cost=float(labor_gdb_cost_split[1].replace(',',''))
                    except :
                        labor_gdb_cost='0.00' 

                    labor_cost=j[7] if j[7]!='' else ''
                    labor_cost_split=labor_cost.split("$")
                    try:
                        if labor_cost_split[1]!='':
                             labor_cost=float(labor_cost_split[1].replace(',',''))
                    except :
                        labor_cost='0.00' 


                    labor_profit_sht=j[8] if j[8]!='' else ''
                    try:
                        if labor_profit_sht!='' or labor_profit_sht!=0:
                           labor_profit_split=labor_profit_sht.split("$")
                    except:
                           labor_profit_split=0
                      
                    
                    try:
                        if labor_profit_split[1]!='' or labor_profit_split[1]!='-   ' or labor_profit_split[1]!='   -   ' or labor_profit_split[1]!=0:
                            labor_profit=float(labor_profit_split[1].replace(',',''))
                    except:
                            labor_profit=0

                    labor_loss_sht=j[9] if j[9]!='' else ''

                    try:
                        if labor_loss_sht!='' or labor_loss_sht!=0:
                           labor_loss_split=labor_loss_sht.split("$")
                    except:
                           labor_loss_split=0
                    print(labor_loss_split[1],"SPLIT CHECK===>")     
                    try:
                        if labor_loss_split[1]!='' or labor_loss_split[1]!='-   ' or labor_loss_split[1]!=0:
                            labor_loss=float(labor_loss_split[1].replace(',',''))
                    except:
                            labor_loss=0
                    labor_nl_sht=j[10] if j[10]!='' else ''
                    try:
                        if labor_nl_sht!='' or labor_nl_sht!=0:
                           labor_nl_split=labor_nl_sht.split("$")
                    except:
                           labor_nl_split=0

                    try:
                        if labor_nl_split[1]!='' or labor_nl_split[1]!='-   ' or labor_nl_split[1]!=0:
                            labor_nl=float(labor_nl_split[1].replace(',',''))
                    except:
                            labor_nl=0
                    
                    labor_fields={'date':labor_date,'no_of_temp_labour':labor_no_of_temp,
                      'no_of_gdb_labour':labor_no_of_gdb,'temp_hours':labor_temp_hrs,
                      'gdb_hours':labor_gdb_hrs,'temp_cost':labor_temp_cost,
                      'gdb_cost':labor_gdb_cost,'labour_cost':labor_cost,
                      'profit':labor_profit,'loss':labor_loss,'net_pl':labor_nl}
                  
                    print("LABOR===>",labor_fields)
                    master_add=GdbLabour.objects.create(**labor_fields)
            
    return JsonResponse({'status':'success'})    
    # return HttpResponse({'status':'success'})

@csrf_exempt
def report_labour_list(request):    
    if request.POST['min'] and request.POST['max']:
      month,date,year = request.POST['min'].split('/')          
      start_date = datetime.date(year=int(year),month=int(month),day=int(date))
      month,date,year = request.POST['max'].split('/')
      end_date = datetime.date(year=int(year),month=int(month),day=int(date))          
      records_total=GdbLabour.objects.filter(date__range=(start_date,end_date)).count()
      result=GdbLabour.objects.filter(date__range=(start_date,end_date)).all()
      # print(Master_qry)
    elif request.POST['min']:
      month,date,year = request.POST['min'].split('/')           
      records_total=GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).count()          
      result=GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).all()          
    elif request.POST['max'] and request.POST['max'] !='':    
      month,date,year = request.POST['max'].split('/')           
      records_total=GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).count()
      result      =GdbLabour.objects.filter(date__year=int(year),date__month=int(month)).all()
    else:
        records_total = 0

    records_filtered = records_total

    json_data = []
    final_results = {}
    if records_total > 0:
        i=int(0)
        for record in result:
            json_record = {}
            json_record['id_1'] =  record.id
            json_record['id'] =  record.id
            json_record['date'] = record.date.strftime("%m/%d/%Y")
            json_record['no_of_temp_labour'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(record.no_of_temp_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_1" id="labor_id_'+str(i)+'_1" value="'+str(record.id)+'"><input type="hidden" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.no_of_temp_labour)+'"><input type="hidden" name="temp_labor_field_'+str(i)+'_1" id="temp_labor_field_'+str(i)+'_1" value="'+str('no_of_temp_labour')+'">'
            json_record['no_of_gdb_labour'] ='<span id="span_id_'+str(i)+'_2" class=\'green_values\'>'+str(record.no_of_gdb_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_2" id="labor_id_'+str(i)+'_2" value="'+str(record.id)+'"><input type="hidden" name="gdb_labor_'+str(i)+'_2" id="gdb_labor_'+str(i)+'_2" value="'+str(record.no_of_gdb_labour)+'"><input type="hidden" name="gdb_labor_field_'+str(i)+'_2" id="gdb_labor_field_'+str(i)+'_2" value="'+str('no_of_gdb_labour')+'">'
            json_record['temp_hours'] = record.temp_hours
            json_record['gdb_hours'] = record.gdb_hours
            json_record['temp_cost'] = record.temp_cost
            json_record['gdb_cost'] = record.gdb_cost
            json_record['labour_cost'] = record.labour_cost         
            json_record['profit'] ='<span style=color:green; class=\'green_values\'>$'+str(record.profit)+'</span>'         
            json_record['loss'] ='<span style=color:red; class=\'red_values\'>$'+str(record.loss)+'</span>'         
            i=i+1
            if record.net_pl > 0:
                json_record['net_pl'] ='<span style=color:green; class=\'green_values\'>$'+str(record.net_pl)+'</span>'
            else:
                json_record['net_pl'] ='<span style=color:red; class=\'red_values\'>$'+str(record.net_pl)+'</span>'         
            json_data.append(json_record)
            
        final_results['data'] = json_data       
        master_json = json.dumps (final_results ,cls=DjangoJSONEncoder)
    else:
        final_results['data'] = json_data
        master_json = json.dumps (final_results ,cls=DjangoJSONEncoder)

    # data = {'recordsTotal': records_total,'recordsFiltered': records_filtered,'data': json_data,}
    return HttpResponse(master_json,content_type = "application/json")


@csrf_exempt
def delete_labour(request):
  if request.method == "POST":
    
    labour_id=request.POST['deleteids_arr']
    selected_leads=json.loads(labour_id)

    print(selected_leads)
   
    for i,del_master_id in enumerate(selected_leads):      
      del_labour = GdbLabour.objects.filter(id=del_master_id).delete()
      if del_labour:
        return_message="success"
      else:
        return_message="fail"
    return JsonResponse({'return_message':return_message})  