
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/exam_result_view_model.dart';

class BodyExamResult extends StatelessWidget {
  const BodyExamResult({Key? key, required this.vm}) : super(key: key);
  final ExamResultViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: vm.getData(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ObxValue((_) {
              return ListView.separated(
                itemCount: vm.list.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () => vm.goToDetails(index),
                    title: Text(
                      vm.list[index].topic,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(
                      vm.list[index].dateTime.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return Container(
                    color: Colors.white38,
                    height: 10,
                  );
                },
              );
            }, vm.list,
          );
        },
      ),
    );
  }
}
