# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from django.urls import path

from app import views
import urllib



urlpatterns = [
    # this page will contains url for both front & back end
    path('', views.home, name='home'),
    path('show_atc/<int:pk>', views.show_atc, name='show_atc'),
    path('atc', views.atc, name='atc'),
    path('checkout', views.checkout, name='checkout'),
    path('order', views.confirm_order, name='confirm_order'),
    path('view_order/<int:pk>', views.view_order, name='view_order'),
    path('orders', views.orders, name='orders'),
    path('single_order/<int:pk>', views.single_order, name='single_order'),
    path('updateOrderStatusAsPaid/<int:pk>', views.updateOrderStatusAsPaid, name='updateOrderPayStatus'),
    path('updateOrderStatus', views.updateOrderStatus, name='updateOrderStatus'),


]
