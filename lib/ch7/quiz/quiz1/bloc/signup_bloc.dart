import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';
import '../event/signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, User>{
  SignupBloc(): super(User()) { // 상태값에 맞는 초기값
    on<SignupPressed>((event, emit) {
      User user = event.user;
      emit(user);
    });
  }
}