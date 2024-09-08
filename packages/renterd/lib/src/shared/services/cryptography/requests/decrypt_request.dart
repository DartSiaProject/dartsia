import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class DecryptRequest {
  static dynamic decryptWithAES256CBC({
    required String chipherText,
    required String key,
    required String iv,
  }) {
    var _decrypter = Encrypter(AES(
      encrypt.Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var _decrypted = _decrypter.decryptBytes(Encrypted.from64(chipherText),
        iv: encrypt.IV.fromUtf8(iv));
    var _decryptedString = utf8.decode(_decrypted);

    return _decryptedString.runtimeType is String
        ? _decryptedString.toString()
        : _decryptedString;
  }

  // static String decryptWithSHA256(String encryptedData) {
  //   var _bytes = encryptedData.codeUnits;

  //   var _data = hex.encode(digest.bytes);
  //   return _data;
  // }
}
