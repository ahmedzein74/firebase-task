import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_design/views/widget/cubit/cubit/todos_cubit.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key,required String title});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:BlocProvider(
        create: (context) => TodosCubit(),
        child: BlocConsumer<TodosCubit, TodosState>(
          listener: (context, state) {
            if( state is TodosLoding){
              print('loading');
            }
          },
          builder: (context, state) {
            return state is TodosLoding ?Center(
                      child: CircularProgressIndicator(),
                    )
        : state is TodosSuccess?ListView.builder(
        itemCount: context.watch<TodosCubit>().todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(context.watch<TodosCubit>().todos[index].title ??'--'),) ;}):Center( child: Text("Error"),); 
          },
        )
      ));
      
  }
}


