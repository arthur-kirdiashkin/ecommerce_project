import 'package:ecommerce_project/application/ui/home/data/repositories/phone_repository_impl.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/phone_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';
import 'package:ecommerce_project/application/ui/home/domain/usecases/get_all_phones.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final PhoneRepository _phoneRepository;
  // final GetAllPhones getAllPhones;
  PhoneBloc(this._phoneRepository) : super(PhoneInitialState()) {
    on<LoadPhoneEvent>((event, emit) async {
      emit(PhoneLoadingState());
      var phoneList = <PhoneEntity>[];
      try {
        final bestSellersListOne = await _phoneRepository.getBestSellers();
        final phoneListOne = await _phoneRepository.getPhones();
      emit(PhoneLoadedState(phones: phoneListOne, bestSellers: bestSellersListOne));
      } catch (e) {
        emit(PhoneFailureState(message: 'Error'));
      }
      
      // final phoneListOne = await getAllPhones.call(phoneList);

      // emit(phoneListOne.fold(
      //   (failure) => PhoneFailureState(message: 'Error'),
      //   (phones) => PhoneLoadedState(phones: phones),
      // ));
    });
  }
}
