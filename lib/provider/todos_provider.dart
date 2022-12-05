import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo.dart';

List<Todo> initialState = [];

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super(initialState);
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
