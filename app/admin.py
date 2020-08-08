# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib import admin

# Register your models here.
from .models import *


admin.site.register(Product)
admin.site.register(Order)
admin.site.register(Extras)
admin.site.register(OrderItem)
admin.site.register(OrderItemExtras)
