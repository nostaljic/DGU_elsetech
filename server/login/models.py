from django.db import models


# Create your models here.
class Member(models.Model):
    name = models.CharField(max_length=32, verbose_name='성명')
    email = models.EmailField(max_length=254, unique=True, verbose_name='이메일')
    id = models.CharField(max_length=32, unique=True, verbose_name='아이디', primary_key=True)
    pw = models.CharField(max_length=32, verbose_name='비밀번호')

    def __str__(self):
        return self.id

    class Meta:
        db_table = 'member'
        verbose_name = '사용자'
        verbose_name_plural = '사용자'
