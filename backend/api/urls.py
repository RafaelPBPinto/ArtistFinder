from django.contrib import admin
from django.urls import path,include
from .views import UserArtistGetPost,UserContrGetPost,UserArtistUpdateDelete,CommentPost
from . import views

urlpatterns = [
    path('artists',UserArtistGetPost.as_view()),
    path('artists/<int:pk>',UserArtistUpdateDelete.as_view()),
    path('contrs',UserContrGetPost.as_view()),
    path('images/',views.image_list,name="image_list"),
    path('images/<str:image>',views.image_detail,name = "image_detail"),
    path('comments',CommentPost.as_view())

]
