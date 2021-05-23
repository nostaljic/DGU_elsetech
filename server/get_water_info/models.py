from django.db import models


# Create your models here.
class AnalysisData(models.Model):
    name = models.CharField(max_length=32, verbose_name='이름')
    phone = models.CharField(max_length=32, verbose_name='연락처')
    email = models.EmailField(max_length=254, verbose_name='이메일')
    # start_date = models.DateField()
    # end_date = models.DateField()
    # usage = models.IntegerField()
    # num_people = models.IntegerField()

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'AnalysisData'
        verbose_name = '분석 결과'
        verbose_name_plural = '분석 결과'
