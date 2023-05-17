import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_Page extends StatefulWidget {

  @override
    _user_Page createState() => _user_Page();

}

class _user_Page extends State<user_Page> {

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10, top: 20),
            child: Text("모기 알람 설정",
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
                              padding: EdgeInsets.only(top: 40, left: 20),
                              child: Text(
                                "현재시간 설정",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                "모기 알람 시간 : ${_selectedTime.format(context)}",
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
                                              backgroundColor: MaterialStateProperty.all(Color(0xffFFDA7B))
                                            ),
                                            onPressed: () => _selectTime(context),
                                            child: Text("시간 설정",style: TextStyle(
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
                                                backgroundColor: MaterialStateProperty.all(Color(0xffFFDA7B))
                                            ),
                                            onPressed: () => _selectTime(context),
                                            child: Text("설정 완료",style: TextStyle(
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
                                            onPressed: () => _selectTime(context),
                                            child: Text("데이터 삭제",style: TextStyle(
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