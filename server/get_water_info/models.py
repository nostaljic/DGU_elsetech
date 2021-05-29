from django.db import models

# Create your models here.
from login.models import Member
from water_req.models import AnalysisRequest


class AnalysisData(models.Model):
    f_id = models.ForeignKey(Member, on_delete=models.CASCADE)
    request_data = models.ForeignKey(AnalysisRequest, on_delete=models.CASCADE)
    name = models.CharField(max_length=32, verbose_name='이름')

    water_origin = models.CharField(max_length=32, verbose_name='취수원')
    fe_origin = models.FloatField(verbose_name='철_취수원')
    turbidity = models.FloatField(verbose_name='탁도')

    date = models.IntegerField(verbose_name='일자')
    fe_user = models.FloatField(verbose_name='철')
    mn_user = models.FloatField(verbose_name='망간')
    al_user = models.FloatField(verbose_name='알루미늄')
    img = models.ImageField(verbose_name='육안검사')
    total = models.CharField(max_length=32, verbose_name='종합평가')

    def __str__(self):
        return self.f_id

    class Meta:
        db_table = 'AnalysisData'
        verbose_name = '분석 결과'
        verbose_name_plural = '분석 결과'
