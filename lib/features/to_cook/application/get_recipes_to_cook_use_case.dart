import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook.dart';
import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook_repository.dart';

class GetRecipesToCookUseCase {
  final RecipeToCookRepository _repository;
  const new({required this._repository});

  Future<List<RecipeToCook>> execute() {
    return _repository.getRecipesToCook();
  }

}