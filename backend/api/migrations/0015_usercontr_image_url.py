# Generated by Django 4.1.7 on 2023-04-30 10:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0014_alter_userartist_no_avaliations'),
    ]

    operations = [
        migrations.AddField(
            model_name='usercontr',
            name='image_url',
            field=models.ImageField(blank=True, null=True, upload_to='images/'),
        ),
    ]
