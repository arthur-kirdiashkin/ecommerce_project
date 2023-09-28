import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

}

class CartLoadEvent extends CartEvent {

  const CartLoadEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}