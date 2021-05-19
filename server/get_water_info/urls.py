from django.urls import path
from .views import InfoView

urlpatterns = [
    path('', InfoView.as_view())
]
