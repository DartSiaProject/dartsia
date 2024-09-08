import 'encrypt_request.dart';

class GeneratorRequest {
  static Map<String, String> generateKeyAndIv(String data) {
    var _hashedData = EncryptRequest.hashWithSHA256(data);

    var _splitHashedData = _hashedData.split("");

    var _firstKeySixteenCaratersInUpercase = [];
    var _secondKeySixteenCaratersInLowerCase = [];

    var _firstIvHeightCaratersInUpercase = [];
    var _secondIvHeightCaratersInLowerCase = [];

    for (var _firstKeyIndex = 0; _firstKeyIndex <= 15; _firstKeyIndex++) {
      _firstKeySixteenCaratersInUpercase
          .add(_splitHashedData[_firstKeyIndex].toUpperCase());
    }
    for (var _secondKeyIndex = 16; _secondKeyIndex <= 31; _secondKeyIndex++) {
      _secondKeySixteenCaratersInLowerCase
          .add(_splitHashedData[_secondKeyIndex].toLowerCase());
    }

    for (var _firstIvIndex = 32; _firstIvIndex <= 39; _firstIvIndex++) {
      _firstIvHeightCaratersInUpercase
          .add(_splitHashedData[_firstIvIndex].toUpperCase());
    }
    for (var _secondIvIndex = 40; _secondIvIndex <= 47; _secondIvIndex++) {
      _secondIvHeightCaratersInLowerCase
          .add(_splitHashedData[_secondIvIndex].toLowerCase());
    }

    var _finalKey =
        "${_firstKeySixteenCaratersInUpercase.join('')}${_secondKeySixteenCaratersInLowerCase.join('')}";

    var _finalIV =
        "${_firstIvHeightCaratersInUpercase.join('')}${_secondIvHeightCaratersInLowerCase.join('')}";

    return {
      "key": _finalKey,
      "iv": _finalIV,
    };
  }
}
