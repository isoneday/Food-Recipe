import 'package:dio/dio.dart';
import 'package:food_recipe/src/models/area/area_meals.dart';
import 'package:food_recipe/src/models/categories/categories.dart';
import 'package:food_recipe/src/models/latest/latest_meals.dart';

class FoodApiProvider {
  Dio dio = Dio();
  final _baseUrl = "https://www.themealdb.com";

  Future<AreaMeals> getAreaMeals() async {
    final response = await dio.get("$_baseUrl/api/json/v1/1/random.php");
    if (response.statusCode == 200) {
      return AreaMeals.fromJson(response.data);
    } else {
      throw Exception("Failed to get area meals");
    }
  }

  Future<Categories> getCategories() async {
    final response = await dio.get("$_baseUrl/api/json/v1/1/categories.php");
    if (response.statusCode == 200) {
      return Categories.fromJson(response.data);
    } else {
      throw Exception("Failed to get categories");
    }
  }

  Future<LatestMeals> getLatestMeals() async {
    final response = await dio.get("$_baseUrl/api/json/v1/1/latest.php");
    if (response.statusCode == 200) {
      return LatestMeals.fromJson(response.data);
    } else {
      throw Exception("Failed to get latest meals");
    }
  }

}