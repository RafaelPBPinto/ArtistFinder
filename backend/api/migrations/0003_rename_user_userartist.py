# Generated by Django 3.2.12 on 2023-04-15 07:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_alter_user_data_nasc'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='User',
            new_name='UserArtist',
        ),
    ]