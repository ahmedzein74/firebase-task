part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}
class TodosLoding extends TodosState {}
class TodosSuccess extends TodosState {}
class TodosError extends TodosState {}
