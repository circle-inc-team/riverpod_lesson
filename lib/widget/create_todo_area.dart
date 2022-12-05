import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../style/todo_style.dart';

class CreateTodoArea extends ConsumerStatefulWidget {
  const CreateTodoArea({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTodoAreaState();
}

class _CreateTodoAreaState extends ConsumerState<CreateTodoArea> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Uuid uuid = const Uuid();
  String name = '';

  @override
  Widget build(BuildContext context) {
    // size.height: 画面の高さ
    // size.width: 画面の横幅
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 90,
      width: size.width,
      child: Form(
        key: _formKey,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width - 130,
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: createTodoInputStyle,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'ToDoが入力されていません';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: name.isEmpty == true
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = '';
                          });
                          _formKey.currentState!.reset();
                          FocusScope.of(context).unfocus();
                        }
                      },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('送信'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
