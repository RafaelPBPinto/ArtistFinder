from rest_framework import generics,filters
from .models import UserArtist,UserContr,CommentsToArtists,Proposal
from .serializers import UserArtistSerializer,UserContrSerializer,CommentsToArtistSerailizer,ProposalSerializer
import os
from django.conf import settings
from django.shortcuts import render 
from django.http import HttpResponse, Http404


def image_detail(request, image):
    image_path = os.path.join(settings.MEDIA_ROOT, 'images', image)
    if os.path.exists(image_path):
        with open(image_path, 'rb') as f:
            return HttpResponse(f.read(), content_type="image/jpeg")
    else:
        raise Http404("Image not found")
    

def image_list(request):
    image_dir = os.path.join(settings.MEDIA_ROOT, 'images')
    images = os.listdir(image_dir)
    urls = [f'/images/{image}' for image in images]
    return render(request,'image_list.html' , {'urls':urls})

# Create your views here.
class UserArtistGetPost(generics.ListCreateAPIView):
    queryset = UserArtist.objects.all()
    serializer_class = UserArtistSerializer
class UserArtistUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = UserArtist.objects.all()
    serializer_class = UserArtistSerializer

class UserContrGetPost(generics.ListCreateAPIView):
    queryset = UserContr.objects.all()
    serializer_class = UserContrSerializer

class CommentPost(generics.ListCreateAPIView):
    queryset = CommentsToArtists.objects.all()
    serializer_class = CommentsToArtistSerailizer

class ProposalPost(generics.ListCreateAPIView):
    queryset = Proposal.objects.all()
    serializer_class = ProposalSerializer
    
    def get_queryset(self):
        return super().get_queryset().filter(id_artist = self.kwargs['id_artist'])

class ProposalUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Proposal.objects.all()
    serializer_class = ProposalSerializer