import 'package:flutter/material.dart';
// import 'package:todoey_flutter/widgets/task_tile.dart';
// import 'package:provider/provider.dart';
// import 'package:todoey_flutter/models/task_data.dart';
import 'package:taskify/task_list/widgets/task_tile.dart';
import 'package:taskify/task_list/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final task = taskData.tasks[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                      onLongPress: () {
                        taskData.deleteTask(task);
                      },
                      title: Text(
                        task.name,
                        style: TextStyle(
                            decoration: task.isDone
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      trailing: Checkbox(
                        activeColor: Colors.lightBlueAccent,
                        value: task.isDone,
                        onChanged: (checkboxState) {
                          taskData.updateTask(task);
                        },
                      )),
                );
              },
              itemCount: taskData.taskCount);
        },
      ),
    );
  }
}
