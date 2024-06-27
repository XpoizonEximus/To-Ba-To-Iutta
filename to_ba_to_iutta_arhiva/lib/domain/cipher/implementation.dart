part of "index.dart";

class CipherImplementation extends Implementation<Cipher, CipherParams> {
  static final values = [unauthenticatedBlock];

  static final unauthenticatedBlock = CipherImplementation(
      null,
      const UnauthenticatedBlockCipherImplementationConverter(),
      CipherParamsImplementation.unauthenticatedBlock,
      "Block cipher - separate authentication");

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
