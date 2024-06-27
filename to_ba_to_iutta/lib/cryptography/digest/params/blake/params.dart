part of "../../index.dart";

enum BlakeDigestType implements Named {
  x2s("2s"),
  x2b("2b");

  @override
  final String name;

  const BlakeDigestType(this.name);
}

class BlakeDigestSize extends BoundedInt {
  BlakeDigestSize.defaults(BlakeDigestType type)
      : this(standardMax(type), type);

  static const standardMin = 0;
  static int standardMax(BlakeDigestType type) =>
      switch (type) { BlakeDigestType.x2s => 32, BlakeDigestType.x2b => 64 };

  BlakeDigestSize(super.size, BlakeDigestType type)
      : super(min: standardMin, max: standardMax(type));
}

class BlakeDigestParams extends DigestParams {
  final BlakeDigestSize _outputSize;
  final BlakeDigestType type;

  int get outputSize => _outputSize.value;

  BlakeDigestParams(super.underlying, this.type, int size)
      : _outputSize = BlakeDigestSize(size, type),
        super.fromParams();

  BlakeDigestParams.fromParams(BlakeDigestParams params)
      : this(params, params.type, params.outputSize);

  @override
  DigestParamsImplementation get implementation =>
      DigestParamsImplementation.blake;
}

class BlakeDigestParamsInteractorConverter
    extends DigestParamsInteractorConverter {
  const BlakeDigestParamsInteractorConverter();

  @override
  BlakeDigestParamsInteractor convert(covariant BlakeDigestParams params,
          {Key? key}) =>
      BlakeDigestParamsInteractor(key: key, initial: params);
}
