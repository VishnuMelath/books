import 'package:books/utils/themes/color_scemes.dart';
import 'package:flutter/material.dart';

//Text field for normal text field
Widget customTextField({
  required String label,
  required TextEditingController controller,
}) {
  var focusnode = FocusNode();
  ValueNotifier<bool> focusNotifier = ValueNotifier(false);
  focusnode.addListener(
    () {
      focusNotifier.value = focusnode.hasFocus;
    },
  );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ValueListenableBuilder(
          valueListenable: focusNotifier,
          builder: (context, focus, _) {
            return Text(
              label,
              style: TextStyle(
                  color: focus ? lightColorScheme.primary : Colors.black54,
                  fontSize: 12),
            );
          }),
      const SizedBox(height: 5),
      TextFormField(
        cursorHeight: 15,
        cursorColor: lightColorScheme.secondary,
        focusNode: focusnode,
        decoration: InputDecoration(
          hintText: 'Enter your $label',
          isDense: true,
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}

//Text field for password field
Widget customPasswordTextField({
  required String label,
  required TextEditingController controller,
}) {
  var focusnode = FocusNode();
  ValueNotifier<bool> focusNotifier = ValueNotifier(false);
  late ValueNotifier<bool> showPassword = ValueNotifier(false);
  focusnode.addListener(
    () {
      focusNotifier.value = focusnode.hasFocus;
    },
  );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ValueListenableBuilder(
          valueListenable: focusNotifier,
          builder: (context, focus, _) {
            return Text(
              label,
              style: TextStyle(
                  color: focus ? lightColorScheme.primary : Colors.black54,
                  fontSize: 12),
            );
          }),
      const SizedBox(height: 5),
      ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (context, show, _) {
            return TextFormField(
              obscureText: show,
              cursorHeight: 15,
              cursorColor: lightColorScheme.secondary,
              focusNode: focusnode,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    show ? Icons.visibility : Icons.visibility_off_outlined,
                    color: const Color.fromARGB(255, 102, 102, 102),
                  ),
                  onPressed: () {
                    showPassword.value = !show;
                  },
                ),
                hintText: 'Enter your $label',
                isDense: true,
              ),
            );
          }),
      const SizedBox(height: 15),
    ],
  );
}
