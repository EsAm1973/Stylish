import 'package:fresh_dio/fresh_dio.dart';
import 'package:stylish/Features/auth/data/model/authentication_pair.dart';

class TokenRefreshInterceptor {
  final TokenStorage<TokensPair> _tokenStorage;
  TokenRefreshInterceptor(this._tokenStorage);

  Fresh<TokensPair> get fresh => Fresh<TokensPair>(
    tokenStorage: _tokenStorage,
    tokenHeader: (token) {
      return {'Authorization': 'Bearer ${token.accessToken}'};
    },
    refreshToken: (token, client) async {
      try {
        final response = await client.post(
          'auth/refresh-token',
          data: {'refresh_token': token!.refreshToken},
        );

        final newTokens = response.data;
        return TokensPair(
          accessToken: newTokens['accessToken'],
          refreshToken: newTokens['refreshToken'],
        );
      } catch (e) {
        throw RevokeTokenException();
      }
    },
    shouldRefresh: (response) {
      return response?.statusCode == 401;
    },
  );
}
