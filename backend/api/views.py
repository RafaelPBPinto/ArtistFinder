from rest_framework import generics
from .models import User
from .serializers import UserSerializer

# Create your views here.
class UserGet(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer