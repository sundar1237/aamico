# Generated by Django 2.1.15 on 2020-08-07 10:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_auto_20200807_1120'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='discountPercentage',
        ),
    ]