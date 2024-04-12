import 'package:color_picker_field/color_picker_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ColorPicker());
}

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    List<Color> colorList = <Color>[];
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void onChanged(List<Color> colors) {
      formKey.currentState!.validate();
    }

    void onSaved(List<Color>? colors) {
      debugPrint('onSaved $colors');

      setState(() {
        colorList = colors!;
      });
    }

    return MaterialApp(
        //IG : @hosivay
        //Site : FlutterZone.ir
        home: Scaffold(
            body: Center(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: ColorPickerFormField(
          initialValue: colorList,
          defaultColor: Colors.blue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(fontSize: 30),
          decoration: const InputDecoration(
            labelText: 'Colors ',
            helperText: 'helper Text',
          ),
          validator: (List<Color>? value) {
            if (value!.isEmpty) {
              return 'a minimum of 1 color is required';
            }
            return null;
          },
          onChanged: onChanged,
          onSaved: onSaved,
        ),
      ),
    )));
  }
}
