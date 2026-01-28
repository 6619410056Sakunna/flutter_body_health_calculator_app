import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/adout_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
//สร้างตัวแปรควบคุมCurrent Index
  int currentIndexStatus = 1;

  List<Widget> showBody = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          setState(() {
            currentIndexStatus = value;
          }),
        },
        currentIndex: currentIndexStatus,
        selectedItemColor: const Color.fromARGB(255, 103, 133, 70),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3,
              ),
              label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.personBooth,
              ),
              label: 'BMR'),
        ],
      ),
      body: showBody[currentIndexStatus],
    );
  }
}
