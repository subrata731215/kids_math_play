import 'package:flutter/material.dart';
import 'package:kids_math_play/mathgame/controller.dart';
import 'package:reactiv/reactiv.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final Function() onp;
  final Color? textColor;

  const Buttons(
      {super.key,
      required this.buttonText,
      required this.onp,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onp,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                  Colors.yellow
                ])),
        margin: const EdgeInsets.all(5),
        child: Center(
          child: Text(
            buttonText,
            style: textStyle.copyWith(fontSize: 40, color: textColor),
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle = const TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

class MyCirCleAvatar extends ReactiveStateWidget<MathController> {
  @override
  BindController<MathController>? bindController() {
    // TODO: implement bindController
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
                itemBuilder: (context, index) => ListTile(
                      leading: Text('${index + 1})', style: textStyle),
                      title: Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                              controller.questionAnswerList[index].firstNoo
                                  .toString(),
                              style: textStyle),
                          const SizedBox(width: 10),
                          Text(controller.questionAnswerList[index].mathSign,
                              style: textStyle),
                          const SizedBox(width: 10),
                          Text(
                              controller.questionAnswerList[index].secondNoo
                                  .toString(),
                              style: textStyle),
                          const SizedBox(width: 10),
                          Text('=', style: textStyle),
                          const SizedBox(width: 10),
                          Observer(
                              listenable: controller.userAnswer,
                              listener: (context) {
                                return Text(
                                    controller.questionAnswerList[index].answer
                                        .toString(),
                                    style: textStyle);
                              }),
                          const SizedBox(width: 20),
                        ],
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
