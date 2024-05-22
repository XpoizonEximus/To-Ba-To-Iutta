part of "index.dart";

class Data<M extends Mean, P extends Params> {
  final Implementation<M, P> implementation;
  final P params;

  Data(this.implementation, this.params) {
    if (!params.implementation.isOf(implementation.requiredParams)) {
      throw ArgumentError(
          "Invalid params ${params.implementation.name} for implementation ${implementation.name}");
    }
  }

  M get newMean => implementation.mean(params);
}
