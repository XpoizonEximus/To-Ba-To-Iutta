part of "../index.dart";

class Implementation<M extends Mean, P extends Params> implements Named {
  final Implementation<M, P>? _underlying;
  final MeanImplementationConverter<M, P> _converter;
  final ParamsImplementation<P, ParamsInteractor<P>> requiredParams;
  @override
  final String name;

  const Implementation(
      this._underlying, this._converter, this.requiredParams, this.name);

  M mean(P params) => _converter.convert(params);

  bool isOf(Implementation<M, P> parent) {
    return this == parent ||
        (this._underlying != null && this._underlying.isOf(parent));
  }
}
