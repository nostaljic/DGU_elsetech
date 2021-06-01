from django.urls import path
from .views import RegisterView, LoginView

urlpatterns = [
    path('', LoginView.as_view()),
    path('register/', RegisterView.as_view()),
]
