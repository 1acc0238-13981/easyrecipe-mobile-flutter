import 'package:easy_recipe/features/home/application/get_recipes_use_case.dart';
import 'package:easy_recipe/features/home/domain/recipe_repository.dart';
import 'package:easy_recipe/features/home/infrastructure/recipe_repository_impl.dart';
import 'package:easy_recipe/features/home/infrastructure/remote/recipe_api.dart';
import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<RecipeApi>(() => RecipeApi());
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(api: getIt<RecipeApi>()),
  );
  getIt.registerLazySingleton<GetRecipesUseCase>(
    () => GetRecipesUseCase(repository: getIt<RecipeRepository>()),
  );
  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(getRecipesUseCase: getIt<GetRecipesUseCase>()),
  );
}
