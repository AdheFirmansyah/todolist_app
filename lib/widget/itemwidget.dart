// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_todolistapp/model/todo_item.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.todoItem,
  }) : super(key: key);

  final ToDoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: todoItem.isDone?Colors.grey:Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoItem.title),
                  const SizedBox(height: 5),
                  Text(todoItem.description),
                ],
              ),
            ),
            const SizedBox(width: 5),
            if (!todoItem.isDone)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: (){}, 
                child: const Icon(Icons.check)
                ),
            const SizedBox(width: 8),
            if (!todoItem.isDone)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: (){}, 
                child: const Icon(Icons.delete_forever),
              )
          ],
        ),
        ),
    );
  }
}