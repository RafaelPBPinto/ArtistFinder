# Generated by Django 3.2.12 on 2023-04-15 09:39

import api.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20230415_0932'),
    ]

    operations = [
        migrations.AddField(
            model_name='userartist',
            name='image_url',
            field=models.ImageField(blank=True, upload_to=api.models.upload_to),
        ),
    ]
