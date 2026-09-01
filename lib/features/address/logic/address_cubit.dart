import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/data/repos/address_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<Map<int, AddressModel>> {
  final AddressRepo addressRepo;

  AddressCubit(this.addressRepo) : super({});

  void loadAddresses() {
    final map = addressRepo.getCachedAddresses();
    emit(map);
  }

  Future<void> addNewAddress({
    required AddressModel addressModel,
    bool isAddressDefault = false,
  }) async {
    if (isAddressDefault) {
      final updatedMap = Map<int, AddressModel>.from(state);

      // 1. First get Address (Default One)
      final firstAddress = state[0];

      // 2. Add newAddress to 0 index (default)
      await addressRepo.saveAddress(addressModel: addressModel, key: 0);
      updatedMap[0] = addressModel;

      // 3. add First item to last "or can add it to section if we can"
      if (firstAddress != null) {
        await addressRepo.addAddress(addressModel: firstAddress);

        // Get next key
        final int nextKey = updatedMap.keys.isEmpty
            ? 0
            : updatedMap.keys.last + 1;
        updatedMap[nextKey] = firstAddress;
      }

      emit(updatedMap);
    } else {
      final newKey = await addressRepo.addAddress(addressModel: addressModel);
      emit({...state, newKey: addressModel});
    }
  }

  void removeAddress({required int addressKey}) async {
    final newMap = Map<int, AddressModel>.from(state)..remove(addressKey);
    await addressRepo.removeAddress(addressKey: addressKey);
    emit(newMap);
  }

  void updateAddress({
    required int addressKey,
    required AddressModel updatedAddressModel,
    required bool isAddressDefault,
  }) async {
    // 1. update
    final newMap = Map<int, AddressModel>.from(state);
    newMap[addressKey] = updatedAddressModel;

    // replace it
    if (isAddressDefault) {
      // 1. First get Address (Default One)
      final firstAddress = state[0];

      // 2. Add updatedAddress to 0 index (default)
      await addressRepo.saveAddress(addressModel: updatedAddressModel, key: 0);
      newMap[0] = updatedAddressModel;

      // 3. replace first address with updated address
      if (firstAddress != null) {
        await addressRepo.saveAddress(
          addressModel: firstAddress,
          key: addressKey,
        );
        newMap[addressKey] = firstAddress;
      }
    }

    await addressRepo.addressKey(
      addressKey: addressKey,
      updateAddress: updatedAddressModel,
    );
    emit(newMap);
  }

  AddressModel? getAddress({required int addressLey}) {
    return state[addressLey];
  }
}
