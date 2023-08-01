

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_design/models/todo_model.dart';
import 'package:login_design/services/todo_service.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial())
  {
    getTodes();
  }
  List<ToDo> todos=[];
  getTodes()async{
    try{
      emit(TodosLoding());
       todos=await TodoService().getTodos();
       emit(TodosSuccess());

    }
    catch(e){
      print(e.toString());
      emit(TodosError());

    }
    
    
  }
}
