part of 'phone_bloc.dart';

abstract class PhoneState extends Equatable {
  const PhoneState();

  @override
  List<Object?> get props => [];
}

class PhoneInitialState extends PhoneState {}

class PhoneLoadingState extends PhoneState {}

class PhoneLoadedState extends PhoneState {
  final List<PhoneEntity> phones;
  final List<BestSellerEntity> bestSellers;

  PhoneLoadedState( {required this.phones, required this.bestSellers});

  @override
  // TODO: implement props
  List<Object?> get props => [phones, bestSellers];
}

class PhoneFailureState extends PhoneState {
  final String message;

  PhoneFailureState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
