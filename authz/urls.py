from django.urls import path

app_name = 'authz'

from . import views

urlpatterns = [
    path('sign-in/', views.TenantHubLoginView.as_view(), name='sign-in'),
    path('sign-up/', views.RegisterView.as_view(), name='sign-up'),
    path('forgot-password/', views.ForgotPasswordView.as_view(), name='forgot-password'),
]
