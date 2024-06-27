part of "../index.dart";

abstract class MeanImplementationConverter<M extends Mean, P extends Params> {
  const MeanImplementationConverter();

  M convert(P params);
}
