import 'package:flutter/material.dart';
import 'package:reactiv/state_management/widgets/observer.dart';
import 'package:reactiv/views/reactive_state_widget.dart';
import '../controller.dart';
import 'bottom_sheet_text.dart';

class CountButton extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    return BindController(controller: () => MathController());
  }

  final String count;
  final Color color;

  const CountButton({super.key, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.questionAnswerList.isNotEmpty) {
          showModalBottomSheet(
            backgroundColor: Colors.teal[200],
            context: context,
            builder: (context) {
              return ListView.builder(
                  itemCount: controller.questionAnswerList.length,
                  itemBuilder: (context, index) {
                    var questionList = controller.questionAnswerList[index];
                    return Container(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        tileColor: questionList.tileColor,
                        leading:
                            Text('${index + 1})', style: bottomTextTextStyle),
                        title: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(questionList.firstNoo.toString(),
                                style: bottomTextTextStyle),
                            const SizedBox(width: 10),
                            Text(questionList.mathSign,
                                style: bottomTextTextStyle),
                            const SizedBox(width: 10),
                            Text(questionList.secondNoo.toString(),
                                style: bottomTextTextStyle),
                            const SizedBox(width: 10),
                            Text('=', style: bottomTextTextStyle),
                            const SizedBox(width: 10),
                            Observer(
                                listenable: controller.userAnswer,
                                listener: (context) {
                                  return Flexible(
                                    child: Text(questionList.answer.toString(),
                                        style: bottomTextTextStyle),
                                  );
                                }),
                          ],
                        ),
                        trailing: questionList.icon,
                      ),
                    );
                  });
            },
          );
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Center(
          child: Text(
            count,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ),
    );
  }
}
