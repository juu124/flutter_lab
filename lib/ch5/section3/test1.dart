import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogScreen(),
    );
  }
}

class DialogScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogScreenState();
  }
}

class DialogScreenState extends State<DialogScreen> {
  DateTime dateValue = DateTime.now(); // 시스템의 현재 날짜..
  TimeOfDay timeValue = TimeOfDay.now(); // 시스템의 현재 시간

  void myDialog() {
    showDialog(
      context: context,
      // 다이얼로그 화면 구성을 위해 자동으로 호출된다.
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // wrap_contents
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('수신동의'),
                ],
              ),
            ],
          ),
          actions: [
            // dialog의 하단 버튼들
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('OK')),
          ],
        );
      },
    );
  }

  myBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.yellow,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.add),
              title: Text('ADD'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.remove),
              title: Text('REMOVE'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future myDatePicker() async {
    DateTime? picker = await showDatePicker(
      // 리턴 값이 유저가 선택한 날짜
      context: context,
      firstDate: DateTime(2016),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picker != null)
      setState(() {
        dateValue = picker;
      });
  }

  Future myTimePicker() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null)
      setState(() {
        timeValue = selectedTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialog test'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: myDialog,
              child: Text('Dialog'),
            ),
            ElevatedButton(
              onPressed: myBottomSheet,
              child: Text('BottomSheet'),
            ),
            ElevatedButton(
              onPressed: myDatePicker,
              child: Text('date picker'),
            ),
            Text('date : ${DateFormat('yyyy-MM-dd').format(dateValue)}'),
            ElevatedButton(onPressed: myTimePicker, child: Text('time picker')),
            Text('time : ${timeValue.hour}:${timeValue.minute}'),
          ],
        ),
      ),
    );
  }
}
