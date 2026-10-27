import 'dart:convert';
import 'dart:io';

import 'package:easy_recipe/features/home/infrastructure/remote/recipe_dto.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  final String url =
      'https://recipeapp-frgjf0fdcna7gtck.eastus-01.azurewebsites.net/api/recipes';

  Future<List<RecipeDto>> getRecipes() async {
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final List jsons = json['results'];
      return jsons.map((e) => RecipeDto.fromJson(e)).toList();
    } else {
      throw Exception('Faile to load recipes');
    }
  }
}
