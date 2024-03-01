import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:online_shop/data/datasources/product_remode_datasource.dart';
import 'package:online_shop/data/models/responses/product_response_model.dart';

part 'special_offer_product_event.dart';
part 'special_offer_product_state.dart';
part 'special_offer_product_bloc.freezed.dart';

class SpecialOfferProductBloc
    extends Bloc<SpecialOfferProductEvent, SpecialOfferProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  SpecialOfferProductBloc(this._productRemoteDatasource)
      : super(const _Initial()) {
    on<_GetSpecialOfferProducts>((event, emit) async {
      emit(const SpecialOfferProductState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(4);
      response.fold(
        (l) => emit(const SpecialOfferProductState.error('Internal Server Error')),
        (r) => emit(SpecialOfferProductState.loaded(r.data!.data!)),
      );
    });
  }
}
