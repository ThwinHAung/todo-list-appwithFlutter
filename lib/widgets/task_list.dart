import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoery_flutter/models/task_data.dart';
import 'package:todoery_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
                // setState(() {
                //   Provider.of<TaskData>(context).tasks![index].toggleDone();
                // });
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
