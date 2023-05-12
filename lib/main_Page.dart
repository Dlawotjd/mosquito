import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mosquito/MosAPI.dart';
import 'package:mosquito/MosData.dart';

final api = MosAPI();

class MainPage extends StatefulWidget {

  @override
    _Main_Page createState() => _Main_Page();
}


class _Main_Page extends State<MainPage>{

  MosData? mosquitoData;
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    MosAPI api = MosAPI();
    mosquitoData = await api.fetchNew(date);

    setState(() {
      isLoading = false;
      _mosMeanImg();
    });
  }

  var mosImgList = ["mmosquito_loss.png", "mosquito_human.png", "mosquitoremove.png"];
  var mosImgList2 = ["Group1.png", "Group2.png", "Group3.png"];
  var url = "";

  void _mosMeanImg() {
    var mosMean = (mosquitoData!.valueWater + mosquitoData!.valueHouse + mosquitoData!.valuePark)/3 ;
    if (mosMean <= 25) {
      url = "images/${mosImgList[0]}";
    }
    else if(25 < mosMean && mosMean <= 75) {
      url = "images/${mosImgList[2]}";
    }
    else {
      url = "images/${mosImgList[1]}";
    }
  }

  void _mosImg(double _mosvalue){

    if (_mosvalue <= 25) {
      url = "images${mosImgList2[0]}";
    }
    else if (25 < _mosvalue && _mosvalue <= 75) {
      url = "images${mosImgList2[1]}";
    }
    else {
      url = "images${mosImgList2[2]}";
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: isLoading ? CircularProgressIndicator() : Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
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
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: ClipOval(
                    child: Icon(
                      Icons.account_circle,
                      size: 36,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 5,
                    child: Container(
                      width: 360,
                      height: 650,
                      child:
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("오늘의 모기 지수",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Text(mosquitoData!.date),)
                                  ]
                                ),
                              ),
                              Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(((mosquitoData!.valueWater + mosquitoData!.valueHouse + mosquitoData!.valuePark)/3).toStringAsFixed(2),
                                          style: TextStyle(
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Image.asset(
                                          url,
                                          width: 130,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text("주거지",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20, left: 50),
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  Text(mosquitoData!.valueHouse.toString(), style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 50),
                                      child: Image.asset("images/Group2.png",
                                        width: 80,
                                        height: 80,
                                      )
                                  )
                                ],
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text("공원",
                                        style: TextStyle(
                                            letterSpacing: 2.0,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20, left: 65),
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  Text(mosquitoData!.valuePark.toString(), style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 50),
                                      child: Image.asset("images/Group2.png",
                                        width: 80,
                                        height: 80,
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("수변지",
                                    style: TextStyle(
                                        letterSpacing: 2.0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20, left: 50),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              Text(mosquitoData!.valueWater.toString(),
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Image.asset("images/Group2.png",
                                    width: 80,
                                    height: 80,
                                  )
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Column(
                              children: [
                                Row(children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffF97777),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  Text("모기위험")
                                  ],
                                ),
                                Text("76 ~ 100")
                                ],
                              ),
                              Column(
                                children: [
                                  Row(children: [
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xfffFFC178),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Text("모기주의")
                                  ],
                                  ),
                                  Text("26 ~ 75")
                                ],
                              ),
                              Column(
                                children: [
                                  Row(children: [
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xfff95DB94),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Text("모기안전")
                                  ],
                                  ),
                                  Text("0 ~ 25")
                                ],
                              ),
                            ],
                          )
                        ]
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}