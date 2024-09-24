from django import forms  
from target.models import GdbTarget  
  
# class GdbTargetForm(forms.ModelForm):  
#     class Meta:  
#         model = GdbTarget  
#         fields = "__all__"

class GdbTargetForm(forms.ModelForm):
    # target_projectname = forms.ModelChoiceField(queryset= master_project.objects.all(),
    #     widget=autocomplete.ModelSelect2(url='country-autocomplete')
    # target_cpu = forms.DecimalField(max_digits=10, min_digits=8, decimal_places=2)
    # target_cpg = forms.DecimalField(max_digits=10, min_digits=8, decimal_places=2)
    # target_projectname = forms.ChoiceField(error_messages={'required':'Project Name is must.'},widget=forms.Select,choices=get_project_names)


    class Meta:
        model  = GdbTarget
        # fields = "__all__"
        fields = ["target_projectname","target_cpu","target_cpg"]