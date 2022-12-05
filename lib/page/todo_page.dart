import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';
import '../provider/todos_provider.dart';
import '../widget/create_todo_area.dart';
import '../widget/todo_item.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todo> todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Lesson'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              const CreateTodoArea(),
              for (final Todo todo in todos)
                TodoItem(
                  todo: todo,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
