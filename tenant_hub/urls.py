from django.contrib import admin
from django.http import HttpRequest, HttpResponse
from django.urls import path, include

from django.shortcuts import render

def index(request: HttpRequest) -> HttpResponse:
    return render(request, 'index.html')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('auth/', include('authz.urls')),
    path('app/', include('core.urls')),
]

