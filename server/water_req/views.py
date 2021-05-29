from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from .models import AnalysisRequest
import json


# Create your views here.
def index(request):
    return HttpResponse("AnalysisRequest URL")


# Create your views here.
@method_decorator(csrf_exempt, name='dispatch')
class AnalysisRequestView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            _id = data['id']
            request_date = data['request_date']
            location = data['location']
            water_model = data['water_model']
            start_date = data['start_date']
            end_date = data['end_date']
            num_people = data['num_people']
            usage = data['usage']

        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 정보'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )
        a_req = AnalysisRequest(
            id=_id,
            request_date=request_date,
            location=location,
            water_model=water_model,
            start_date=start_date,
            end_date=end_date,
            num_people=num_people,
            usage=usage,
        )
        a_req.save()
        return HttpResponse(status=200)
