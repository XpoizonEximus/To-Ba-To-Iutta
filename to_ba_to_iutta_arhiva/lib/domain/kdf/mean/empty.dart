part of "../index.dart";

class EmptyKdf extends Kdf {
  EmptyKdf(super.params);

  @override
  KdfData get data => KdfData(KdfImplementation.empty, KdfParams(nonceSize));

  @override
  FutureOr<Bytes> process(Bytes input, KdfVariables variables,
          {syncronized = true}) =>
      syncronized
          ? input as FutureOr<Bytes>
          : (() async => input)() as FutureOr<Bytes>;
}

class EmptyKdfImplementationConverter extends KdfImplementationConverter {
  const EmptyKdfImplementationConverter();

  @override
  EmptyKdf convert(KdfParams params) => EmptyKdf(params);
}
