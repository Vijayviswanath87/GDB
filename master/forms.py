from django import forms
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm

from django.contrib.auth.models import User
from .models import *
# from parsley.decorators import parsleyfy
from django.forms import widgets



class LoginForm(AuthenticationForm):
    username = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control','placeholder':'Password'}))
    class Meta:
        model= User
        fields = [
        "username", "password1"
        
        ]
