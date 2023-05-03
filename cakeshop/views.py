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
    @staticmethod
    def switch_to_order(request):
        cart = Cart.get_cart(request)
        username = request.user
        print(username)
        if len(cart) != 0 and username != None:
            for item in cart:
                try:
                    order = Order.objects.get(
                        user=username, cake_id=item['id'])
                    order.quantity += item['quantity']
                    order.save()
                except Order.DoesNotExist:
                    order = Order.objects.create(
                        user=username, cake_id=item['id'], quantity=item['quantity'])
                    print(order)
                    order.save()
            del request.session['cart']

    @staticmethod
    def get_cart(request):
        cart = request.session.get('cart', [])
        if not isinstance(cart, list):
            cart = list(cart.value())
        return cart

    def cart_list(request):
        cart = []
        if request.user.is_authenticated == False:
            cart = Cart.get_cart(request)
        else:
            username = request.user
            orders = Order.objects.filter(user=username)
            cakes = Cake.objects.all()
            total = 0
            for order in orders:
                for cake in cakes:
                    if cake.id == order.cake_id:
                        price = float(cake.price) * float(order.quantity)
                        total += price
                        new_item = {'id': order.id, 'name': cake.name,
                                    'image_url': cake.image_url, 'price': price, 'quantity': order.quantity}
                        cart.append(new_item)
            request.session['total'] = total
        context = {'carts': cart}
        return render(request, 'cakeshop/shopping_cart.html', context)

    def cart_add(request, pk):
        cart = Cart.get_cart(request)
        cake_exit = False
        cake = get_object_or_404(Cake, pk=pk)
        total = 0
        quantity = int(request.POST.get('quantity', 0))

        if request.user.is_authenticated == False:
            for item in cart:
                if item['id'] == pk:
                    item['quantity'] += quantity
                    item['price'] = float(cake.price) + item['quantity']
                    cake_exit = True

            if not cake_exit:
                new_item = {'id': pk, 'name': cake.name, 'image_url': cake.image_url,
                            'price': float(cake.price), 'quantity': quantity}
                cart.append(new_item)
            count = len(cart)
            request.session['count'] = count
            request.session['cart'] = cart
            total = sum([float(item['price']) for item in cart])
        else:
            username = request.user
            try:
                order = Order.objects.get(user=username, cake_id=pk)
                order.quantity += quantity
                order.save()
            except Order.DoesNotExist:
                order = Order.objects.create(
                    user=username, cake_id=pk, quantity=quantity)
                order.save()
            orders = Order.objects.filter(user=username)
            count = len(orders)
            request.session['count'] = count

        request.session['total'] = total
        return redirect("/shop")

    def cart_update(request, pk):
        quantity = int(request.POST.get('quantity', 0))

        if request.user.is_authenticated == False:
            cart = Cart.get_cart(request)
            cake = get_object_or_404(Cake, pk=pk)
            for i, item in enumerate(cart):
                if item['id'] == pk:
                    if quantity == 0:
                        cart.pop(i)
                    else:
                        item['quantity'] = quantity
                        item['price'] = float(cake.price) * quantity
                    break
            request.session['cart'] = cart
            total = sum([float(item['price']) for item in cart])
            request.session['total'] = total

        else:
            username = request.user
            try:
                order = Order.objects.get(user=username, id=pk)
                order.quantity = quantity
                order.save()
            except Order.DoesNotExist:
                pass
        return redirect("/cart")

    def cart_remove(request, pk):
        total = 0
        if request.user.is_authenticated == False:
            cart = Cart.get_cart(request)
            for i, item in enumerate(cart):
                if item['id'] == pk:
                    cart.pop(i)
                    break
            request.session['cart'] = cart
            total = sum([float(item['price']) for item in cart])
        else:
            username = request.user
            try:
                order = Order.objects.get(user=username, id=pk)
                order.delete()
                orders = Order.objects.filter(user=username)
                cakes = Cake.objects.all()
                for itemOrder in orders:
                    for item in cakes:
                        if item.id == itemOrder.cake_id:
                            total += float(item.price) * \
                                float(itemOrder.quantity)
            except Order.DoesNotExist:
                pass

        request.session['total'] = total
        return redirect("/cart")


class BillView(View):
    def get_bill(request, pk):
        bill = get_object_or_404(Bill, pk=pk)
        cake_list = json.loads(bill.cake_list)
        context = {'bill': bill, 'cake_list': cake_list}
        return render(request, ['cakeshop/bill.html', 'cakeshop/purchase_history.html'], context)

    def create_bill(request):
        if request.user.is_authenticated == False:
            return redirect('/authentication/login/')
        else:
            username = request.user
            if request.method == 'POST':
                email = request.POST['email']
                first_name = request.POST['first_name']
                last_name = request.POST['last_name']
                address = request.POST['address']
                town_city = request.POST['town_city']
                phone_number = request.POST['phone_number']
                add_information = request.POST.get('add_information', '')

                cake_list = []
                total_price = 0
                orders = Order.objects.filter(user=username)
                cakes = Cake.objects.all()
                for order in orders:
                    for cake in cakes:
                        if cake.pk == order.cake_id:
                            cake_name = cake.name
                            quantity = order.quantity
                            total_price += float(cake.price) * \
                                float(order.quantity)
                            cake.quantity -= quantity
                            cake.save()
                            cake_list.append(
                                {'cake_name': cake_name, 'price': float(cake.price), 'quantity': int(quantity)})

                cake_list = json.dumps(cake_list)
                bill = Bill.objects.create(user=username, email=email, first_name=first_name, last_name=last_name, address=address, town_city=town_city,
                                           phone_number=phone_number, add_information=add_information, cake_list=cake_list, total_price=total_price)
                bill.save()
                Order.objects.filter(user=username).delete()

                return redirect(reverse('cakeshop:bill', args=[bill.pk]))
            else:
                orders = Order.objects.filter(user=username)
                cakes = Cake.objects.all()
                cart = []
                total = 0
                for order in orders:
                    for cake in cakes:
                        if cake.id == order.cake_id:
                            price = float(cake.price) * float(order.quantity)
                            total += price
                            new_item = {'id': order.id, 'name': cake.name,
                                        'price': price, 'quantity': order.quantity}
                            cart.append(new_item)
                request.session['total'] = total
                context = {'cart': cart}
                return render(request, 'cakeshop/create_bill.html', context)

    def get_all_bill(request):
        bill_list = Bill.objects.filter(user=request.user)
        bills = []
        for bill in bill_list:
            cake_list = json.loads(bill.cake_list)
            new_bill = {'id': bill.id, 'email': bill.email, 'phone_number': bill.phone_number,
                        'first_name': bill.first_name, 'last_name': bill.last_name,
                        'town_city': bill.town_city, 'address': bill.address,
                        'date': bill.date, 'note': bill.add_information,
                        'cake_list': cake_list, 'total': float(bill.total_price)}

            bills.append(new_bill)

        context = {'bills': bills}
        return render(request, 'cakeshop/purchase_history.html', context)
