from rest_framework import serializers
from .models import UserArtist,UserContr,CommentsToArtists,Proposal

class UserArtistSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserArtist
        fields = '__all__'
    

class UserContrSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserContr
        fields = '__all__'

class CommentsToArtistSerailizer(serializers.ModelSerializer):
    class Meta:
        model = CommentsToArtists
        fields = '__all__'

class ProposalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proposal
        fields = '__all__'