part of "index.dart";

class DigestImplementation extends Implementation<Digest, DigestParams> {
  static const values = [sm3, sha2, sha3, keccak, blake];

  static const DigestImplementation sm3 = DigestImplementation(
      null,
      Sm3DigestImplementationConverter(),
      DigestParamsImplementation.base,
      "SM3");

  static const DigestImplementation sha2 = DigestImplementation(
      null,
      Sha2DigestImplementationConverter(),
      DigestParamsImplementation.classic,
      "SHA-2");

  static const DigestImplementation sha3 = DigestImplementation(
      null,
      Sha3DigestImplementationConverter(),
      DigestParamsImplementation.classic,
      "SHA-3");

  static const DigestImplementation keccak = DigestImplementation(
      null,
      KeccakDigestImplementationConverter(),
      DigestParamsImplementation.classic,
      "Keccak");

  static const DigestImplementation blake = DigestImplementation(
      null,
      BlakeDigestImplementationConverter(),
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
  const DigestImplementationSerializer() : super(DigestImplementation.values);
}

class DigestImplementationInteractor
    extends NamedEnumInteractor<DigestImplementation> {
  const DigestImplementationInteractor(
      {super.key,
      required super.initial,
      super.title = "Digest algorithm",
      super.description = "Select the type of digest you want to use.",
      super.onChanged})
      : super(values: DigestImplementation.values);

  @override
  NamedEnumInteractorState<DigestImplementation> createState() =>
      DigestImplementationInteractorState();
}

class DigestImplementationInteractorState
    extends NamedEnumInteractorState<DigestImplementation> {}

typedef DigestImplementationInteractorKey
    = NamedEnumInteractorKey<DigestImplementation>;
