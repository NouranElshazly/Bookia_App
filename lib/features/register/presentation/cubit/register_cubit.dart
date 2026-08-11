import 'package:bloc/bloc.dart';
import 'package:bookia/features/register/data/repo/register_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordconfirmation,
  }) async {
    emit(RegisterLoading());
    final response = await RegisterRepo.register(
      name: name,
      email: email,
      password: password,
      passwordconfirmation: passwordconfirmation,
    );
    if (response) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterError());
    }
  }
}
