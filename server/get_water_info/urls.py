from django.urls import path
from .views import InfoView, GetExcelView


urlpatterns = [
    path('', InfoView.as_view()),
    path('excel/', GetExcelView.as_view()),
]
