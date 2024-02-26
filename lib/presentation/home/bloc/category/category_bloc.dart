import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_shop/data/datasources/category_remote_datasource.dart';

import '../../../../data/models/responses/category_response_model.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDatasource _categoryRemoteDatasource;
  CategoryBloc(this._categoryRemoteDatasource) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      final response = await _categoryRemoteDatasource.getCategories();
      response.fold(
        (l) => emit(const CategoryState.error('internal server error')),
        (r) => emit(CategoryState.loaded(r.data!)),
      );
    });
  }
}
