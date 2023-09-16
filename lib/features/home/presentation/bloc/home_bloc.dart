import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../../domain/entities/home_entiry.dart';
import '../../domain/entities/phone_entity.dart';
import '../../domain/usecases/get_all_home_store.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllHomeStore getAllHomeStore;
  HomeBloc({
    required this.getAllHomeStore,
  }) : super(HomeInitialState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());

      List<HomeEntity> _homeList = [];
      List<BestSellerEntity> _bestSellerList = [];
      List<PhoneEntity> _phoneList = [];

      final _failureOrHomeList = await getAllHomeStore.call();
      _failureOrHomeList.fold(
        (failure) => HomeFailureState(message: _mapFailureToMessage(failure)),
        (person) => _homeList.addAll(person),
      );
      _bestSellerList = _homeList
          .map<List<BestSellerEntity>>(
            (e) => e.bestSeller!,
          )
          .expand((element) => element)
          .toList();
      _phoneList = _homeList
          .map<List<PhoneEntity>>(
            (e) => e.homeStore!,
          )
          .expand((element) => element)
          .toList();
      emit(
        HomeLoadedState(
          homePhones: _homeList,
          bestSellers: _bestSellerList,
          phones: _phoneList,
        ),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected failure';
    }
  }
}
