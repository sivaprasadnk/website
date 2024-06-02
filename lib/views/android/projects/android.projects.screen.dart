import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/entity/project_entity.dart';
import 'package:spnk/utils/common_strings.dart';
import 'package:spnk/utils/common_widgets.dart';
import 'package:spnk/views/provider/route_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';
import 'package:spnk/views/windows/small/projects/app.summary/image.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/project.title.dart';
import 'package:spnk/views/windows/small/projects/app.summary/text.container.dart';
import 'package:spnk/views/windows/small/projects/app.summary/view.more.small.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidProjects extends StatefulWidget {
  final double screenHeight;
  const AndroidProjects({required this.screenHeight});
  @override
  _AndroidProjectsState createState() => _AndroidProjectsState();
}

class _AndroidProjectsState extends State<AndroidProjects> {
  PageController controller = PageController();

  bool showNextIcon = true;
  bool showPrevIcon = false;

  Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) animationItemBuilder(
    Widget Function(int index) child, {
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) =>
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            child: CustomPaint(
              painter: AndroidBgCurve(ctx: context),
              child: Container(),
            ),
          ),
        ),
        const AndroidDashImage(dashImage: 'dash3'),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Provider.of<RouteProvider>(context, listen: false)
                    .setMenuSelected(check: true);
              },
            ),
          ),
        ),
        SizedBox(
          height: widget.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: widget.screenHeight * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'My Projects',
                  style: TextStyle(
                    fontFamily: kFontFamily2,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: widget.screenHeight * 0.18,
              ),
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.8,
                    child: PageView(
                      onPageChanged: (pageIndex) {
                        setState(() {
                          showPrevIcon = pageIndex != 0;
                          showNextIcon = pageIndex != 2;
                        });
                      },
                      controller: controller,
                      children: projectList.map((project) {
                        return SizedBox(
                          height: screenHeight * 0.5,
                          child: Stack(
                            children: [
                              ImageContainerSmall(
                                imagePath: project.bgAssetPath,
                              ),
                              Positioned.fill(
                                left: 20,
                                bottom: -2,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: const TextContainer().blurred(
                                    overlay: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          ProjectTitle(title: project.projName),
                                          const Expanded(
                                            child: Text(""),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await launchUrl(
                                                Uri.parse(spQuizLink),
                                              );
                                            },
                                            child:
                                                const ViewMoreContainerSmall(),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      // children: const [
                      //   QuizAppItemMobile(),
                      //   QuotesAppItemSmall(),
                      //   PortfolioAppItemMobile()
                      // ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                        },
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: showPrevIcon
                              ? const Icon(
                                  Icons.arrow_back_ios,
                                ).showCursorOnHover
                              : const SizedBox.shrink(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceOut,
                          );
                        },
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: showNextIcon
                              ? const Icon(
                                  Icons.arrow_forward_ios,
                                ).showCursorOnHover
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // SingleChildScrollView(
              //   child: LiveList(
              //     shrinkWrap: true,
              //     // physics: NeverScrollableScrollPhysics(),
              //     padding: EdgeInsets.zero,
              //     showItemInterval: const Duration(milliseconds: 50),
              //     itemCount: 6,
              //     itemBuilder: animationItemBuilder((index) {
              //       switch (index) {
              //         case 0:
              //           return const TitleText(title: 'SP Quotes App');
              //         case 1:
              //           return const DescriptionText(
              //             description: spQuotesAppDescription,
              //           );
              //         case 2:
              //           return GooglePlayButton(
              //             url: spQuotesLink,
              //             screenWidth: screenwidth,
              //           );
              //         case 3:
              //           return const TitleText(title: 'SP Quiz App');
              //         case 4:
              //           return const DescriptionText(
              //             description: spQuizAppDescription,
              //           );
              //         case 5:
              //           return GooglePlayButton(
              //             screenWidth: screenwidth,
              //             url: spQuizLink,
              //           );
              //       }
              //       return const SizedBox.shrink();
              //     }),
              //   ),
              // ),
              SizedBox(
                height: widget.screenHeight * 0.08,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
