import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spnk/provider/dialog_provider.dart';
import 'package:spnk/views/windows/hover_extensions.dart';

class DialogCloseButton extends StatelessWidget {
  const DialogCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 15,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            Provider.of<DialogProvider>(context, listen: false)
                .updateDialogOpenStatus(status: false);
            Navigator.pop(context);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: const Icon(
              Icons.close,
              size: 18,
              color: Colors.white,
            ).showCursorOnHover,
          ),
        ),
      ),
    );
  }
}
