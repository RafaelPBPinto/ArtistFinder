from rest_framework import generics
from .models import UserArtist,UserContr
from .serializers import UserArtistSerializer,UserContrSerializer

# Create your views here.
class UserArtistGetPost(generics.ListCreateAPIView):
    queryset = UserArtist.objects.all()
    serializer_class = UserArtistSerializer

class UserContrGetPost(generics.ListCreateAPIView):
    queryset = UserContr.objects.all()
    serializer_class = UserContrSerializer