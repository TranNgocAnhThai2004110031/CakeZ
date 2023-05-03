from django.contrib import admin
from .models import Category, Cake, Bill
import json

# Register your models here.
class CakeAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'quantity', 'price', 'image_url')
    search_fields = ('name', )
    
class CategoryAdmin(admin.ModelAdmin):
    search_fields = ('name',)

class BillAdmin(admin.ModelAdmin):
    list_display = ('user', 'email', 'get_cakes_summary', 'total_price', 'first_name', 'last_name', 'address', 'town_city', 'phone_number', 'add_information')

    def get_cakes_summary(self, obj):
        cake_list = json.loads(json.dumps(obj.cake_list))
        return ", ".join([Cake.objects.get(name=cake_name).name for cake_name in cake_list])
    get_cakes_summary.short_description = 'Cakes'

admin.site.register(Category, CategoryAdmin)
admin.site.register(Cake, CakeAdmin)
admin.site.register(Bill, BillAdmin)

