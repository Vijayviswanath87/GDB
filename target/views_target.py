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
from django.contrib import messages
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
# import simplejson


@csrf_exempt
def target_list_page(request):
	
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
		# d=0
		i=0
		for record in result:
			
			json_record = {}
			json_record['id'] = record["id"]
			json_record['target_projectname'] = record["target_projectname"]
			json_record['target_cpu'] = '<span id="span_id_'+str(i)+'_1"  class=\'green_values\'>'+str(record["target_cpu"])+'</span><input type="hidden" name="target_id_'+str(i)+'_1" id="target_id_'+str(i)+'_1" value="'+str(record["id"])+'"><input type="hidden" name="target_cpu_'+str(i)+'_1" id="target_cpu_'+str(i)+'_1" value="'+str(record["target_cpu"])+'"><input type="hidden" name="target_cpu_field_'+str(i)+'_1" id="target_cpu_field_'+str(i)+'_1" value="'+str('target_cpu')+'">'
			# json_record['no_of_temp_labour'] = '<input type="text" name="temp_labor_'+str(i)+'_1" id="temp_labor_'+str(i)+'_1" value="'+str(record.id)+'">'
			json_record['target_cpg'] ='<span id="span_id_'+str(i)+'_2" class=\'green_values\'>'+str(record["target_cpg"])+'</span><input type="hidden" name="target_id_'+str(i)+'_2" id="target_id_'+str(i)+'_2" value="'+str(record["id"])+'"><input type="hidden" name="target_cpg_'+str(i)+'_2" id="target_cpg_'+str(i)+'_2" value="'+str(record["target_cpg"])+'"><input type="hidden" name="target_cpg_field_'+str(i)+'_2" id="target_cpg_field_'+str(i)+'_2" value="'+str('target_cpg')+'">'
			# json_record['target_cpu'] = record["target_cpu"]
			# json_record['target_cpg'] =record["target_cpg"]
			json_record['target'] = record["target"]
			json_record['target_size'] = record['target_size']
			i=i+1
			
			
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
	print("hii")
	
	values = request.GET.get('clicked_value')
	print(values)
	# print("+++++++++++++++++++++++++")
	# print(values)
	target_id = request.GET.get('id')
	print(target_id)
	# target = request.GET.get('target')
	# target_size = request.GET.get('target_size')
	# print("*************")
	# print(target_size)

	#print(target)

	#getting value list from the table GdbTarget
	target_cpg_data = GdbTarget.objects.filter(id=target_id).all().values_list()
	# print(target_cpg_data)

    #
	# for data in target_cpg_data:
	target_projectname = target_cpg_data[0][1]
	# target_cpg = target_cpg_data[0][4]
	
	# target_cpu = target_cpg_data[0][3]
	target_size = target_cpg_data[0][7]
	print("$$$$$**************$$$$$$$$")
	print(target_size)
	print("hello")
	clicked_label=request.GET.get('clicked_label')
	print(clicked_label)
	# if target_size == "units":
	# 	target_total1=float(values) * float(0.8)
	# else:
	# 	target_total2=float(values) * float(0.8)
	

	# if request.GET.get('clicked_label') == 'target_cpu':
	# 	print("hi")

	# 	#checking condition for the project name, which average value to be taken to calculate the target 2019 -20%	
	if target_projectname == "CUT & COMP" and target_size == "gallons":

        
		target_total=float(values) * float(0.8)
		print("&&&&&&&&&&&&&&&&&&&&&&&")
		print(target_total)
		# update_values={'target_cpu':values}

	elif target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
		target_total= float(values) * float(0.8)
		print("**************************")
		print(target_total)
		# update_values={'target_cpu':values}

	elif target_projectname not in ["CUT & COMP","Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
		if clicked_label == "target_cpu" and target_size == "units":
			target_total= float(values) * float(0.8)
		elif clicked_label == "target_cpg" and target_size == "gallons":
			target_total= float(values) * float(0.8)
		else:
			s=GdbTarget.objects.filter(id=target_id).all().values_list('target')
			target_total=s[0][0]




	# elif target_projectname in ["Compactor","PR19-5 PPG/ WM"]:
	# 	target_total = 0



	# else:

	# 	target_total = 0
	# 	print("____________________________")
	# 	print(target_total)
		# update_values={'target_cpu':values}
	# print(target_cpu)
	# print(target_projectname)
	# print(target_cpg)
	# print(target_total)
	#update done for target_cpu and target
	if clicked_label == "target_cpu":
		GdbTarget.objects.filter(id=target_id).update(target_cpu=values,target=target_total)
	else:
		GdbTarget.objects.filter(id=target_id).update(target_cpg=values,target=target_total)

	    
	# else:
	# 	#checking condition for the project name, which average value to be taken to calculate the target 2019 -20%
	# 	if target_projectname == "CUT & COMP":
            
	# 		target_total=float(values) * float(0.8)
	# 		print("HIIIIIIIIIs")
	# 		print(target_total)
	# 		# update_values={'target_cpg':values}

	# 	elif target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
	# 		target_total= float(target_cpu) * float(0.8)
	# 		print("HELLOs")
	# 		print(target_total)
	# 		# update_values={'target_cpg':values}

	# 	elif target_projectname not in ["CUT & COMP","Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:

	# 		if target_size == "gallons":
	# 			target_total=float(values) * float(0.8)
	# 		else:
	# 			target_total=float(values) * float(0.8)


	# 	else:
	# 		target_total = 0
	# 		print("LIST")
	# 		print(target_total)
	# 		# update_values={'target_cpg':values}
		    	
	# 	#update done for target_cpg and target
	# 	GdbTarget.objects.filter(id=target_id).update(target_cpg=values,target=target_total)


	return JsonResponse({"response":"success"})

@csrf_exempt   
def target_form(request):

    
	if request.method == "POST":

		target_projectname = request.POST.get('target_projectname')
		print("****************")
		print(target_projectname)
		target_cpu = request.POST.get('target_cpu')
		print("________________")
		print(target_cpu)

		target_cpg = request.POST.get('target_cpg')
		print("&&&&&&&&&&&&&&&&")
		print(target_cpg)
		size = request.POST.get('size','')
		print(size)

		if target_projectname == "CUT & COMP" or (size != '' and size == 'gallons'):
			target_cpgs=float(target_cpg) * float(0.8)

		elif (target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]) or (size != '' and size == 'units'):
			target_cpgs= float(target_cpu) * float(0.8)

		else:
			target_cpgs = 0


		a1=Project.objects.filter(project_name=target_projectname).values_list('id',flat=True);

		project_id=''

		if a1:
			project_id = a1[0]

		# f=[]
		s1=GdbTarget.objects.filter(target_projectname=target_projectname).values()
		if s1:
			# s = s1
			# for i in s:
			# 	for x in values:
			# 		data = {'target_projectname': x.target_projectname, 'target_cpu':target_cpu, 'target_cpg':target_cpg}
			# 		f.append(data)

			# messages.error(request,"The record already exists!")
			# return redirect('target')
			return redirect('target')
			# return HttpResponse("The project name already exists!")
		# return redirect(request,'target')
		else:
			s=GdbTarget(target_projectname=target_projectname,target_cpu=target_cpu,target_cpg=target_cpg,target=target_cpgs,status=1,target_project_id_id=project_id,target_size=size)
			s.save()

		return JsonResponse({'messages':'success' })
		#return HttpResponseRedirect(reverse('target'))

		# gdb_target = GdbTarget.objects(target_cpg=target_cpg)



	else:
		form = GdbTargetForm()
	# context={
	# 		'form': form
	# 		}

	query = Project.objects.filter(status='active').values();
	
	for i in query:
		print(i["project_name"])
	# print(query)
	# data = {}
	# data['option'] = query
	# print("hiii")
	# print(data)
	print("query")
	print(query)
	return render(request, 'target_list.html', {'form': form,'query':query})


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

