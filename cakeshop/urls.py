from django.urls import path
from . import views

app_name = 'cakeshop'

urlpatterns = [
    path('', views.Home.home, name='home'),
    path('cake/<int:pk>/', views.Shop.cake_detail, name='cake_detail'),
    path('cate/<int:pk>/', views.Shop.cate_detail, name='cate_detail'),
    path('shop', views.Shop.cakes_list, name='shop'),
    path('addtocart/<int:pk>/', views.Cart.cart_add, name='add_to_cart'),
    path('cart', views.Cart.cart_list, name='cart'),
    path('search', views.Shop.search, name='search'),
    path('update/<int:pk>/', views.Cart.cart_update, name='update_item'),
    path('remove/<int:pk>/', views.Cart.cart_remove, name='remove_item'),
    path('bill/<int:pk>/', views.BillView.get_bill, name='bill'),
    path('bill/create/', views.BillView.create_bill, name='create_bill'),
    path('history/', views.BillView.get_all_bill, name='purchase_history'),
]
