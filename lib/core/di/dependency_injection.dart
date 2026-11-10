import 'package:easy_recipe/core/app_database.dart';
import 'package:easy_recipe/core/secure_token_storage.dart';
import 'package:easy_recipe/core/token_storage.dart';
import 'package:easy_recipe/features/auth/application/login_use_case.dart';
import 'package:easy_recipe/features/auth/domain/auth_repository.dart';
import 'package:easy_recipe/features/auth/infrastructure/auth_api.dart';
import 'package:easy_recipe/features/auth/infrastructure/auth_repository_impl.dart';
import 'package:easy_recipe/features/auth/presentation/login_view_model.dart';
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
import 'package:easy_recipe/features/to_cook/application/get_recipes_to_cook_use_case.dart';
import 'package:easy_recipe/features/to_cook/application/toggle_recipe_to_cook_use_case.dart';
import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook_repository.dart';
import 'package:easy_recipe/features/to_cook/infrastructure/recipe_to_cook_repository_impl.dart';
import 'package:easy_recipe/features/to_cook/infrastructure/remote/recipe_to_cook_api.dart';
import 'package:easy_recipe/features/to_cook/presentation/recipes_to_cook_view_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  getIt.registerLazySingleton<AuthApi>(() => AuthApi());
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(api: getIt<AuthApi>(), tokenStorage: getIt<TokenStorage>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(login: getIt<LoginUseCase>()),
  );

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<TokenStorage>(
    () => SecureTokenStorage(storage: getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<RecipeToCookApi>(
    () => RecipeToCookApi(storage: getIt<TokenStorage>()),
  );

  getIt.registerLazySingleton<RecipeToCookRepository>(
    () => RecipeToCookRepositoryImpl(api: getIt<RecipeToCookApi>()),
  );

  getIt.registerLazySingleton<GetRecipesToCookUseCase>(
    () => GetRecipesToCookUseCase(repository: getIt<RecipeToCookRepository>()),
  );

  getIt.registerLazySingleton<ToggleRecipeToCookUseCase>(
    () => ToggleRecipeToCookUseCase(repository: getIt<RecipeToCookRepository>()),
  );

  getIt.registerLazySingleton<RecipesToCookViewModel>(
    () => RecipesToCookViewModel(
      getRecipes: getIt<GetRecipesToCookUseCase>(),
      toggleRecipe: getIt<ToggleRecipeToCookUseCase>(),
    ),
  );
}
