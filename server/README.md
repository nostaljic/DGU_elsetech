# Django 서버 설명
## 로컬 실행방법
콘솔에서 아래 명령어 입력
<code>python manage.py runserver</code>

## 관리자 페이지
접속 주소 - 127.0.0.1:8000/admin/  
아이디, 비번 - admin  
  
<img src="https://user-images.githubusercontent.com/48395704/120063990-f905ab80-c0a4-11eb-86d5-9c935264e56a.png" width="40%" height="40%">

## 서버에 요청 보내기
요청은 모두 JSON 형태  
### 회원가입 POST 요청 예시
<pre>
<code>
{
    "name":"test",
    "email":"easd@easd",
    "id":"test_id",
    "pw":"test_pw",
    "pw_confirm":"test_pw",
    "phone" : "010-1234-1234"
}  
</code>
</pre>

### 로그인 POST 요청 예시
<pre>
<code>
{
    "id":"test_id",
    "pw":"test_pw"
}
</code>
</pre>

### 분석요청 POST 요청 예시
<pre>
<code>
{
    "name":"test",
    "member_id":"test_id",
    "location" : "서울", 
    "water_model" : "모델1",
    "company_name" : "정수기업체1",
    "num_people" : 4,
    "usage" : 10,
    "request_date" : "2021-05-20",
    "start_date" : "2021-05-20",
    "end_date" : "2021-05-20"
}
</code>
</pre>

### 분석 결과 요청 POST 요청 예시
<pre>
<code>
{
    "sql":"select * from AnalysisData where date=1 and name='박승일'"
}
</code>
</pre>
