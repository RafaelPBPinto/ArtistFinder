# Generated by Django 4.1.7 on 2023-05-05 16:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0018_alter_artiststypes_style'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proposal',
            name='details',
            field=models.CharField(blank=True, max_length=500),
        ),
    ]