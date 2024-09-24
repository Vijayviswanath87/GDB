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
	records_total = GdbLabour.objects.count()
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
		result = GdbLabour.objects.all()
		result = result[start:length+start]
		json_data = []
	
	if records_total > 0:
		i=int(0)
		for record in result:
			json_record = {}
			json_record['id'] =  record.id
			json_record['date'] = record.date.strftime("%m/%d/%Y")
			json_record['no_of_temp_labour'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(record.no_of_temp_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_1" id="labor_id_'+str(i)+'_1" value="'+str(record.id)+'"><input type="hidden" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.no_of_temp_labour)+'"><input type="hidden" name="temp_labor_field_'+str(i)+'_1" id="temp_labor_field_'+str(i)+'_1" value="'+str('no_of_temp_labour')+'">'
			# json_record['no_of_temp_labour'] = '<input type="text" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.id)+'">'
			json_record['no_of_gdb_labour'] ='<span id="span_id_'+str(i)+'_2" class=\'green_values\'>'+str(record.no_of_gdb_labour)+'</span><input type="hidden" name="labor_id_'+str(i)+'_2" id="labor_id_'+str(i)+'_2" value="'+str(record.id)+'"><input type="hidden" name="gdb_labor_'+str(i)+'_2" id="gdb_labor_'+str(i)+'_2" value="'+str(record.no_of_gdb_labour)+'"><input type="hidden" name="gdb_labor_field_'+str(i)+'_2" id="gdb_labor_field_'+str(i)+'_2" value="'+str('no_of_gdb_labour')+'">'
			# json_record['no_of_gdb_labour'] =record.no_of_gdb_labour
			json_record['temp_hours'] = record.temp_hours
			json_record['gdb_hours'] = record.gdb_hours
			json_record['temp_cost'] = record.temp_cost
			json_record['gdb_cost'] = record.gdb_cost
			json_record['labour_cost'] = record.labour_cost
			# if record.profit > 0:
			json_record['profit'] ='<span style=color:green; class=\'green_values\'>$'+str(record.profit)+'</span>'
			# else:
			# 	json_record['profit']=record.profit
			# if record.loss > 0:
			json_record['loss'] ='<span style=color:red; class=\'red_values\'>$'+str(record.loss)+'</span>'
			# else:
			# 	json_record['loss']=record.loss				
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

		# Labour_cost update
		GdbLabour.objects.filter(id=labour_id).update(labour_cost=total)


	return JsonResponse({"response":"success"})

# @login_required    
# def target_form(request):
# 	if request.method == "POST":
# 		target_projectname = request.POST['target_projectname']
# 		target_cpu = request.POST['target_cpu']
# 		target_cpg = request.POST['target_cpg']

# 	else:
# 		form = TargetForm(request)
# 	context={
# 			'form': form
# 			}
# 	return render(request, 'target.html',context)
	



			
