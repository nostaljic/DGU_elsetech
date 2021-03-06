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
                res[row_name]['member_id'] = obj.member_id.id
                res[row_name]['request_date'] = obj.request_date.request_date
                res[row_name]['name'] = obj.name
                res[row_name]['filename'] = obj.filename

                res[row_name]['location'] = obj.location
                res[row_name]['latitude'] = obj.latitude
                res[row_name]['longitude'] = obj.longitude

                res[row_name]['water_origin'] = obj.water_origin
                res[row_name]['fe_origin'] = obj.fe_origin
                res[row_name]['turbidity'] = obj.turbidity

                res[row_name]['public_ph'] = obj.public_ph
                res[row_name]['public_rc'] = obj.public_rc
                res[row_name]['public_tb'] = obj.public_tb

                res[row_name]['date'] = obj.date
                res[row_name]['fe_user'] = obj.fe_user
                res[row_name]['mn_user'] = obj.mn_user
                res[row_name]['al_user'] = obj.al_user
                res[row_name]['img'] = obj.img
                res[row_name]['total'] = obj.total

                idx += 1
            return JsonResponse(res, safe=False)
        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 요청'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )

    def get(self, request):
        try:
            read_all_data()
            sql = request.GET.get('sql')
            result = AnalysisData.objects.raw(sql)

            res = {}
            idx = 0
            for obj in result:
                row_name = 'data' + str(idx)
                res[row_name] = {}
                res[row_name]['member_id'] = obj.member_id.id
                res[row_name]['request_date'] = obj.request_date.request_date
                res[row_name]['name'] = obj.name
                res[row_name]['filename'] = obj.filename

                res[row_name]['location'] = obj.location
                res[row_name]['latitude'] = obj.latitude
                res[row_name]['longitude'] = obj.longitude

                res[row_name]['water_origin'] = obj.water_origin
                res[row_name]['fe_origin'] = obj.fe_origin
                res[row_name]['turbidity'] = obj.turbidity

                res[row_name]['public_ph'] = obj.public_ph
                res[row_name]['public_rc'] = obj.public_rc
                res[row_name]['public_tb'] = obj.public_tb

                res[row_name]['date'] = obj.date
                res[row_name]['fe_user'] = obj.fe_user
                res[row_name]['mn_user'] = obj.mn_user
                res[row_name]['al_user'] = obj.al_user
                res[row_name]['img'] = obj.img
                res[row_name]['total'] = obj.total

                idx += 1
            return JsonResponse(res, safe=False)
        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 요청'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )

@method_decorator(csrf_exempt, name='dispatch')
class GetExcelView(View):
    def get(self, request):
        try:
            filename = request.GET['f']
            read_all_data()

            od_dir = os.path.join(os.getcwd(), "get_water_info\\oldData")
            path = os.path.join(od_dir, filename)

            if os.path.exists(path):
                with open(path, 'rb') as fh:
                    response = HttpResponse(fh.read(),
                                            content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
                    response['Content-Disposition'] = 'attachment;filename=data.xlsx'
                    return response
            else:
                return HttpResponse(status=404)

        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 요청'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )
