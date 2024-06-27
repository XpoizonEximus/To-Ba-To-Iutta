part of "index.dart";

class DigestImplementation extends Implementation<Digest, DigestParams> {
  static final values = [sm3, sha2, sha3, keccak, blake];

  static const DigestImplementation sm3 = DigestImplementation(
      null,
      Sm3DigestImplementationConverter(),
      DigestParamsImplementation.base,
      "SM3");

  static final DigestImplementation sha2 = DigestImplementation(
      null,
      const Sha2DigestImplementationConverter(),
      DigestParamsImplementation.classic,
      "SHA-2");

  static final DigestImplementation sha3 = DigestImplementation(
      null,
      const Sha3DigestImplementationConverter(),
      DigestParamsImplementation.classic,
      "SHA-3");

  static final DigestImplementation keccak = DigestImplementation(
      null,
      const KeccakDigestImplementationConverter(),
      DigestParamsImplementation.classic,
      "Keccak");

  static final DigestImplementation blake = DigestImplementation(
      null,
      const BlakeDigestImplementationConverter(),
      DigestParamsImplementation.blake,
      "Blake");

  const DigestImplementation(
      DigestImplementation? super.underlying,
      DigestImplementationConverter super.converter,
      DigestParamsImplementation super.requiredParams,
      super.name);
}

abstract class DigestImplementationConverter
    extends MeanImplementationConverter<Digest, DigestParams> {
  const DigestImplementationConverter();
}

class DigestImplementationSerializer
    extends EnumSerializer<DigestImplementation> {
  DigestImplementationSerializer() : super(DigestImplementation.values);
}

class DigestImplementationInteractor
    extends NamedEnumInteractor<DigestImplementation> {
  DigestImplementationInteractor(
      {super.key,
      required super.initial,
      super.title = "Digest algorithm",
      super.description = "Select the type of digest you want to use.",
      super.onChanged})
      : super(values: DigestImplementation.values);

  @override
  DigestImplementationInteractorState createState() =>
      DigestImplementationInteractorState();
}

class DigestImplementationInteractorState
    extends NamedEnumInteractorState<DigestImplementation> {}

typedef DigestImplementationInteractorKey
    = NamedEnumInteractorKey<DigestImplementation>;
