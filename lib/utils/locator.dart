import 'package:get_it/get_it.dart';
import 'package:spnk/data/data_sources/local_data_source_impl.dart';
import 'package:spnk/data/repository/repository_impl.dart';
import 'package:spnk/domain/repository/repository.dart';
import 'package:spnk/domain/use_case/get_about_me.dart';
import 'package:spnk/domain/use_case/get_contact_details.dart';
import 'package:spnk/domain/use_case/get_exp_details.dart';
import 'package:spnk/domain/use_case/get_project_details.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator
      .registerLazySingleton<LocalDataSourceImpl>(() => LocalDataSourceImpl());
  locator.registerLazySingleton(
    () => RepositoryImpl(localDataSource: locator<LocalDataSourceImpl>()),
  );
  locator.registerLazySingleton<GetContactDetails>(
    () => GetContactDetails(repository: locator<Repository>()),
  );
  locator.registerLazySingleton<GetExpDetails>(
    () => GetExpDetails(locator<Repository>()),
  );
  locator.registerLazySingleton<GetAboutMe>(
    () => GetAboutMe(locator<Repository>()),
  );
  locator.registerLazySingleton<GetProjectDetails>(
    () => GetProjectDetails(repository: locator<Repository>()),
  );
}
