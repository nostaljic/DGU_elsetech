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
            name = data['name']
            phone = data['phone']
            email = data['email']
        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 정보'},
                content_type=u"application/json; charset=utf-8",
                status=400
                )
        a_req = AnalysisRequest(
            name=name,
            phone=phone,
            email=email,
        )
        a_req.save()
        return HttpResponse(status=200)
