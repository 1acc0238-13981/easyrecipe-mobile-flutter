import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook_repository.dart';

class ToggleRecipeToCookUseCase {
  final RecipeToCookRepository _repository;
  const new({required this._repository});

  Future<void> execute(int id) async {
    final List ids = (await _repository.getRecipesToCook())
        .map((e) => e.id)
        .toList();

    if (ids.contains(id)) {
      await _repository.removeRecipeToCook(id);
    } else {
      await _repository.addRecipeToCook(id);
    }
  }
}
