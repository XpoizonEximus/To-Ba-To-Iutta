part of "index.dart";

class AuthenticatorImplementation
    extends Implementation<Authenticator, AuthenticatorParams> {
  static final values = [empty, hash, aesCmac, poly1305];

  static const empty = AuthenticatorImplementation(
      null,
      EmptyAuthenticatorImplementationConverter(),
      AuthenticatorParamsImplementation.base,
      "Empty");

  static final hash = AuthenticatorImplementation(
      null,
      const HashAuthenticatorImplementationConverter(),
      AuthenticatorParamsImplementation.hash,
      "Hmac");

  static final aesCmac = AuthenticatorImplementation(
      null,
      const AesCmacAuthenticatorImplementationConverter(),
      AuthenticatorParamsImplementation.fixedLengthKey,
      "Cmac with AES cipher");

  static final poly1305 = AuthenticatorImplementation(
      null,
      const Poly1305AuthenticatorImplementationConverter(),
      AuthenticatorParamsImplementation.fixedLengthKey,
      "Poly1305");

  const AuthenticatorImplementation(
      AuthenticatorImplementation? super.underlying,
      AuthenticatorImplementationConverter super.converter,
      AuthenticatorParamsImplementation super.requiredParams,
      super.name);
}

abstract class AuthenticatorImplementationConverter
    extends MeanImplementationConverter<Authenticator, AuthenticatorParams> {
  const AuthenticatorImplementationConverter();
}

class AuthenticatorImplementationSerializer
    extends EnumSerializer<AuthenticatorImplementation> {
  AuthenticatorImplementationSerializer()
      : super(AuthenticatorImplementation.values);
}

class AuthenticatorImplementationInteractor
    extends NamedEnumInteractor<AuthenticatorImplementation> {
  AuthenticatorImplementationInteractor(
      {super.key,
      required super.initial,
      super.title = "Authenticator algorithm",
      super.description = "Select the type of authenticator you want to use.",
      super.onChanged})
      : super(values: AuthenticatorImplementation.values);

  @override
  NamedEnumInteractorState<AuthenticatorImplementation> createState() =>
      AuthenticatorImplementationInteractorState();
}

class AuthenticatorImplementationInteractorState
    extends NamedEnumInteractorState<AuthenticatorImplementation> {}

typedef AuthenticatorImplementationInteractorKey
    = NamedEnumInteractorKey<AuthenticatorImplementation>;
