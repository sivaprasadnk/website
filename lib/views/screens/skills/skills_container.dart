import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spnk/domain/entity/skill_details.dart';
import 'package:spnk/utils/extensions/context_extension.dart';

class SkillsContainer extends StatefulWidget {
  const SkillsContainer({
    super.key,
    required this.skillDetails,
  });

  final SkillDetails skillDetails;

  @override
  State<SkillsContainer> createState() => _SkillsContainerState();
}

class _SkillsContainerState extends State<SkillsContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final icon = 'assets/svg/${widget.skillDetails.iconName}.svg';
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: () async {
            // var link = "";
            // if (widget.skillDetails.type == 'mobile') {
            //   final linkList = widget.skillDetails.link.split(',');
            //   if (defaultTargetPlatform == TargetPlatform.android ||
            //       defaultTargetPlatform == TargetPlatform.iOS) {
            //     link = linkList.last.trim();
            //   } else {
            //     link = linkList.first.trim();
            //   }
            // } else {
            //   link = widget.skillDetails.link;
            // }
            // await launchUrl(Uri.parse(link));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: context.isLargeDevice ? 280 : double.infinity,
            height: 205,
            decoration: BoxDecoration(
              color: context.scaffoldColor,
              border: Border.all(
                color: _isHovered || context.isMobileDevice
                    ? context.primaryColor
                    : context.scaffoldColor,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                // Icon(
                //   widget.contactDetails.iconName.iconFromString,
                //   size: 60,
                //   color: context.primaryColor,
                // ),

                SvgPicture.asset(
                  icon,
                  height: 80,
                  width: 80,
                  color: context.primaryColor,
                  // key: UniqueKey(),
                  // onTap: () {},
                  // iconType: context.isLargeDevice
                  //     ? IconType.animatedOnHover
                  //     : IconType.continueAnimation,
                  // height: 60,
                  // width: 60,
                  // color: context.primaryColor,
                  // animateIcon: widget.skillDetails.iconName.iconFromString,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.skillDetails.title,
                  style: context.bodySmall.copyWith(
                    color: context.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
