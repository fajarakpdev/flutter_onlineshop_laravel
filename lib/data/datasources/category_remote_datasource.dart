import 'package:http/http.dart' as http;
import 'package:online_shop/core/constants/variables.dart';
import 'package:online_shop/data/models/responses/category_response_model.dart';
import 'package:dartz/dartz.dart';

class CategoryRemoteDatasource {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/categories'));

    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Terjadi Kesalahan');
    }
  }
}
