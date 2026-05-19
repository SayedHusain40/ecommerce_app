import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeState.initial());

  Future<void> getCategories() async {
    emit(HomeState.loading());
    final result = await homeRepo.getCategories();

    result.when(
      success: (data) {
        emit(HomeState.getCategorySuccess(data));
      },
      failure: (appFailure) {
        emit(HomeState.getCategoryFailure(appFailure));
      },
    );
  }
}
