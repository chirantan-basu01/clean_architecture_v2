import 'package:educare_erp/features/test/models/address_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddressState extends Equatable{

  @override
  List<Object?> get props =>[];
}

class AddressInitial extends AddressState{}

class AddressLoading extends AddressState{}

class AddressLoaded extends AddressState{

  final List<AddressModel> address;
  AddressLoaded({required this.address});

  @override
  List<Object?> get props =>[address];


}

class AddressError extends AddressState{

  final String message;
  AddressError({required this.message});

  @override
  List<Object?> get props =>[message];

}
