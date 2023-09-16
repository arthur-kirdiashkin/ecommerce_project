import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? picture;
  final bool? isBuy;
  final bool? isNew;

  const PhoneEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
    required this.isNew
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        picture,
        isBuy,
        isNew
      ];
}


