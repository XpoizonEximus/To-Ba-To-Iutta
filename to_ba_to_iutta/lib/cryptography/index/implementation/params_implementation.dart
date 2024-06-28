part of "../index.dart";

class ParamsImplementation<P extends Params, I extends ParamsInteractor<P>>
    implements Named {
  final ParamsImplementation<P, I>? _underlying;
  final ParamsInteractorConverter<P, I> _converter;
  final ParamsSerializer<P> serializer;
  @override
  final String name;

  final P defaults;

  const ParamsImplementation(this._underlying, this._converter, this.serializer,
      this.name, this.defaults);

  I interactor(P params, {Key? key}) => _converter.convert(params, key: key);

  bool isOf(ParamsImplementation<P, I> parent) {
    return this == parent ||
        (this._underlying != null && this._underlying.isOf(parent));
  }
}
