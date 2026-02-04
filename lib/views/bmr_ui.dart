// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  //สร้างตัวควบคุมtextfield
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  String selectedGender = 'ชาย'; // ค่าเริ่มต้น
  double bmrValue = 0;

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
                  'คำนวณหาค่าอัตราการเผาผลาญพื้นฐาน (BMR)',
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
                    'เพศ',
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    value: selectedGender,
                    isExpanded: true,
                    underline: SizedBox(),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    items: ['ชาย', 'หญิง'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกอายุของคุณ',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    //คำนวณค่า
                    //validate input
                    if (wCtrl.text.isEmpty ||
                        hCtrl.text.isEmpty ||
                        ageCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบ'),
                        ), //showSnackBar
                      );
                      return;
                    }
                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    double age = double.parse(ageCtrl.text);

                    //คำนวณ BMR ตามเพศ
                    if (selectedGender == 'ชาย') {
                      //BMR = 66 + (13.7 x น้ำหนัก) + (5 x ส่วนสูง) – (6.8 x อายุ)
                      setState(() {
                        bmrValue = 66 + (13.7 * w) + (5 * h) - (6.8 * age);
                      });
                    } else {
                      //BMR = 665 + (9.6 x น้ำหนัก) + (1.8 x ส่วนสูง) – (4.7 x อายุ)
                      setState(() {
                        bmrValue = 665 + (9.6 * w) + (1.8 * h) - (4.7 * age);
                      });
                    }
                  },
                  child: Text('คำนวณ BMR'),
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
                      ageCtrl.clear();
                      bmrValue = 0;
                      selectedGender = 'ชาย';
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
                          'BMR',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          bmrValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.red[600],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'กิโลแคลอรี่/วัน',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
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

  @override
  void dispose() {
    wCtrl.dispose();
    hCtrl.dispose();
    ageCtrl.dispose();
    super.dispose();
  }
}
