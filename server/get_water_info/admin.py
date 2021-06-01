from django.contrib import admin
from .models import AnalysisData


# Register your models here.
@admin.register(AnalysisData)
class AnalysisRequestAdmin(admin.ModelAdmin):
    list_display = (
        'member_id',
        'request_date',
        'name',
        'water_origin',
        'fe_origin',
        'turbidity',
        'date',
        'fe_user',
        'mn_user',
        'al_user',
        'img',
        'total',
    )
