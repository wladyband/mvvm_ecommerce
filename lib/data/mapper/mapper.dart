// to convert the response into a non nullable object (model)

import 'package:mvvm_ecommerce/app/extensions.dart';
import 'package:mvvm_ecommerce/data/responses/responses.dart';
import 'package:mvvm_ecommerce/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? EMPTY,
        this?.name?.orEmpty() ?? EMPTY,
        this?.numOfNotifications?.orZero() ?? ZERO
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY,
        this?.link?.orEmpty() ?? EMPTY
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.customer?.toDomain(),
        this?.contacts?.toDomain()
    );
  }
}
