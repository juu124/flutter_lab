// 가입 버튼 클릭시 등록했던 정보 저장 후 노출
import '../model/user.dart';

sealed class SignupEvent {}
class SignupPressed extends SignupEvent {
  User user;
  SignupPressed(this.user);
}