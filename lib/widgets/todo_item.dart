import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/colors.dart';
import 'package:todolist_flutter/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onDeleteItem;
  final onToDoChanged;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onDeleteItem,
      required this.onToDoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : (Icons.check_box_outline_blank),
          color: tbBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tbBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 40,
          decoration: BoxDecoration(
              color: tbRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            iconSize: 15,
            color: Colors.white,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
