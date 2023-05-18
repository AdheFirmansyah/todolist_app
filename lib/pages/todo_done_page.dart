import 'package:flutter/material.dart';
import 'package:flutter_application_todolistapp/model/todo_item.dart';
import 'package:flutter_application_todolistapp/utils/network_manager.dart';
import 'package:flutter_application_todolistapp/widget/item_widget.dart';

class ToDonePage extends StatefulWidget {
  const ToDonePage({super.key});

  @override
  State<ToDonePage> createState() => _ToDonePage();
}

class _ToDonePage extends State<ToDonePage> {
  List<ToDoItem> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    super.initState();
    NetworkManager().getTodosIsDone(true).then((value) {
      todos = value;
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo is Done'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('To Do is Done', style: textTheme.bodyMedium,)
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index){
                  final todoItem = todos[index];
                  return ItemWidget(
                    todoItem: todoItem, 
                    handleRefresh: (){},
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}