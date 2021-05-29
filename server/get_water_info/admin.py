from django.contrib import admin
from .models import AnalysisData


# Register your models here.
@admin.register(AnalysisData)
class AnalysisRequestAdmin(admin.ModelAdmin):
    list_display = (
        'name',
    )
