from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'

class ExtrasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Extras
        fields = '__all__'

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = '__all__'

class OrderItemExtrasSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItemExtras
        fields = '__all__'