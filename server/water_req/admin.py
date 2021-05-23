from django.contrib import admin
from .models import AnalysisRequest


# Register your models here.
@admin.register(AnalysisRequest)
class AnalysisRequestAdmin(admin.ModelAdmin):
    list_display = (
        'name',
        'phone',
        'email'
    )
