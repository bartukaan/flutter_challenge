import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/repositories/feed_repository.dart';
import 'package:flutter_challenge/services/feed_services.dart';
import 'package:get_it/get_it.dart';

import 'view_models/feed_view_model.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => FeedService());
  getIt.registerLazySingleton(() => FeedRepository());
  getIt.registerFactory(() => FeedViewModel());
  getIt.registerLazySingleton(() => Feed());
}
