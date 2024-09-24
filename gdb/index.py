from django.shortcuts import render,redirect
from django.urls import reverse
from django.http import HttpResponse,HttpResponseRedirect
from master import views
# from master import urls


def index(request):
	return HttpResponseRedirect(reverse('login'))