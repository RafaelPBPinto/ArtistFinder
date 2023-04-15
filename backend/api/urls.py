from django.contrib import admin
from django.urls import path,include
from .views import UserArtistGetPost,UserContrGetPost,UserArtistUpdateDelete


urlpatterns = [
    path('artists',UserArtistGetPost.as_view()),
    path('artists/<int:pk>',UserArtistUpdateDelete.as_view()),
    path('contrs',UserContrGetPost.as_view())
]
