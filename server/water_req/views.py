import datetime

from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt

from login.models import Member
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
            member_id = data['member_id']
            member_id = Member.objects.get(pk=member_id)

            location = data['location']
            water_model = data['water_model']
            company_name = data['company_name']
            num_people = data['num_people']
            usage = data['usage']

            request_date = data['request_date']
            # request_date = datetime.datetime.strptime(request_date, "%Y-%m-%d").date()
            start_date = data['start_date']
            # start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d").date()
            end_date = data['end_date']
            # end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()

        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 정보'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )
        a_req = AnalysisRequest(
            member_id=member_id,
            request_date=request_date,
            location=location,
            water_model=water_model,
            company_name=company_name,
            start_date=start_date,
            end_date=end_date,
            num_people=num_people,
            usage=usage,
        )
        a_req.save()
        return HttpResponse(status=200)
