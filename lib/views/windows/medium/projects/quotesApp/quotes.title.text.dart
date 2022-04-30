import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/views/windows/medium/projects/quizApp/quiz.title.text.dart';
import 'package:spnk/views/windows/medium/projects/view.more.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';

class QuotesTitleText extends StatelessWidget {
  const QuotesTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextContainer().blurred(
      overlay: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            const ProjectTitle(title: 'SP Quotes App'),
            const Expanded(
              child: Text(""),
            ),
            GestureDetector(
              onTap: () {
                Provider.of<DialogProvider>(context, listen: false)
                    .updateDialogOpenStatus(status: true);

                showAnimatedDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: DetailsContainer(
                        desc1: quotesAppStr1,
                        desc2: quotesAppStr2,
                        link: spQuotesLink,
                        title: 'SP Quotes App',
                      ),
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const ViewMoreContainer(),
            ),
          ],
        ),
      ),
      colorOpacity: 0.3,
      alignment: Alignment.topLeft,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
    );
  }
}
