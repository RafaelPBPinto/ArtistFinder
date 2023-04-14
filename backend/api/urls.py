from django.contrib import admin
from django.urls import path,include
from .views import UserGet


urlpatterns = [
    path('',UserGet.as_view())
]
