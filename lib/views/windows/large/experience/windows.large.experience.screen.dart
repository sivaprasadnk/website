import 'package:flutter/material.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/windows/large/common.widgets/section.title.dart';

class WindowsLargeExperienceScreen extends StatefulWidget {
  @override
  _WindowsLargeExperienceScreenState createState() =>
      _WindowsLargeExperienceScreenState();
}

class _WindowsLargeExperienceScreenState
    extends State<WindowsLargeExperienceScreen>
    with AutomaticKeepAliveClientMixin {
  bool showLottie = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);

    final textStyle = Theme.of(context).textTheme.bodyLarge;
    final bulletPoint = CircleAvatar(
      radius: 5,
      backgroundColor: Theme.of(context).splashColor,
    );
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: context.screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.2),
              const WindowsLargeSectionTitle(
                title: 'Experience',
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.5,
                  top: context.screenHeight * .1,
                ),
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Java, Postgres Programmer',
                        style: textStyle,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          bulletPoint,
                          Text(
                            '      Bayasys Infotech Pvt Ltd.',
                            style: textStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          bulletPoint,
                          Text(
                            '      07/2019 - 09/2020',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.5,
                  top: context.screenHeight * .05,
                ),
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Developer',
                        style: textStyle,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          bulletPoint,
                          Text(
                            '      Indbytes Technologies',
                            style: textStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          bulletPoint,
                          Text(
                            '      12/2020 - 05/2023',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.5,
                  top: context.screenHeight * .05,
                ),
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Senior Mobile app Developer',
                        style: textStyle,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          bulletPoint,
                          Text(
                            '      Invenics Services India Pvt Ltd',
                            style: textStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          bulletPoint,
                          Text(
                            '      05/2023 - Present',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 100,
          left: context.screenWidth * 0.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showLottie ? 1 : 0,
              child: Image.asset(
                'assets/images/dash/dash2.png',
                height: 350,
              ),
            ),
          ),
        )
      ],
    );
  }
}
