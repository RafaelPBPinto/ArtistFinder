from django.db import models

def upload_to(instance, filename):
    return 'images/{filename}'.format(filename=filename)

# Create your models here.
class UserArtist(models.Model):
    username = models.CharField(max_length= 100,null=False)
    email = models.CharField(max_length= 100,null= False)
    password = models.CharField(max_length=100,null= False)
    data_nasc = models.DateField()
    type = models.CharField(max_length=50,default = 'Musico')
    avaliation = models.FloatField(default= 0)
    image_url = models.ImageField(blank = True, null = False,upload_to=upload_to)

    def __str__(self) :
        return self.username
    

class UserContr(models.Model):
    username = models.CharField(max_length= 100,null=False)
    email = models.CharField(max_length= 100,null= False)
    password = models.CharField(max_length=100,null= False)
    data_nasc = models.DateField()

    def __str__(self) :
        return self.username