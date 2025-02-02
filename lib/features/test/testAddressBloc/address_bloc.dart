import 'package:educare_erp/core/network/apiHelper/status.dart';
import 'package:educare_erp/features/test/models/address_model.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/apiHelper/resource.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final TestUseCases _testUseCases;
  AddressBloc(this._testUseCases) : super(AddressInitial()) {
    on<FetchAddress>(_onFetchAddress);
  }

  Future<void> _onFetchAddress(
      FetchAddress event, Emitter<AddressState> emit) async {
    emit(AddressLoading());

    try {
      Map<String, dynamic> requestData = {};
      Resource resource =
          await _testUseCases.getAddressList(requestData: requestData);

      if (resource.status == STATUS.SUCCESS) {
        List<AddressModel> addressList = (resource.data as List)
            .map((x) => AddressModel.fromJson(x))
            .toList();
        emit(AddressLoaded(address: addressList));
      } else {
        emit(AddressError(message: resource.message ?? "Failed to fetch data"));
      }
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }
}
