import 'package:flutter/material.dart';
import 'package:flutter_application_todolistapp/utils/network_manager.dart';
import 'package:flutter_application_todolistapp/widget/item_widget.dart';
import '../model/todo_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<ToDoItem> todos = [];
  bool isLoading = false;
  int totalDone = 0;

void refreshData(){
  setState(() {
    isLoading=true;
  });

  NetworkManager().getTodosIsDone(true).then((value) {
    totalDone = value.length;
    setState(() {
    });
  });

  NetworkManager().getTodosIsDone(false).then((value) {
    todos= value;
    setState(() {
      isLoading = false;
    });
  });
}
  @override
  void initState() {
    super.initState();
    refreshData();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('ToDoList'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('To Do List', style: textTheme.bodyLarge),
                TextButton(
                  onPressed: (){}, 
                  child: Text(
                    "Sudah Diselesaikan $totalDone",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            isLoading
            ? const Center(
              child: CircularProgressIndicator(),
            )
            :Expanded(
              child: todos.isEmpty
              ?const Center(
                child: Text('Tidak ada data'),
              )
              : ListView.builder(itemBuilder: (context, index){
                return ItemWidget(todoItem: todos[index]);
              },
              itemCount: todos.length,
              )
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: const Icon(Icons.add),
      ),
    );
  }
}