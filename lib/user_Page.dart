import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

class user_Page extends StatefulWidget {

  @override
    _user_Page createState() => _user_Page();

}

class _user_Page extends State<user_Page> {

  TimeOfDay? _selectedTime;

  // TimeOfDay을 이용해 위젯에서 현재 시간을 보여주면서 시작하고 확인 버튼을 누르면 설정한 시간을 저장
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        print(_selectedTime.toString());
      });
    }
  }

  // 모기 알림 설정 하는 곳
  Future<void> sendDataToServer(TimeOfDay selectedTime, String route) async {

    final String formattedTime =
        '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';

    String? deviceToken = await getDeviceToken();

    var url = Uri.parse('http://oceanit.synology.me:3505/api/$route');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'token': deviceToken,
        'time': formattedTime,
      }),
    );

    // 데이터 전송 성공 반환
    if (response.statusCode == 200) {
      print('요청 성공');
    } else {
      print('요청 실패');
    }
  }

  Future<void> delData(String route) async {

    String? deviceToken = await getDeviceToken();

    var url = Uri.parse('http://oceanit.synology.me:3505/api/$route');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'token': deviceToken,
      }),
    );

    // 데이터 전송 성공 반환
    if (response.statusCode == 200) {
      print('요청 성공');
    } else {
      print('요청 실패');
    }
  }
  // 디바이스 토큰 추출
  static Future<String?> getDeviceToken() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    String? token = await FirebaseMessaging.instance.getToken();
    print('Firebase 디바이스 토큰: $token');

    return token;
  }

// 파이어베이스 토큰 추출 백그라운드 핸들링으로 앱이 꺼져있어도 FCM 수신이 가능해야 된다
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print('백그라운드 메시지 처리: ${message.messageId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EA),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10, top: 20),
            child: Text("Mosquito Alarm",
              style: TextStyle(
                color: Color(0xff815B5B),
                fontFamily: "Schyler",
                fontSize: 26,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 360,
                        height: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                _selectedTime == null ? "알림 시간을 설정해주세요" : "선택한 알람 시간 : ${_selectedTime!.format(context)}",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 60),
                                      child: SizedBox(
                                          height: 50,
                                          width: 300,
                                          child : ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color(
                                                  0xff674949))
                                            ),
                                            onPressed: () => _selectTime(context),
                                            child: Text("알림 시간 설정",style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                    )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 60),
                                      child: SizedBox(
                                          height: 50,
                                          width: 300,
                                          child : ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xff674949))
                                            ),
                                            onPressed: () async {
                                            //  api 호출하는 공간
                                              sendDataToServer(_selectedTime!, 'dbsave');
                                            },
                                            child: Text("알림 설정 완료",style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                            ),
                                          )
                                      )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 60),
                                      child: SizedBox(
                                          height: 50,
                                          width: 300,
                                          child : ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xffff4141))
                                            ),
                                            onPressed: () async {
                                              delData('dbdel');
                                            },
                                            child: Text("알림 중지",style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                            ),
                                          )
                                      )
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
