import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spnk/views/provider/data_provider.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallExperienceScreen extends StatefulWidget {
  @override
  State<WindowsSmallExperienceScreen> createState() =>
      _WindowsSmallExperienceScreenState();
}

class _WindowsSmallExperienceScreenState
    extends State<WindowsSmallExperienceScreen> {
  bool showLottie = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final expList = ref.watch(experienceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.13),
        SectionTitle(screenWidth: screenWidth, title: 'Experience'),
        SizedBox(height: screenHeight * 0.12),
        Column(
          children: expList.map((e) {
            return FadeInRight(
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.2,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${e.title}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Theme.of(context).splashColor,
                          ),
                          Text(
                            '      ${e.orgName}',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Theme.of(context).splashColor,
                          ),
                          Text(
                            '      ${e.startDate} - ${e.endDate}',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        // FadeInRight(
        //   child: ListTile(
        //     title: Padding(
        //       padding: EdgeInsets.only(
        //         left: screenWidth * 0.2,
        //       ),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             ' Java, Postgres Programmer',
        //             style: Theme.of(context).textTheme.displaySmall,
        //           ),
        //           const SizedBox(height: 20),
        //           Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               CircleAvatar(
        //                 radius: 5,
        //                 backgroundColor: Theme.of(context).splashColor,
        //               ),
        //               Text(
        //                 '      Bayasys Infotech Pvt Ltd.',
        //                 style: Theme.of(context).textTheme.displaySmall,
        //               ),
        //             ],
        //           ),
        //           Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               CircleAvatar(
        //                 radius: 5,
        //                 backgroundColor: Theme.of(context).splashColor,
        //               ),
        //               Text(
        //                 '      07/2019 - 09/2020',
        //                 style: Theme.of(context).textTheme.displaySmall,
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // FadeInRight(
        //   child: SizedBox(
        //     child: ListTile(
        //       title: Padding(
        //         padding: EdgeInsets.only(
        //           left: screenWidth * 0.2,
        //           top: screenHeight * .05,
        //         ),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               'Flutter Developer',
        //               style: Theme.of(context).textTheme.displaySmall,
        //             ),
        //             const SizedBox(height: 20),
        //             Row(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 5,
        //                   backgroundColor: Theme.of(context).splashColor,
        //                 ),
        //                 Text(
        //                   '      Indbytes Technologies Pvt Ltd',
        //                   style: Theme.of(context).textTheme.displaySmall,
        //                 ),
        //               ],
        //             ),
        //             Row(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 5,
        //                   backgroundColor: Theme.of(context).splashColor,
        //                 ),
        //                 Text(
        //                   '      12/2020 - 05/2023',
        //                   style: Theme.of(context).textTheme.displaySmall,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // FadeInRight(
        //   child: SizedBox(
        //     child: ListTile(
        //       title: Padding(
        //         padding: EdgeInsets.only(
        //           left: screenWidth * 0.2,
        //           top: screenHeight * .05,
        //         ),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               'Consultant Mobile app Developer',
        //               style: Theme.of(context).textTheme.displaySmall,
        //             ),
        //             const SizedBox(height: 20),
        //             Row(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 5,
        //                   backgroundColor: Theme.of(context).splashColor,
        //                 ),
        //                 Text(
        //                   '      Invenics Services India Pvt Ltd',
        //                   style: Theme.of(context).textTheme.displaySmall,
        //                 ),
        //               ],
        //             ),
        //             Row(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 5,
        //                   backgroundColor: Theme.of(context).splashColor,
        //                 ),
        //                 Text(
        //                   '      05/2023 - Present',
        //                   style: Theme.of(context).textTheme.displaySmall,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Flexible(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: showLottie ? 1 : 0,
            child: Image.asset(
              'assets/images/dash/dash2.png',
              height: 280,
            ),
            // child: Lottie.asset(
            //   'assets/lotties/work.json',
            //   height: screenHeight * 0.22,
            // ),
          ),
        ),
      ],
    );
  }
}
