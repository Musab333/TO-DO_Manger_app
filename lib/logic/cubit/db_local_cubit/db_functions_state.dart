part of 'db_functions_cubit.dart';

@immutable
abstract class DbFunctionsState {}

class DbFunctionsInitial extends DbFunctionsState {}

class CreateDatabaseState extends DbFunctionsState {}

class InsertNewTaskInDatabaseState extends DbFunctionsState {}

class GetDataFromDatabaseLoadingState extends DbFunctionsState {}

class GetDataFromDatabaseState extends DbFunctionsState {}

class UpdateTaskFromDatabaseState extends DbFunctionsState {}

class DeleteTaskFromDatabaseState extends DbFunctionsState {}
