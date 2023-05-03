from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

#thay đổi form đăng ký trong django
class createUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username','email', 'password1', 'password2']
