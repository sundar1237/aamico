# Generated by Django 2.1.15 on 2020-08-08 21:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_remove_product_discountpercentage'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='extras',
            options={'ordering': ['seqNo']},
        ),
    ]
