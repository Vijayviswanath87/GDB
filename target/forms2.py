from django import forms
# from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.forms import ModelForm
from django.contrib.auth.models import User
from .models import *
# from parsley.decorators import parsleyfy
from django.forms import widgets



class TargetForm(forms.ModelForm):
    target_projectname = forms.ChoiceField(error_messages={'required':'Project Name is must.'},widget=forms.Select,choices=get_project_names,)
	# target_projectname = forms.TextField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'projectname'}))
	target_cpu = forms.DecimalField(max_digits=10, min_digits=8, decimal_places=2)
	target_cpg = forms.DecimalField(max_digits=10, min_digits=8, decimal_places=2)
	class Meta:
		model  = GdbTarget
		fields = ["target_projectname","target_cpu","target_cpg"]

        # def get_project_names():
        #     result = GdbTarget.objects.filter(target_projectname=target_projectname)
        #     print("--------------------")
        #     print(result)
        #     # project_names = [(country.country_name,country.country_name.title()) for country in result]
        #     return result
            # fullname = forms.CharField(error_messages={'required':'Name field must be filled out.'}, label=_('Full name'))
            # org = forms.CharField(error_messages={'required':'Organization field must be filled out.'},label=_('Organization'))
            # email = forms.EmailField(error_messages={'required':'Email field must be filled out.'},label=_('Email'))
            # phone = forms.CharField(error_messages={'required':'Phone Number field must be filled out.'}, label=_('Phone'))
            # country = forms.ChoiceField(error_messages={'required':'Country field must be filled out.'},widget=forms.Select,choices=get_country_names,)
