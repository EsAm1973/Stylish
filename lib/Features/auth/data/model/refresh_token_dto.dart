class RefreshTokenDto {
  final String refreshToken;
  final String accessToken;
  RefreshTokenDto({required this.refreshToken, required this.accessToken});
  Map<String, dynamic> toJson() {
    return {'refresh_token': refreshToken, 'access_token': accessToken};
  }
}
