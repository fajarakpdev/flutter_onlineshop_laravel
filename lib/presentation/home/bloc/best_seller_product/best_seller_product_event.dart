part of 'best_seller_product_bloc.dart';

@freezed
class BestSellerProductEvent with _$BestSellerProductEvent {
  const factory BestSellerProductEvent.started() = _Started;
  const factory BestSellerProductEvent.getBestSellerProduct() =
      _GetBestSellerProduct;
}
