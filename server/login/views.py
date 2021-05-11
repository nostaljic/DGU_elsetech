from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views import View
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from .models import Member
import json


# Create your views here.
@method_decorator(csrf_exempt, name='dispatch')
class RegisterView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            id = data['id']
            pw = data['pw']
            pw_confirm = data['pw_confirm']
            name = data['name']
            email = data['email']
        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 정보'},
                content_type=u"application/json; charset=utf-8",
                status=400
                )

        if pw == pw_confirm:
            member = Member(
                name=name,
                email=email,
                id=id,
                pw=pw,
            )
            member.save()
            return HttpResponse(status=200)
        return HttpResponse(status=400)


@method_decorator(csrf_exempt, name='dispatch')
class LoginView(View):
    def post(self, request):
        data = json.loads(request.body)
        try:
            if Member.objects.filter(id=data['id']).exists():
                member = Member.objects.get(id=data['id'])
                if member.pw == data['pw']:
                    return HttpResponse(status=200)
                return HttpResponse(status=401)
            return HttpResponse(status=400)

        except KeyError as e:
            print("KeyError 발생", e)
            return JsonResponse(
                {'message': '잘못된 로그인'},
                content_type=u"application/json; charset=utf-8",
                status=400
            )
