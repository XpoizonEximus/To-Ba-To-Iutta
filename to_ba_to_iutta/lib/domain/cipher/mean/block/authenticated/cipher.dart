part of "../../../index.dart";

abstract class AuthenticatedBlockCipher extends BlockCipher {
  final AuthenticatedBlockCipherParams params;

  AuthenticatedBlockCipher.constructor(this.params) : super(params);

  factory AuthenticatedBlockCipher(AuthenticatedBlockCipherParams params) {
    switch (params.moo) {
      case AuthenticatedModeOfOperation.gcm:
        return _CryptographyAuthenticatedBlockCipher(params);
      case AuthenticatedModeOfOperation.ccm:
        return _PointyCastleAuthenticatedBlockCipher(params);
    }
  }

  @override
  CipherData get data =>
      CipherData(CipherImplementation.authenticatedBlock, params);
}

class AuthenticatedBlockCipherImplementationConverter
    extends CipherImplementationConverter {
  const AuthenticatedBlockCipherImplementationConverter();
  @override
  Cipher convert(covariant AuthenticatedBlockCipherParams params) =>
      AuthenticatedBlockCipher(params);
}
