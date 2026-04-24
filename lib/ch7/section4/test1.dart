import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc 에 발생시킬 이벤트
// enum으로 만들거나 개발자 클래스로 만들거나
// 왜 추상형으로 했을까? => 여러 이벤트를 동일 타입으로 이용하기 위해서. 하위에서 발생하는 클래스를 동일 타입으로 사용
// 타입의 어떤 통일성을 위해서 만든것. 직접 사용하려는 의도 X
abstract class CounterEvent {
  int no; // 이걸 bloc에 던질것임
  CounterEvent(this.no);
}
class IncrementEvent extends CounterEvent {
  IncrementEvent(int no): super(no);
}
class DecrementEvent extends CounterEvent {
  DecrementEvent(int no): super(no);
}

// Bloc 선언
// <이벤트 타입 input, 상태 타입>
class BlocCounter extends Bloc<CounterEvent, int> {
  // 필수는 생성자
  BlocCounter(): super(0) { // 상위 생성자 꼭 직접 호출해야 한다. 매개변수는 두번째 매개변수의 상태타입이어야한다.초기값 (int라면 0, 개발자 클래스라면 null)
    // 이벤트 발생 감지
    // 위에서 이벤트 타입을 CounterEvent로 지정해서 상속받았기 때문에 IncrementEvent가 사용가능
    // incrementEvent 이벤트가 발생되면 매개변수 등록 함수 호출하라..
    // event : 발생한 이벤트.. 이 곳에서 전달한 데이터 추출
    // emit : 함수 B/L 실행후 발생한 상태를 발행하는 함수
    on<IncrementEvent>((event, emit) {
      // state : Bloc 내에 유지되는 데이터. 이벤트가 발생하기 전 상태값
      emit(state + event.no);
    });
    on<DecrementEvent>((event, emit) {
      emit(state - event.no);
    });
  }

  // 필수 아님 선택
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  // 필수 아님 선택
  // 이벤트 발생시에 호출.. 상태 발생은 못한다. 상태와 관련없는 업무 처리가 있으면 실행
  // 위의 on과 차이가 있다.
  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
  }

  // 필수 아님 선택
  // 이벤트가 발생되었을 때 어떤 이벤트에 어떤 상태가 어떻게 변경되었는지 정보를 전달한다.
  // 로깅의 느낌
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print('transition... $transition');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(// BLoc 등록
          create: (context) => BlocCounter(),
          child: MyWidget(), // 하위에 등록된 위젯들이 이용된다.
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기에서 bloc을 이용하겠다.
    BlocCounter blocCounter = BlocProvider.of<BlocCounter>(context);
    // bloc의 상태를 구독만 하겠다. 이용만 하겠다., BlocBuilder가 편할 수 있다.
    return BlocBuilder<BlocCounter, int>(
      builder: (context, state) { // builder가 자동으로 콜 되면서 context와 state를 가져와준다
        return Column(
          children: [
            Text('state : $state'),
            ElevatedButton(onPressed: () {
              // add 함수 : bloc에서 제공하는 함수. 이벤트 발생 함수
              blocCounter.add(IncrementEvent(2));
            }, child: Text('increment')),
            ElevatedButton(onPressed: () {
              blocCounter.add(DecrementEvent(2));
            }, child: Text('decrement')),
          ],
        );
      },
    );
  }
}