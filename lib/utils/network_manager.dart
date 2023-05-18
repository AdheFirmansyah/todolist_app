import 'package:dio/dio.dart';
import 'package:flutter_application_todolistapp/model/todo_item.dart';  

class NetworkManager {
  late final Dio _dio;
  final baseUrl = 'https://543d-103-111-100-43.ngrok-free.app';
  NetworkManager(){
    _dio = Dio();
  }

  Future<List<ToDoItem>> getTodosIsDone (bool isDone)async{
    final result = await _dio.get(
      '$baseUrl/todos?isDone=$isDone',
    );
  return (result.data as List).map((e) => ToDoItem.fromMap(e)).toList();
  }

  Future<ToDoItem> postData(ToDoItem item) async {
    final result = await _dio.post(
      '$baseUrl/todos',
      data: item.toMap(),
    );
    return ToDoItem.fromMap(result.data);
  }

  Future<ToDoItem> updateData (ToDoItem item) async {
    final result = await _dio.put(
      '$baseUrl/todos/${item.id}',
      data : item.toMap(),
    );
    return ToDoItem.fromMap(result.data);
  }

  Future<void> deleteData(ToDoItem item) async {
    await _dio.delete(
      '$baseUrl/todos/${item.id}',
    );
  }
}
