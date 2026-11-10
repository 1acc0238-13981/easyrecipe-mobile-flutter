import 'dart:convert';
import 'dart:io';

import 'package:easy_recipe/core/token_storage.dart';
import 'package:easy_recipe/features/to_cook/infrastructure/remote/recipe_to_cook_dto.dart';
import 'package:http/http.dart' as http;

class RecipeToCookApi {
  final TokenStorage _storage;

  const new({required this._storage});

  final String url =
      'https://recipeapp-frgjf0fdcna7gtck.eastus-01.azurewebsites.net/api/to_cook';

  Future<List<RecipeToCookDto>> getRecipesToCook() async {
    final Uri uri = Uri.parse(url);
    final token = await _storage.getToken();

    http.Response response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List jsons = json['results'];
      return jsons.map((e) => RecipeToCookDto.fromJson(e)).toList();
    }

    throw Exception('Failed to load recipes to cook');
  }

  Future<void> toggleRecipeToCook(int id) async {
    final Uri uri = Uri.parse(url);
    final token = await _storage.getToken();

    http.Response response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'recipeId': id}),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed toggle recipe to cook');
    }
  }
}
