from django.contrib import admin
from .models import AnalysisData


# Register your models here.
@admin.register(AnalysisData)
class AnalysisRequestAdmin(admin.ModelAdmin):
    list_display = (
        'member_id',
        'request_date',
        'name',
        'filename',
        'location',
        'latitude',
        'longitude',
        'water_origin',
        'fe_origin',
        'turbidity',
        'public_ph',
        'public_rc',
        'public_tb',
        'date',
        'fe_user',
        'mn_user',
        'al_user',
        'img',
        'total',
    )
