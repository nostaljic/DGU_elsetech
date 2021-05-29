from django.db import models

# Create your models here.
from login.models import Member
import datetime


class AnalysisRequest(models.Model):
    # id = models.CharField(max_length=32, unique=True, verbose_name='아이디', primary_key=True)
    member_id = models.ForeignKey(Member, on_delete=models.CASCADE)
    request_date = models.CharField(max_length=32, unique=True, verbose_name='요청날짜', primary_key=True)

    name = models.CharField(max_length=32, verbose_name='성명')
    location = models.CharField(max_length=254, verbose_name='위치', null=True)
    company_name = models.CharField(max_length=32, verbose_name='업체 이름', null=True)
    water_model = models.CharField(max_length=32, verbose_name='정수기 모델', null=True)

    start_date = models.CharField(max_length=32, verbose_name='시작 날짜', null=True)
    end_date = models.CharField(max_length=32,verbose_name='종료 날짜', null=True)

    num_people = models.IntegerField(verbose_name='사용 인원', null=True)
    usage = models.IntegerField(verbose_name='사용 유량', null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'AnalysisRequest'
        verbose_name = '분석 요청'
        verbose_name_plural = '분석 요청'
