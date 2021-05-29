# Generated by Django 3.2.2 on 2021-05-29 14:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('login', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AnalysisRequest',
            fields=[
                ('request_date', models.DateField(primary_key=True, serialize=False, unique=True, verbose_name='요청날짜')),
                ('name', models.CharField(max_length=32, verbose_name='성명')),
                ('location', models.CharField(max_length=254, null=True, verbose_name='위치')),
                ('company_name', models.CharField(max_length=32, null=True, verbose_name='업체 이름')),
                ('water_model', models.CharField(max_length=32, null=True, verbose_name='정수기 모델')),
                ('start_date', models.DateField(null=True, verbose_name='시작 날짜')),
                ('end_date', models.DateField(null=True, verbose_name='종료 날짜')),
                ('num_people', models.IntegerField(null=True, verbose_name='사용 인원')),
                ('usage', models.IntegerField(null=True, verbose_name='사용 유량')),
                ('member_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='login.member')),
            ],
            options={
                'verbose_name': '분석 요청',
                'verbose_name_plural': '분석 요청',
                'db_table': 'AnalysisRequest',
            },
        ),
    ]
