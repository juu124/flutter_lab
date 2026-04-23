import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

//provider를 이용해 앱 전역에서 사용하고자 하는 상태 선언..
//어느 파일에 있든 상관없다.. top level에만 선언되면 된다..
//Provider 로 등록했다.. notifier 는 제공하지 않는다..
final labelProvider = Provider<String>((ref) => 'Hello');

//StateProvider : notifier 제공한다.. 변경 가능하다.. 단순 값 변경되는 경우..
final counterProvider = StateProvider<int>((ref) => 0);

//이용자 위젯..
//StatelessWidget
class Widget1 extends ConsumerWidget {
  //매개변수 하나 더 추가.. provider 참조자 전달..
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final label = ref.watch(labelProvider);
    final counter = ref.watch(counterProvider);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('I am ConsumerWidget'),
            Text('label : $label, counter : $counter'),
            ElevatedButton(onPressed: (){
              //provider 데이터를 변경하려면.. notifier 를 획득해야 한다..
              //read 로..
              ref.read(counterProvider.notifier).state++;
            }, child: Text('change'))
          ],
        ),
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        final label = ref.watch(labelProvider);
        final counter = ref.watch(counterProvider);

        return Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('I am StatelessWidget + Consumer'),
                Text('label : $label, counter : $counter'),
              ],
            ),
          ),
        );
      },
    );
  }
}

void main(){
  runApp(
      ProviderScope(//reiverpod 의 provider 데이터를 저장하기 위한 저장소.. 준비..
        //앱의 전체 파일을 참조해서.. 모든 provider를 위한 저장 공간을 준비한다..
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('riverpod test'),),
        body: Center(
          child: Column(
            children: [
              Widget1(),
              ProviderScope(//이 하위부터 다른 저장소를 이용한다..
                //저장소를 만드는 순간은 상위 저장소 값이 그대로 상속되고 그 이후 별개이다..
                //상위 저장소의 데이터가 그대로 상속되지만.. 원하는 데이터를 override 가능하다..
                  overrides: [
                    labelProvider.overrideWith((ref) => 'World')
                  ],
                  child: Widget2()
              ),

            ],
          ),
        ),
      ),
    );
  }
}