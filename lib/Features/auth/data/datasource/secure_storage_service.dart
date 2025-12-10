import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:stylish/Features/auth/data/model/authentication_pair.dart';

class TokenStorageImpl implements TokenStorage<TokensPair> {
  final FlutterSecureStorage _storage;
  TokenStorageImpl(this._storage);
  @override
  Future<TokensPair?> read() async {
    final tokenJson = await _storage.read(
      key: TokensStorageKeys.authToken.keyName,
    );
    if (tokenJson == null) return null;
    return TokensPair.fromJson(jsonDecode(tokenJson) as Map<String, dynamic>);
  }

  @override
  Future<void> write(TokensPair token) {
    return _storage.write(
      key: TokensStorageKeys.authToken.keyName,
      value: jsonEncode(token.toJson()),
    );
  }

  @override
  Future<void> delete() async {
    for (final key in TokensStorageKeys.values) {
      await _storage.delete(key: key.keyName);
    }
  }
}

enum TokensStorageKeys {
  /// Key for storing authentication tokens
  authToken('app_auth_token');

  /// Key name
  final String keyName;
  const TokensStorageKeys(this.keyName);
}
