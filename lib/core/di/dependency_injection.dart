import 'package:easy_recipe/core/app_database.dart';
import 'package:easy_recipe/features/favorites/application/get_favorites_use_case.dart';
import 'package:easy_recipe/features/favorites/application/toggle_favorite_use_case.dart';
import 'package:easy_recipe/features/favorites/domain/favorite_repository.dart';
import 'package:easy_recipe/features/favorites/infrastructure/favorite_dao.dart';
import 'package:easy_recipe/features/favorites/infrastructure/favorite_repository_impl.dart';
import 'package:easy_recipe/features/home/application/get_recipes_use_case.dart';
import 'package:easy_recipe/features/home/domain/recipe_repository.dart';
import 'package:easy_recipe/features/home/infrastructure/recipe_repository_impl.dart';
import 'package:easy_recipe/features/home/infrastructure/remote/recipe_api.dart';
import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<FavoriteDao>(
    () => FavoriteDao(appDatabase: getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(dao: getIt<FavoriteDao>()),
  );

  getIt.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(repository: getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<ToggleFavoriteUseCase>(
    () => ToggleFavoriteUseCase(repository: getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<RecipeApi>(() => RecipeApi());
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(api: getIt<RecipeApi>()),
  );
  getIt.registerLazySingleton<GetRecipesUseCase>(
    () => GetRecipesUseCase(repository: getIt<RecipeRepository>()),
  );
  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(
      getRecipes: getIt<GetRecipesUseCase>(),
      getFavorites: getIt<GetFavoritesUseCase>(),
      toggleFavorite: getIt<ToggleFavoriteUseCase>(),
    ),
  );
}
