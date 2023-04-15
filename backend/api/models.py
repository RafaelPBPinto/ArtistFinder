from django.db import models

# Create your models here.
class UserArtist(models.Model):
    username = models.CharField(max_length= 100,null=False)
    email = models.CharField(max_length= 100,null= False)
    password = models.CharField(max_length=100,null= False)
    data_nasc = models.DateField()

    def __str__(self) :
        return self.username
    

class UserContr(models.Model):
    username = models.CharField(max_length= 100,null=False)
    email = models.CharField(max_length= 100,null= False)
    password = models.CharField(max_length=100,null= False)
    data_nasc = models.DateField()

    def __str__(self) :
        return self.username