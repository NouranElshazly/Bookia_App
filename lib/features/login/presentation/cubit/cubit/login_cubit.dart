import 'package:bloc/bloc.dart';
import 'package:bookia/features/login/data/repo/login_repo.dart';
// import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await LoginRepo.login(email: email, password: password);
    if (response) {
      emit(LoginSuccess());
    } else {
      emit(LoginError());
    }
  }
}
