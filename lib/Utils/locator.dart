import 'package:get_it/get_it.dart';
import 'package:my_flutter_architecture/repository/repository.dart';
import 'package:my_flutter_architecture/services/concrete/auth_service.dart';
import 'package:my_flutter_architecture/services/concrete/db_service.dart';

GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(()=>DbService());
  locator.registerLazySingleton(()=>AuthService());
   locator.registerLazySingleton(()=>Repository());
}