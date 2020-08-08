# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""
import datetime

from django.contrib.postgres.fields import ArrayField
from django.contrib.postgres.fields import HStoreField
from django.db import models

class Product(models.Model):
    class Meta:
        ordering = ['seqNo']
    seqNo = models.PositiveSmallIntegerField(default=1, editable=True)
    name = models.CharField(max_length=100, null=True, default=None, editable=True)
    description = models.CharField(max_length=500, null=True, blank=True, default=None, editable=True)
    createDate = models.DateTimeField(auto_now_add=True)
    unitPrice = models.FloatField(null=False, blank=False, default=None)
    productType = models.CharField(max_length=500, null=True, blank=True, default=None, editable=True)
    imagePath = models.CharField(max_length=500, null=True, blank=True, default=None, editable=True)
    data = HStoreField(default=None, null=True, blank=True)

    def __str__(self):
        return f"{self.seqNo} > {self.name} {self.description} {self.productType}"

class Order(models.Model):
    class Meta:
        ordering = ['-id']

    cash = 'Cash'
    byCard = 'By Card'
    payMethod = [(cash, 'Cash'), (byCard, 'By Card')]

    direct = 'Direct'
    byPhone = 'By Phone'
    byOnline = 'By Online'
    orderType = [(direct, 'Direct'), (byPhone, 'By Phone'), (byOnline, 'By Online')]

    takeaway = 'Take Away'
    eatHere = 'Eat here'
    homeDelivery = 'Home Delivery'

    deliveryTypeOptions = [(takeaway, 'Take Away'), (eatHere, 'Eat here'), (homeDelivery, 'Home Delivery')]

    paid = 'Paid'
    unpaid = 'Unpaid'
    payStatus = [(paid, 'Paid'), (unpaid, 'Unpaid')]

    new = 'New'
    progress = 'Progress'
    readyToServe = 'Ready'
    delivered = 'Delivered'
    cancelled = 'Cancelled'
    orderStatus = [(new, 'New'), (progress, 'Progress'), (readyToServe, 'Ready'), (delivered, 'Delivered'),(cancelled, 'Cancelled')]

    paymentStatus = models.CharField(max_length=20, choices=payStatus, default=unpaid)
    paymentMethod = models.CharField(max_length=20, choices=payMethod, default=cash)
    status = models.CharField(max_length=20, choices=orderStatus, default=new)
    type = models.CharField(max_length=20, choices=orderType, default=direct)
    deliveryType = models.CharField(max_length=30, choices=deliveryTypeOptions, default=takeaway)
    totalPrice = models.FloatField(default=0.0, null=True, blank=True, editable=True)
    createDate = models.DateTimeField(auto_now_add=True)
    total_noOfItems = models.PositiveIntegerField(default=1, editable=True)
    data = HStoreField(default=None, null=True, blank=True)
    customer_nick_name = models.CharField(max_length=50, null=True, default=None, editable=True)

    def __str__(self):
        return f" {self.createDate} {self.status} {self.type}"

class Extras(models.Model):
    class Meta:
        ordering = ['seqNo']
    seqNo = models.PositiveSmallIntegerField(default=1, editable=True)
    name = models.CharField(max_length=100, null=True, default=None, editable=True)
    description = models.CharField(max_length=500, null=True, blank=True, default=None, editable=True)
    type = models.CharField(max_length=50, null=True, blank=True, default=None, editable=True)
    createDate = models.DateTimeField(auto_now_add=True)
    unitPrice = models.FloatField(default=1.0, null=False, blank=False)
    def __str__(self):
        return f" {self.createDate} {self.seqNo} {self.name}"

class OrderItem(models.Model):
    seqNo = models.PositiveIntegerField(default=1, editable=True)
    noOfItems = models.PositiveIntegerField(default=1, editable=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='children')
    product = models.ForeignKey(Product, on_delete=models.SET_DEFAULT, related_name='items', default=None)
    unitPrice = models.FloatField(null=False, blank=False, default=None)
    extrasPrice = models.FloatField(null=False, blank=False, default=None)
    userInput = models.CharField(max_length=250, null=True, default=None, blank=True, editable=True)
    totalPrice = models.FloatField(default=0.0, null=True, blank=True, editable=True)

    def __str__(self):
        return f" {self.noOfItems} {self.order} {self.product}"

class OrderItemExtras(models.Model):
    seqNo = models.PositiveIntegerField(default=1, editable=True)
    orderItem = models.ForeignKey(OrderItem, on_delete=models.CASCADE, related_name='children')
    extras = models.ForeignKey(Extras, on_delete=models.SET_DEFAULT, related_name='extras', default=None)

    def __str__(self):
        return f" {self.seqNo} {self.orderItem} {self.extras}"