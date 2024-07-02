part of "index.dart";

class AsymmetricCipherImplementation
    extends Implementation<AsymmetricCipher, AsymmetricCipherParams> {
  static final values = [rsa];

  static const AsymmetricCipherImplementation rsa =
      AsymmetricCipherImplementation(
          null,
          RsaAsymmetricCipherImplementationConverter(),
          AsymmetricCipherParamsImplementation.base,
          "Default");

  const AsymmetricCipherImplementation(
      AsymmetricCipherImplementation? super.underlying,
      AsymmetricCipherImplementationConverter super.converter,
      AsymmetricCipherParamsImplementation super.requiredParams,
      super.name);
}

abstract class AsymmetricCipherImplementationConverter
    extends MeanImplementationConverter<AsymmetricCipher,
        AsymmetricCipherParams> {
  const AsymmetricCipherImplementationConverter();
}

class AsymmetricCipherImplementationSerializer
    extends EnumSerializer<AsymmetricCipherImplementation> {
  AsymmetricCipherImplementationSerializer()
      : super(AsymmetricCipherImplementation.values);
}

class AsymmetricCipherImplementationInteractor
    extends NamedEnumInteractor<AsymmetricCipherImplementation> {
  AsymmetricCipherImplementationInteractor(
      {super.key,
      required super.initial,
      super.title = "Asymmetric cipher algorithm",
      super.description =
          "Select the type of Asymmetric cipher you want to use.",
      super.onChanged})
      : super(values: AsymmetricCipherImplementation.values);

  @override
  AsymmetricCipherImplementationInteractorState createState() =>
      AsymmetricCipherImplementationInteractorState();
}

class AsymmetricCipherImplementationInteractorState
    extends NamedEnumInteractorState<AsymmetricCipherImplementation> {}

typedef AsymmetricCipherImplementationInteractorKey
    = NamedEnumInteractorKey<AsymmetricCipherImplementation>;
