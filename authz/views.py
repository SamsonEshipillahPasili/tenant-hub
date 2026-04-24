from django.contrib.auth.views import LoginView

class TenantHubLoginView(LoginView):
    template_name = 'authz/login.html'
