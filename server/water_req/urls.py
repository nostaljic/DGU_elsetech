from django.urls import path
from .views import AnalysisRequestView

urlpatterns = [
    path('', AnalysisRequestView.as_view()),
]