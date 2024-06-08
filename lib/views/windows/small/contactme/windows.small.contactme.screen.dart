import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/utils/extensions/buildcontext.extensions.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_bloc.dart';
import 'package:spnk/views/bloc/contact_details/contact_details_state.dart';
import 'package:spnk/views/windows/small/windows.small.common.widgets.dart';

class WindowsSmallContactMeScreen extends StatefulWidget {
  @override
  State<WindowsSmallContactMeScreen> createState() =>
      _WindowsSmallContactMeScreenState();
}

class _WindowsSmallContactMeScreenState
    extends State<WindowsSmallContactMeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool showLottie = false;
  bool showIcons = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        showLottie = true;
        showIcons = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    final screenWidth = context.screenWidth;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.13),
          SectionTitle(screenWidth: screenWidth, title: 'Contact Me'),
          SizedBox(height: screenHeight * 0.13),
          BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
            builder: (context, state) {
              return Column(
                children: state.contactDetailList
                    .map(
                      (e) => ContactDetailsItem(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        icon: e.icon,
                        details: e.details,
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 50),
          Flexible(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: showIcons ? 1 : 0,
              child: Image.asset(
                'assets/images/dash/dash4.png',
                height: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactDetailsItem extends StatelessWidget {
  const ContactDetailsItem({
    required this.screenWidth,
    required this.screenHeight,
    required this.icon,
    required this.details,
  });
  final double screenWidth;
  final double screenHeight;
  final String details;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
      child: FadeInRight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: screenWidth * 0.15),
            Icon(
              icon,
              color: Theme.of(context).splashColor,
            ),
            const SizedBox(width: 20),
            Text(
              details,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
