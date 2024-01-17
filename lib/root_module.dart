import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_firestore/modules/home/home_module.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_cubit.dart';

import 'modules/home/domain/repositories/i_save_task_firestore_repository.dart';
import 'modules/home/domain/usecases/save_task_firestore_usecase.dart';
import 'modules/home/external/datasources/task_datasource.dart';
import 'modules/home/infrastructure/datasources/i_task_datasource.dart';
import 'modules/home/infrastructure/repositories/save_task_firestore_repository.dart';

class RootModule extends Module {
  @override
  void binds(Injector i) {
    //Datasource
    i.addSingleton<ITaskDatasource>(TaskDatasource.new);

    //Repositories
    i.addSingleton<ISaveTaskFirestoreRepository>(
      SaveTaskFirestoreRepository.new,
    );

    //Usecases
    i.addSingleton<ISaveTaskFirestoreUsecase>(
      SaveTaskFirestoreUsecase.new,
    );

    //Cubits
    i.addSingleton(TaskCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: HomeModule(),
    );
  }
}
