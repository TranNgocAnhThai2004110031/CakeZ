from django.shortcuts import render, get_object_or_404
from .models import Category, Cake, Order, Bill
from django.contrib.auth.models import User
from django.shortcuts import redirect
import pickle
import json
import numpy as np
from django.views import View
from django.urls import reverse
import datetime

# class
class Home(View):
    def home(request):
        
        return render(request, 'cakeshop/index.html')

class Shop(View):
    def cakes_list(request):
        
        return render(request, 'cakeshop/products.html')

    def search(request):

        return render(request, 'cakeshop/products.html')

    def cake_detail(request, pk):
        
        return render(request, 'cakeshop/cake_detail.html')

    def cate_detail(request, pk):
        return render(request, ['cakeshop/products.html', 'cakeshop/base.html'])

class Cart(View):

    def cart_list(request):
        
        return render(request, 'cakeshop/shopping_cart.html')

    def cart_add(request, pk):
        
        return redirect("/shop")

    def cart_update(request, pk):
        
        return redirect("/cart")

    def cart_remove(request, pk):
        
        return redirect("/cart")


class BillView(View):
    def get_bill(request, pk):
        
        return render(request, ['cakeshop/bill.html', 'cakeshop/purchase_history.html'])

    def create_bill(request):
        
        return redirect(reverse('cakeshop:bill'))
            

    def get_all_bill(request):
        
        return render(request, 'cakeshop/purchase_history.html')
