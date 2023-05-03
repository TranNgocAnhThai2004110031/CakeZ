from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from .models import*
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

# Create your views here.
def get_index(request):
    return render(request, 'cakeshop/cake_list.html')


def get_register(request):
    
    return render(request, 'authentication/register.html')

def get_login(request):

    context = {}
    return render(request, 'authentication/login.html', context)

def get_logout(request):
    
    return redirect("/authentication/login/")
