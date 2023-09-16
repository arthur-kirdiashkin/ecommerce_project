part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<HomeEntity> homePhones;
  final List<BestSellerEntity> bestSellers;
  final List<PhoneEntity> phones;

  HomeLoadedState({
    required this.homePhones,
    required this.bestSellers,
    required this.phones,
  });

  @override
  List<Object?> get props => [
        homePhones,
        bestSellers,
        phones,
      ];
}

class HomeFailureState extends HomeState {
  final String message;

  HomeFailureState({required this.message});

  @override
  List<Object?> get props => [];
}
