import 'package:flutter/material.dart';
import 'package:reactiv/state_management/widgets/observer.dart';
import 'package:reactiv/views/reactive_state_widget.dart';
import '../../utils/textstyle.dart';
import '../controller.dart';

class MyCirCleAvatar extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    return BindController(controller: () => MathController());
  }

  final String count;
  final Color color;

  const MyCirCleAvatar({super.key, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.questionAnswerList.isNotEmpty) {
          showModalBottomSheet(
            backgroundColor: Colors.teal[200],
            context: context,
            builder: (context) => ListView.builder(
                itemCount: controller.questionAnswerList.length,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        tileColor:
                            controller.questionAnswerList[index].tileColor,
                        leading: Text('${index + 1})', style: textStyle),
                        title: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(
                                controller.questionAnswerList[index].firstNoo
                                    .toString(),
                                style: textStyle.copyWith(fontSize: 20)),
                            const SizedBox(width: 10),
                            Text(controller.questionAnswerList[index].mathSign,
                                style: textStyle.copyWith(fontSize: 20)),
                            const SizedBox(width: 10),
                            Text(
                                controller.questionAnswerList[index].secondNoo
                                    .toString(),
                                style: textStyle.copyWith(fontSize: 20)),
                            const SizedBox(width: 10),
                            Text('=', style: textStyle.copyWith(fontSize: 20)),
                            const SizedBox(width: 10),
                            Observer(
                                listenable: controller.userAnswer,
                                listener: (context) {
                                  return Text(
                                      controller
                                          .questionAnswerList[index].answer
                                          .toString(),
                                      style: textStyle.copyWith(fontSize: 20));
                                }),
                            const SizedBox(width: 20),
                          ],
                        ),
                        trailing: controller.questionAnswerList[index].icon,
                      ),
                    )),
          );
        }
      },
      child: CircleAvatar(
        radius: 30,
        child: Text(
          count,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(color: color),
        ),
      ),
    );
  }
}

