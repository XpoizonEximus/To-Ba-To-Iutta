part of "index.dart";

class KdfImplementation extends Implementation<Kdf, KdfParams> {
  static final values = [empty, hash, aesCmac, poly1305];

  static const empty = KdfImplementation(null,
      EmptyKdfImplementationConverter(), KdfParamsImplementation.base, "Empty");

  static final hash = KdfImplementation(
      null,
      const HashKdfImplementationConverter(),
      KdfParamsImplementation.hash,
      "Hmac");

  static const aesCmac = KdfImplementation(
      null,
      AesCmacKdfImplementationConverter(),
      KdfParamsImplementation.base,
      "Cmac with AES cipher");

  static const poly1305 = KdfImplementation(
      null,
      Poly1305KdfImplementationConverter(),
      KdfParamsImplementation.base,
      "Poly1305");

  const KdfImplementation(
      KdfImplementation? super.underlying,
      KdfImplementationConverter super.converter,
      KdfParamsImplementation super.requiredParams,
      super.name);
}

abstract class KdfImplementationConverter
    extends MeanImplementationConverter<Kdf, KdfParams> {
  const KdfImplementationConverter();
}

class KdfImplementationSerializer extends EnumSerializer<KdfImplementation> {
  KdfImplementationSerializer() : super(KdfImplementation.values);
}

class KdfImplementationInteractor
    extends NamedEnumInteractor<KdfImplementation> {
  KdfImplementationInteractor(
      {super.key,
      required super.initial,
      super.title = "Key derivation function",
      super.description = "Select the type of KDF you want to use.",
      super.onChanged})
      : super(values: KdfImplementation.values);

  @override
  NamedEnumInteractorState<KdfImplementation> createState() =>
      KdfImplementationInteractorState();
}

class KdfImplementationInteractorState
    extends NamedEnumInteractorState<KdfImplementation> {}

typedef KdfImplementationInteractorKey
    = NamedEnumInteractorKey<KdfImplementation>;
