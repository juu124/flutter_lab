import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestScreen());
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestScreenState();
  }
}

class TestScreenState extends State<TestScreen> {
  bool? isChecked = true; // checkbox...
  String? selectPlatform; // radio..
  double sliderValue = 5.0; // slider..
  bool switchValue = true; // switch..

  onSubmit() {
    print(
      'check : $isChecked, radio : $selectPlatform, slider : $sliderValue, switch : $switchValue',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),

                Text('체크박스 값 : $isChecked'),
              ],
            ),
            SizedBox(height: 10),
            // 여러 radio를 묶어서 단일 선택
            // RadioGroup 으로 묶어도 되고
            // 개별 Radio 의 groupValue를 동일하게 줘도 되고
            RadioGroup<String>(
              groupValue: selectPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectPlatform = value;
                });
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(value: 'android'),
                      Text('Android'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(value: 'ios'),
                      Text('ios'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: sliderValue,
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
              min: 0,
              max: 10,
            ),
            SizedBox(height: 10),
            Switch(
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: onSubmit,
                child: Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
