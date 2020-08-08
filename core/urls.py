# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib import admin
from django.urls import path, re_path, include  # add this
from django.views.generic.base import TemplateView # new
urlpatterns = [
    path('admin/', admin.site.urls),
    # path("", include("authentication.urls")),  # add this
    path('accounts/', include('django.contrib.auth.urls')), # new
    path("", include("app.urls")),  # add this


]
