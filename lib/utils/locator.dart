import 'package:get_it/get_it.dart';
import 'package:spnk/data/data_sources/local_data_source_impl.dart';
import 'package:spnk/data/repository/repository_impl.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator
      .registerLazySingleton<LocalDataSourceImpl>(() => LocalDataSourceImpl());
  locator.registerLazySingleton(
    () => RepositoryImpl(localDataSource: locator<LocalDataSourceImpl>()),
  );
  // locator.registerSingleton(instance)
}
