import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class main_Page extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                    "Today mosquito",
                    style: TextStyle(
                      color: Color(0xff815B5B),
                      fontFamily: "Schyler",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ClipOval(
                    child: Icon(
                      Icons.account_circle,
                      size: 36,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 5,
                    child: Container(
                      width: 360,
                      height: 430,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              "오늘의 모기 지수",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 60),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'images/mosquito.jpeg',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(),
                                          child: Text("주거지"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text("공원"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text("수변부"),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}