import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

class EncryptRequest {
  static String encryptStringWithAES256CBC({
    required String data,
    required String key,
    required String iv,
  }) {
    var encrypter = Encrypter(AES(
      encrypt.Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var encrypted = encrypter.encrypt(data, iv: encrypt.IV.fromUtf8(iv));
    return encrypted.base64.toString();
  }

  static String encryptBytesWithAES256CBC({
    required Uint8List data,
    required String key,
    required String iv,
  }) {
    var encrypter = Encrypter(AES(
      encrypt.Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var encrypted = encrypter.encryptBytes(data, iv: encrypt.IV.fromUtf8(iv));
    return encrypted.base64.toString();
  }

  static String hashWithSHA256(dynamic data) {
    var _bytes = utf8.encode(data);
    var _digest = sha256.convert(_bytes);
    return _digest.toString();
  }
}
