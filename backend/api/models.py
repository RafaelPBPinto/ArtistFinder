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
    description = models.CharField(max_length= 500 , default= '')
    locality = models.CharField(max_length= 50,default = '')
    avaliation = models.FloatField(default= 0)
    image_url = models.ImageField(blank = True, null = False,upload_to= 'images/')
    no_avaliations = models.IntegerField(blank = True, null = True)

    def __str__(self) :
        return self.username
    

class UserContr(models.Model):
    username = models.CharField(max_length= 100,null=False)
    email = models.CharField(max_length= 100,null= False)
    password = models.CharField(max_length=100,null= False)
    data_nasc = models.DateField()

    def __str__(self) :
        return self.username
    

class CommentsToArtists(models.Model):
    id_contr = models.ForeignKey(UserContr,related_name='contr_id',on_delete=models.CASCADE)
    id_artist = models.ForeignKey(UserArtist,related_name='art_id',on_delete=models.CASCADE)
    comment = models.CharField(max_length=500,null=False,blank=False)