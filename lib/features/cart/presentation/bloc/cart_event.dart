import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {

}

class CartLoadEvent extends CartEvent {

  CartLoadEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}