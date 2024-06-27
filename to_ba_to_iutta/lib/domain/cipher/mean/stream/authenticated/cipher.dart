part of "../../../index.dart";

abstract class AuthenticatedStreamCipher extends StreamCipher {
  final AuthenticatedStreamCipherParams params;

  AuthenticatedStreamCipher.constructor(this.params) : super(params);

  factory AuthenticatedStreamCipher(AuthenticatedStreamCipherParams params) {
    return _CryptographyAuthenticatedStreamCipher(params);
  }

  @override
  CipherData get data =>
      CipherData(CipherImplementation.authenticatedStream, params);
}

class AuthenticatedStreamCipherImplementationConverter
    extends CipherImplementationConverter {
  const AuthenticatedStreamCipherImplementationConverter();
  @override
  Cipher convert(covariant AuthenticatedStreamCipherParams params) =>
      AuthenticatedStreamCipher(params);
}
