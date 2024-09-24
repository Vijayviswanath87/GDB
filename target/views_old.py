from django.shortcuts import render, redirect





# Create your views here.

# from django.shortcuts import render,redirect,get_object_or_404
# from django.conf import settings
# from django.template import Context
# from django.template.loader import render_to_string
# from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode

# from django import forms
# from django.db import models
#from django import forms
from .models import*

from .forms import GdbTargetForm
from django.views.decorators.csrf import csrf_exempt
#from forms import AuthorForm

# from django.contrib import messages

# #Auth user & logout
# from django.contrib.auth.models import User,Permission
# from django.contrib import auth
# from django.contrib.auth import update_session_auth_hash, authenticate, login as customlogin,logout as customlogout

# #login/ajax check(csrf)/cache
# from django.views.decorators.csrf import csrf_exempt
# from django.contrib.auth.decorators import login_required
# from django.views.decorators.cache import cache_control

# #Added
from django.http import HttpResponseRedirect,HttpResponse,JsonResponse
from master.models import *
# from master import views as master
# from master.models import *
# from master import views as master

import json
from django.core.serializers.json import DjangoJSONEncoder

from decimal import Decimal, getcontext
import decimal
from django.urls import reverse



@csrf_exempt
def target_list_page(request):
	print("hiii")
	return render(request, 'target_list.html')

@csrf_exempt
def target_list(request):
	
	datatables = request.POST
	draw = datatables.get('draw')
	start = datatables.get('start')
	length = datatables.get('length')
	search = datatables.get('search[value]')
	records_total = GdbTarget.objects.count()
	records_filtered = records_total
	
	if search != "":
		# result = GdbAppLabour.objects.filter(~Q(emp_status=2) &(
		# Q(date__icontains=search) |
		# Q(no_of_temp_labour__icontains=search) |
		# Q(no_of_gdb_labour__icontains=search) |
		# Q(temp_hours=search) |
		# Q(gdb_hours__icontains=search))
		# ).order_by('emp_id')
		# 
		result = GdbTarget.objects.all().values()
		records_filtered = len(result)
	else:
		result = GdbTarget.objects.all().values()
		records_filtered = len(result)
	    	
		
		#result = GdbTarget.objects.all().values()
		
	json_data = []
	
	
	

	
	if records_total > 0:
		for record in result:
			json_record = {}
			json_record['id'] = record["id"]
			json_record['target_projectname'] = record["target_projectname"]
			json_record['target_cpu'] = record["target_cpu"]
			json_record['target_cpg'] =record["target_cpg"]
			json_record['target'] = record["target"]
			
			
			json_data.append(json_record)


	
	data = {
	'draw': draw,
	'recordsTotal': records_total,
	'recordsFiltered': records_filtered,
	'data': json_data,
	}
	return HttpResponse(json.dumps(data, cls=DjangoJSONEncoder), content_type='application/json')

@csrf_exempt
def edit_target_list(request):
	datatables = request.POST
	
	values = request.GET.get('clicked_value')
	# print("+++++++++++++++++++++++++")
	# print(values)
	target_id = request.GET.get('id')
	target = request.GET.get('target')

	#getting value list from the table GdbTarget
	target_cpg_data = GdbTarget.objects.filter(id=target_id).all().values_list()
	
    #
	# for data in target_cpg_data:
	target_projectname = target_cpg_data[0][1]
	target_cpg = target_cpg_data[0][3]
	
	target_cpu = target_cpg_data[0][2]
	

	if request.GET.get('clicked_label') == 'target_cpu':

		#checking condition for the project name, which average value to be taken to calculate the target 2019 -20%	
		if target_projectname == "CUT & COMP":

            
			target_total=float(target_cpg) * float(0.8)

		elif target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
			target_total= float(values) * float(0.8)


		else:
			target_total = 0

        
		#update done for target_cpu and target
		GdbTarget.objects.filter(id=target_id).update(target_cpu=values,target=target_total)

	    
	else:
		#checking condition for the project name, which average value to be taken to calculate the target 2019 -20%
		if target_projectname == "CUT & COMP":
            
			target_total=float(values) * float(0.8)

		elif target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
			target_total= float(target_cpu) * float(0.8)


		else:
			target_total = 0
		    	
		#update done for target_cpg and target
		GdbTarget.objects.filter(id=target_id).update(target_cpg=values,target=target_total)


	return JsonResponse({"response":"success"})

@csrf_exempt   
def target_form(request):

    
	if request.method == "POST":
		target_projectname = request.POST.get('target_projectname')

		target_cpu = request.POST.get('target_cpu')

		target_cpg = request.POST.get('target_cpg')

		if target_projectname == "CUT & COMP":
			target_cpgs=float(target_cpg) * float(0.8)

		elif target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
			target_cpgs= float(target_cpu) * float(0.8)

		else:
			target_cpgs = 0



        

		
		s1=GdbTarget.objects.filter(target_projectname=target_projectname).values()
		if s1:
			return HttpResponse("The project name already exists!")
		# return redirect(request,'target')
		else:

			s=GdbTarget(target_projectname=target_projectname,target_cpu=target_cpu,target_cpg=target_cpg,target=target_cpgs,status=1)
			s.save()

		return HttpResponseRedirect(reverse('target'))

		# gdb_target = GdbTarget.objects(target_cpg=target_cpg)



	else:
		form = GdbTargetForm(request)
	# context={
	# 		'form': form
	# 		}

	query = Project.objects.filter(status='active').values();
	print(query)
	for i in query:
		print(i["project_name"])
	# print(query)
	# data = {}
	# data['option'] = query
	# print("hiii")
	# print(data)
	return render(request, 'target.html', {'data':query})


@csrf_exempt 
def master_project_list(request):
    query = request.GET.get('q', None)

    #return HttpResponse(query)
    print(query)
    if query:
        project_name = GdbTarget.objects.filter(target_projectname__icontains=query).values("id","target_projectname")
        project_name = list(project_name)
        print(project_name)
        return JsonResponse(project_name, safe=False)
    else:
        return JsonResponse(data={'success': False,
                                  'errors': 'No mathing items found'})


