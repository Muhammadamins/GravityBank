import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  void start() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(true);
  }
}
