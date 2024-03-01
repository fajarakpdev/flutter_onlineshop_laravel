import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_shop/data/datasources/product_remode_datasource.dart';
import 'package:online_shop/data/models/responses/product_response_model.dart';

part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';
part 'best_seller_product_bloc.freezed.dart';

class BestSellerProductBloc
    extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  BestSellerProductBloc(this._productRemoteDatasource)
      : super(const _Initial()) {
    on<_GetBestSellerProduct>((event, emit) async {
      emit(const BestSellerProductState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(1);
      response.fold(
        (l) => emit(const BestSellerProductState.error('Internal server Error')),
        (r) => emit(BestSellerProductState.loaded(r.data!.data!)),
      );
    });
  }
}
