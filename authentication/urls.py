from django.contrib import admin
from django.urls import path
from . import views
app_name = 'authentication'

urlpatterns = [
    path('', views.get_index, name='home'),
    path('register/', views.get_register, name='register'),
    path('login/', views.get_login, name='login'),
    path('logout', views.get_logout, name='logout')
]