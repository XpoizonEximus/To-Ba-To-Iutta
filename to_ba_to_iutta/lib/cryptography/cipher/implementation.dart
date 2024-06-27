part of "index.dart";

class CipherImplementation extends Implementation<Cipher, CipherParams> {
  static final values = [
    unauthenticatedBlock,
    authenticatedBlock,
    unauthenticatedStream,
    authenticatedStream
  ];

  static final unauthenticatedBlock = CipherImplementation(
      null,
      const UnauthenticatedBlockCipherImplementationConverter(),
      CipherParamsImplementation.unauthenticatedBlock,
      "Block cipher with separate authentication");

  static final authenticatedBlock = CipherImplementation(
      null,
      const AuthenticatedBlockCipherImplementationConverter(),
      CipherParamsImplementation.authenticatedBlock,
      "Block cipher with built-in authentication");

  static final unauthenticatedStream = CipherImplementation(
      null,
      const UnauthenticatedStreamCipherImplementationConverter(),
      CipherParamsImplementation.unauthenticatedStream,
      "Block cipher with separate authentication");

  static final authenticatedStream = CipherImplementation(
      null,
      const AuthenticatedStreamCipherImplementationConverter(),
      CipherParamsImplementation.authenticatedStream,
      "Block cipher with built-in authentication");

  const CipherImplementation(
      CipherImplementation? super.underlying,
      CipherImplementationConverter super.converter,
      CipherParamsImplementation super.requiredParams,
      super.name);
}

abstract class CipherImplementationConverter
    extends MeanImplementationConverter<Cipher, CipherParams> {
  const CipherImplementationConverter();
}

class CipherImplementationSerializer
    extends EnumSerializer<CipherImplementation> {
  CipherImplementationSerializer() : super(CipherImplementation.values);
}

class CipherImplementationInteractor
    extends NamedEnumInteractor<CipherImplementation> {
  CipherImplementationInteractor(
      {super.key,
      required super.initial,
      super.title = "Key derivation function",
      super.description = "Select the type of Cipher you want to use.",
      super.onChanged})
      : super(values: CipherImplementation.values);

  @override
  NamedEnumInteractorState<CipherImplementation> createState() =>
      CipherImplementationInteractorState();
}

class CipherImplementationInteractorState
    extends NamedEnumInteractorState<CipherImplementation> {}

typedef CipherImplementationInteractorKey
    = NamedEnumInteractorKey<CipherImplementation>;
