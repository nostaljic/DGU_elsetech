import json

from django.http import HttpResponse, JsonResponse
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from .models import AnalysisData
from .preprocess import *


# Create your views here.
@method_decorator(csrf_exempt, name='dispatch')
class InfoView(View):
    def post(self, request):
        try:
            read_all_data()
            data = json.loads(request.body)
            sql = data['sql']
            result = AnalysisData.objects.raw(sql)

            res = {}
            idx = 0
            for obj in result:
                row_name = 'data' + str(idx)
                res[row_name] = {}
                res[row_name]['name'] = obj.name
                res[row_name]['email'] = obj.email
                res[row_name]['phone'] = obj.phone
                idx += 1
            return JsonResponse(res, safe=False)
        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 요청'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )
