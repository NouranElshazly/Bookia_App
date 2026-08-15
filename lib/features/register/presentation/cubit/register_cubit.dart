import 'package:bloc/bloc.dart';
import 'package:bookia/features/register/data/model/register_request_body.dart';
import 'package:bookia/features/register/data/repo/register_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(RegisterRequestBody body) async {
    emit(RegisterLoading());
    final response = await RegisterRepo.register(body);

    if (response) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterError());
    }
  }
}
