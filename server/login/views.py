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
            _id = data['id']
            pw = data['pw']
            pw_confirm = data['pw_confirm']
            name = data['name']
            email = data['email']
            phone = data['phone']
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
                id=_id,
                pw=pw,
                phone=phone
            )
            member.save()
            return HttpResponse(status=200)
        return HttpResponse(status=400)

    def get(self, request):
        try:
            _id = request.GET.get('id')
            pw = request.GET.get('pw')
            pw_confirm = request.GET.get('pw_confirm')
            name = request.GET.get('name')
            email = request.GET.get('email')
            phone = request.GET.get('phone')

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
                id=_id,
                pw=pw,
                phone=phone
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

    def get(self, request):
        try:
            if Member.objects.filter(id=request.GET.get('id')).exists():
                member = Member.objects.get(id=request.GET.get('id'))
                if member.pw == request.GET.get('pw'):
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
