part of "../index.dart";

abstract class ParamsInteractorConverter<P extends Params,
    I extends ParamsInteractor> {
  const ParamsInteractorConverter();

  I convert(P params, {Key? key});
}
