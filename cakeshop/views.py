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
        categories = Category.objects.all()
        cakes = Cake.objects.all().order_by('-id')
        if request.user.is_authenticated:
            Cart.switch_to_order(request)
            orders = Order.objects.filter(user=request.user)
            count = len(orders)
            request.session['count'] = count
        else:
            cart = Cart.get_cart(request)
            count = len(cart)
            request.session['count'] = count
        context = {'categories': categories, 'cakes': cakes}
        return render(request, 'cakeshop/index.html', context)

class Shop(View):
    def cakes_list(request):
        cakes = Cake.objects.all().order_by('-id')
        categories = Category.objects.all()
        cheap_cakes = Cake.objects.all().order_by('price')[:20]

        if request.user.is_authenticated == False:
            cart = Cart.get_cart(request)
            count = len(cart)
            request.session['count'] = count
        else:
            orders = Order.objects.filter(user=request.user)
            count = len(orders)
            request.session['count'] = count
        context = {'cakes': cakes, 'categories': categories, 'count': count,
                   'cheap_cakes': cheap_cakes, }
        return render(request, 'cakeshop/products.html', context)

    def search(request):
        query = request.GET.get('query')
        if query:
            cakes = Cake.search(query)
        else:
            cakes = Cake.objects.all()

        categories = Category.objects.all()
        context = {'categories': categories, 'cakes': cakes}

        return render(request, 'cakeshop/products.html', context)

    def cake_detail(request, pk):
        cake = get_object_or_404(Cake, pk=pk)
        return render(request, 'cakeshop/cake_detail.html', {'cake': cake})

    def cate_detail(request, pk):
        categories = Category.objects.all()
        cakes = Cake.objects.filter(category=pk)
        context = {'categories': categories, 'cakes': cakes}
        return render(request, ['cakeshop/products.html', 'cakeshop/base.html'], context)

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
