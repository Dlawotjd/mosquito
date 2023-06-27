#📆 2023년 5월 8일 ~ 2023년 5월 24일

# 모기 알리미 - Flutter수업 프로젝트

# 프로젝트 개요 
해당 주제를 선정한 이유는 곧 다가올 여름을 맞이해 나타나는 모기들이 오늘은 얼마나 나타나는지 알려주는 서비스를 개발해 보는 것은 어떨까 생각하다 떠오른 아이디어 입니다.
저희가 개발한 서비스는 사용자가 설정한 시간에 맞춰 디바이스에 알림을 보내줘 까먹지 않고 오늘의 모기량을 알 수 있게 도움을 주는 서비스입니다.

# 전체 구조도 

<img width="461" alt="image" src="https://github.com/lsg1024/mosquito/assets/92419747/2ee710f2-54ab-46a7-9fc2-1f830e737ffd">


![image](https://github.com/lsg1024/mosquito/assets/92419747/f21672d8-fd03-44a5-a8e6-5929f06e9d91)


![image](https://github.com/lsg1024/mosquito/assets/92419747/97fa8660-120b-446d-b20c-16868c00ebbd)


# 대표 기능
  - 서울 모기 발생량 API 호출 후 확인
  - 모기 알림 FCM 서비스

사용 공공 데이터 ( 서울시 모기예보제 ) https://data.seoul.go.kr/dataList/OA-13285/S/1/datasetView.do

API 데이터를 디바이스로 호출해 오늘 발생량을 보여주는 기능

FireBase와 Node.JS를 이용해 FCM 알림 서비스 기능 -> 사용자가 원하는 시간에 알림을 보내준다

# 시스템 구조도
<img width="461" alt="image" src="https://github.com/lsg1024/Flutter_practice/assets/92419747/117f605b-6b94-4c47-97e9-0f89e972eb51">

# 인트로 화면
![image](https://github.com/lsg1024/mosquito/assets/92419747/f245e523-0e55-438a-8060-fe2157d7e28c)

# 메인 화면
![image](https://github.com/lsg1024/mosquito/assets/92419747/c6ea3ab6-7f7e-4153-bf8a-2177f187ffb8)

# 알림 설정 화면
![image](https://github.com/lsg1024/mosquito/assets/92419747/4476cb02-f388-476e-adee-ba72cfc09c0b)

# 전체 테스트 화면
https://github.com/lsg1024/mosquito/assets/92419747/dbeb58a4-4de1-4002-b56f-da137bd12184


