import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';
import '../provider/todos_provider.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(todo.text),
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (bool? value) {
            ref
                .read(
                  todosProvider.notifier,
                )
                .toggle(todo.id);
          },
        ),
        trailing: GestureDetector(
          onTap: () async {
            ref
                .read(
                  todosProvider.notifier,
                )
                .removeTodo(todo.id);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEB4438),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
