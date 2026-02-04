// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //สร้างตัวควบคุมtextfield
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();

  double bmiValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักของคุณ',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    //คำนวณค่า
                    //validate input
                    if (wCtrl.text.isEmpty || hCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบ'),
                        ), //showSnackBar
                      );
                      return;
                    }
                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text) / 100;
                    //*******************/
                    setState(() {
                      bmiValue = w / (h * h);
                    });
                  },
                  child: Text('คํานวณ BNI'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[600],
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wCtrl.clear();
                      hCtrl.clear();
                      bmiValue = 0;
                    });
                  },
                  child: Text('ล้างข้อมูล'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'BMI',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          bmiValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.red[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
