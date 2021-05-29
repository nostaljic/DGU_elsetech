from django.contrib import admin
from .models import AnalysisRequest


# Register your models here.
@admin.register(AnalysisRequest)
class AnalysisRequestAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'request_date',
        'location',
        'company_name',
        'water_model',
        'start_date',
        'end_date',
        'num_people',
        'usage',
    )
