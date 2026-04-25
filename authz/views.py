from django.contrib.auth.views import LoginView
from django.views.generic import TemplateView


class TenantHubLoginView(LoginView):
    template_name = 'authz/sign-in.html'


class RegisterView(TemplateView):
    template_name = 'authz/sign-up.html'


class ForgotPasswordView(TemplateView):
    template_name = 'authz/forgot-password.html'
