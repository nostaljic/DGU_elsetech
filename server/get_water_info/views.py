import glob
import openpyxl
import shutil
import json
import os

from django.http import HttpResponse, JsonResponse
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from .models import AnalysisData

NEW_FILE_PATH = "get_water_info\\newData"
OLD_FILE_PATH = "get_water_info\\oldData"


# 엑셀 파일 읽어서 DB 저장
def read_new_data(path):
    wb = openpyxl.load_workbook(path)
    ws = wb['Sheet1']
    for row in ws.rows:
        row_value = []
        for cell in row:
            row_value.append(cell.value)

        data = AnalysisData(
            name=row_value[0],
            email=row_value[1],
            phone=row_value[2]
        )
        data.save()

    new_path = os.path.join(os.getcwd(), OLD_FILE_PATH, os.path.basename(path))
    shutil.move(path, new_path)


def read_all_data():
    path = os.path.join(os.getcwd(), NEW_FILE_PATH, '*.xlsx')
    file_list = glob.glob(path)
    for file in file_list:
        read_new_data(file)


# Create your views here.
@method_decorator(csrf_exempt, name='dispatch')
class InfoView(View):
    def post(self, request):
        try:
            read_all_data()
            data = json.loads(request.body)
            sql = data['sql']
            result = AnalysisData.objects.raw(sql)
            print(result)
            return HttpResponse(status=200)
        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 요청'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )
