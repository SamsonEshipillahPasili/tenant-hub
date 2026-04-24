from django.urls import path

app_name = 'authz'

from . import views

urlpatterns = [
    path('login/', views.TenantHubLoginView.as_view(), name='login'),
]
