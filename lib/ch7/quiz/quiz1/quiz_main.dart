import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/ch7/quiz/quiz1/bloc/signup_bloc.dart';
import './screen/sign_up_screen.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(),
      child: MaterialApp(
        home: SignUpScreen(),
      ),
    );

    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(title: Text('회원가입')),
    //     body: SignUpScreen(),
    //   ),
    // );
  }
}