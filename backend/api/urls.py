from django.contrib import admin
from django.urls import path,include
from .views import UserArtistGetPost,UserContrGetPost


urlpatterns = [
    path('artists',UserArtistGetPost.as_view()),
    path('contrs',UserContrGetPost.as_view())
]
