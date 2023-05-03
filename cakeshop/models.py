from django.db import models
from django.db.models import Q
from django.contrib.auth.models import User

# Create your models here.
class Category(models.Model):
    class Meta:
        verbose_name_plural = 'Categories'
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name

class Cake(models.Model):
    name = models.CharField(max_length=255)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    quantity = models.IntegerField()
    description = models.TextField()
    image_url = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name
    
    @staticmethod
    def search(query):
        return Cake.objects.filter(
            Q(name__icontains=query) | 
            Q(category__name__icontains=query) |
            Q(price__icontains=query) |
            Q(quantity__icontains=query) |
            Q(description__icontains=query)
        ).distinct()
        
class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    cake = models.ForeignKey(Cake, on_delete=models.CASCADE)
    quantity = models.IntegerField()

class Bill(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    email = models.EmailField()
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    address = models.CharField(max_length=255)
    town_city = models.CharField(max_length=50)
    phone_number = models.CharField(max_length=12)
    add_information = models.TextField(max_length=500, null=True, blank=True)
    cake_list = models.JSONField()
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateTimeField(auto_now_add=True)
    def __str__(self) -> str:
        return self.user.username