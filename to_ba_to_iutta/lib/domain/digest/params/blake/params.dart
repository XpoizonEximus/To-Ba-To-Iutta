part of "../../index.dart";

enum BlakeType implements Named {
  x2s("2s"),
  x2b("2b");

  @override
  final String name;

  const BlakeType(this.name);
}

class BlakeSize extends BoundedInt {
  const BlakeSize.defaults(BlakeType type)
      : this(type == BlakeType.x2b ? 64 : 32, type);

  static const standardMin = 0;
  static int standardMax(BlakeType type) =>
      switch (type) { BlakeType.x2s => 32, BlakeType.x2b => 64 };

  const BlakeSize(super.size, BlakeType type)
      : super(min: standardMin, max: type == BlakeType.x2b ? 64 : 32);
}

class BlakeDigestParams extends DigestParams {
  final BlakeSize outputSize;
  final BlakeType type;

  const BlakeDigestParams(this.outputSize, this.type);

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
      BlakeDigestParamsInteractor(
          key: key, initial: params, title: params.implementation.name);
}