# def json_response(func):
#     """
#     A decorator thats takes a view response and turns it
#     into json. If a callback is added through GET or POST
#     the response is JSONP.
#     """
#     def decorator(request, *args, **kwargs):
#         objects = func(request, *args, **kwargs)
#         if isinstance(objects, HttpResponse):
#             return objects
#         try:
#             data = simplejson.dumps(objects)
#             if 'callback' in request.REQUEST:
#                 # a jsonp response!
#                 data = '%s(%s);' % (request.REQUEST['callback'], data)
#                 return HttpResponse(data, "text/javascript")
#         except:
#             data = simplejson.dumps(str(objects))
#         return HttpResponse(data, "application/json")
#     return decorator

# @csrf_exempt
# @json_response
# def project_name_autocomplete(request):
# 	if request.GET.get('term'):
# 		#p = Project.objects.filter(project_name__icontains=c)
# 		data = Project.objects.filter(status='active').values_list('project_name', flat=True);
		
# 		# data = model.objects.using('legacy').filter(email__startswith=q).values_list('email',flat=True)
# 		json = list(data)
# 		#return [{"id":"1","label":"asd","value":"qwe"}]
		
# 		return JsonResponse(json, safe=False)

# 	else:
# 		json = {"id":"1","label":"asd","value":"qwe"}
# 		return json_response(json,safe=False)
# 		return [{"id":"1","label":"asd","value":"qwe"}]

	# query = Project.objects.filter(status='active').values();
	

@csrf_exempt

def project_name_autocomplete(request):
    if request.is_ajax():
        q = request.GET.get('term', '')
        data = Project.objects.filter(project_name__icontains = q )[:20]
        results = []
        for row in data:
            json_data = {}
            json_data['id'] = row.id
            json_data['label'] = row.project_name
            json_data['value'] = row.project_name
            results.append(json_data)
        data = json.dumps(results)
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype)

@csrf_exempt
def modal_pop_form(request):
	return render(request,'form.html')


@csrf_exempt
def check_project_name_exists(request):
	if request.method == "POST":
		project_name = request.POST.get('project_name')
		check = GdbTarget.objects.filter(target_projectname=project_name).count()
		if check > 0:
			return JsonResponse({'message':'false'},safe=False)
		else:
		    return JsonResponse({'message':'true'},safe=False)	


	
