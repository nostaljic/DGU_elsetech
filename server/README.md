# Django 서버 설명
## 로컬 실행방법
콘솔에서 아래 명령어 입력
<code>python manage.py runserver</code>

## 관리자 페이지
URL - http://127.0.0.1:8000/admin/  
아이디, 비번 - admin  
  
<img src="https://user-images.githubusercontent.com/48395704/120063990-f905ab80-c0a4-11eb-86d5-9c935264e56a.png" width="40%" height="40%">

## DB 구조
### 사용자 DB
- id 아이디 (문자열, primary key)
- name 성명 (문자열)
- email 이메일 (이메일)
- pw 비밀번호 (문자열)
- phone 전화번호 (문자열)

### 분석 요청 DB
- member_id 아이디 (사용자 DB 외래키)
- request_date 요청날짜 (문자열, primary key)
- name 성명 (문자열)
- location 위치 (문자열)
- company_name 업체이름 (문자열)
- water_model 정수기모델 (문자열)
- start_date 시작날짜 (문자열)
- end_date 종료날짜 (문자열)
- num_people 사용인원 (정수)
- usage 사용유량 (실수)

### 분석 결과 DB
- member_id = 아이디 (사용자 DB 외래키)
- request_date 요청날짜 (분석요청 DB 외래키)
- name 성명 (문자열)
- water_origin 취수원 (문자열)
- fe_origin 철_취수원 (문자열)
- turbidity 탁도 (문자열)
- date 일자 (정수)
- fe_user 철 (실수)
- mn_user 망간 (실수)
- al_user 알루미늄 (실수)
- img 육안검사 (문자열 이미지 URL)
- total 종합평가 (문자열)



## 서버에 요청 보내기
요청은 모두 JSON 형태  
### 회원가입 POST 요청 예시
URL - http://127.0.0.1:8000/login/register/
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
http://127.0.0.1:8000/login/
<pre>
<code>
{
    "id":"test_id",
    "pw":"test_pw"
}
</code>
</pre>

### 분석요청 POST 요청 예시
URL - http://127.0.0.1:8000/water_req/
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
URL - http://127.0.0.1:8000/get_water_info/
<pre>
<code>
{
    "sql":"select * from AnalysisData where date=1 and name='박승일'"
}
</code>
</pre>
