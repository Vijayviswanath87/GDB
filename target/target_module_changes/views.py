from django.shortcuts import render, redirect





# Create your views here.


from .models import*
from .forms import GdbTargetForm
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages


# #Added
from django.http import HttpResponseRedirect,HttpResponse,JsonResponse
from master.models import *


import json
from django.core.serializers.json import DjangoJSONEncoder

from decimal import Decimal, getcontext
import decimal
from django.urls import reverse


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
	
	
	values = request.GET.get('clicked_value')
	# print(values)
	
	target_id = request.GET.get('id')
	# print(target_id)
	
	

	#getting value list from the table GdbTarget

	target_cpg_data = GdbTarget.objects.filter(id=target_id).all().values_list()
	

    
	# for data in target_cpg_data:
	target_projectname = target_cpg_data[0][1]
	target_project_id_id = target_cpg_data[0][5]
	# print("#******##******########*")
	# print(target_project_id_id)
	# target_cpg = target_cpg_data[0][3]
	
	# target_cpu = target_cpg_data[0][2]
	target_size = target_cpg_data[0][7]
	
	clicked_label = request.GET.get('clicked_label')
	
	a=Project.objects.filter(id=target_project_id_id).values_list('id',flat=True);
	# print(a[0])
	b=Project.objects.filter(project_name=target_projectname).values_list('project_name',flat=True);
	# print(b[0])
	

	# if target_project_id_id == a[0] and target_size == "gallons":

        
	# 	target_total=float(values) * float(0.8)
		

	# elif target_project_id_id == a[0] and target_size == "units" :
	# 	target_total= float(values) * float(0.8)


	# print(clicked_label)
	# print(target_size)
	# print(values)
	if target_project_id_id != None and target_project_id_id == a[0] and target_projectname == b[0]:
		if clicked_label == "target_cpu" and target_size == "units":
			target_total=float(values) * float(0.8)
		elif clicked_label == "target_cpg" and target_size == "gallons":
			target_total= float(values) * float(0.8)
		else:
			pass

		# print(target_total)
	# Checking clicked_label's size of the newly added project in target module and then calculating the target 2019 -20%
	else:
		if clicked_label == "target_cpu" and target_size == "units":
			target_total= float(values) * float(0.8)
		elif clicked_label == "target_cpg" and target_size == "gallons":
			target_total= float(values) * float(0.8)
		else:
			s=GdbTarget.objects.filter(id=target_id).all().values_list('target')
			target_total=s[0][0]
		# print("******************")
		# print(target_total)
	# project_name = ''
	# if a:
	# 	project_name = a[0]
	# 	print("***************")
	# 	print(project_name)
	# checking condition for the project name, which average value to be taken to calculate the target 2019 -20%	
	# if target_projectname == "CUT & COMP" and target_size == "gallons":

        
	# 	target_total=float(values) * float(0.8)
		

	# elif target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
	# 	target_total= float(values) * float(0.8)
		
	# # Checking clicked_label's size of the newly added project in target module and then calculating the target 2019 -20%
	# elif target_projectname not in ["CUT & COMP","Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]:
	# 	if clicked_label == "target_cpu" and target_size == "units":
	# 		target_total= float(values) * float(0.8)
	# 	elif clicked_label == "target_cpg" and target_size == "gallons":
	# 		target_total= float(values) * float(0.8)
	# 	else:
	# 		s=GdbTarget.objects.filter(id=target_id).all().values_list('target')
	# 		target_total=s[0][0]




	if clicked_label == "target_cpu":
		if target_size == "units":
			GdbTarget.objects.filter(id=target_id).update(target_cpu=values,target=target_total)
		else:
			GdbTarget.objects.filter(id=target_id).update(target_cpu=values)

	elif clicked_label == "target_cpg":
		if target_size == "gallons":
			GdbTarget.objects.filter(id=target_id).update(target_cpg=values,target=target_total)
		else:
			GdbTarget.objects.filter(id=target_id).update(target_cpg=values)

	else:
		pass

	# a=Project.objects.filter(project_name=target_projectname).values_list('project_name',flat=True);
	# project_name = ''
	# if a:
	# 	project_name = a[0]
	# 	print("***************")
	# 	print(project_name)
	    
	
	return JsonResponse({"response":"success"})

@csrf_exempt   
def target_form(request):

    
	if request.method == "POST":

		target_projectname = request.POST.get('target_projectname')
		
		target_cpu = request.POST.get('target_cpu')
		
		target_cpg = request.POST.get('target_cpg')
		
		size = request.POST.get('size','')
		

		if target_projectname == "CUT & COMP" or (size != '' and size == 'gallons'):
			target_cpgs=float(target_cpg) * float(0.8)

		elif (target_projectname in ["Ollie's Aerosol Sorting","Roller Cover Sleeving","Roller Sorting","Applicator Stickering","Aerosol Stickering"]) or (size != '' and size == 'units'):
			target_cpgs= float(target_cpu) * float(0.8)

		else:
			target_cpgs = 0


		a1=Project.objects.filter(project_name=target_projectname).values_list('id',flat=True);
		# print("+++++++++++++++++++++++++")
		# print(a1)

		project_id=''

		if a1:
			project_id = a1[0]
			print(project_id)

		
		s1=GdbTarget.objects.filter(target_projectname=target_projectname).values()
		if s1:
			
			return redirect('target')
			
		else:
			s=GdbTarget(target_projectname=target_projectname,target_cpu=target_cpu,target_cpg=target_cpg,target=target_cpgs,status=1,target_project_id_id=project_id,target_size=size)
			s.save()

		return JsonResponse({'messages':'success' })
		



	else:
		form = GdbTargetForm()
	# context={
	# 		'form': form
	# 		}

	query = Project.objects.filter(status='active').values();
	
	for i in query:
		print(i["project_name"])
	# # print(query)
	# # data = {}
	# # data['option'] = query
	# # print("hiii")
	# # print(data)
	# print("query")
	# print(query)
	return render(request, 'target_list.html', {'form': form,'query':query})


@csrf_exempt 
def master_project_list(request):
    query = request.GET.get('q', None)

    
    if query:
        project_name = GdbTarget.objects.filter(target_projectname__icontains=query).values("id","target_projectname")
        project_name = list(project_name)
        
        return JsonResponse(project_name, safe=False)
    else:
        return JsonResponse(data={'success': False,
                                  'errors': 'No mathing items found'})


	

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


	
