import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core_shelf.dart';

class CustomDatePicker extends StatefulWidget {
  final String buttonText;
  final TextStyle style;

  const CustomDatePicker({
    Key? key,
    required this.buttonText,
    required this.style,
  }) : super(key: key);
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.lowEdgeInsets,
      child: TextButton(
        style: ButtonStyles(context)
            .roundedStyle(borderRadius: context.lowCircular),
        onPressed: () => _selectDate(context, widget.buttonText, (a) {}),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              selectedDate == null
                  ? widget.buttonText
                  : selectedDate.runtimeType == DateTime
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : "$selectedDate",
              style: widget.style,
              minFontSize: 14,
              maxFontSize: 30,
            ),
            Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: context.width * 5,
                color: context.primaryLightColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, String buttonText,
      void Function(DateTime val) onSelect) async {
    final picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: context.accentColor,
              onPrimary: context.primaryLightColor,
              surface: context.canvasColor,
              onSurface: context.primaryDarkColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: context.headline6.copyWith(fontSize: 16),
                primary: context.primaryLightColor,
              ),
            ),
            dialogBackgroundColor: context.primaryColor,
          ),
          child: child ?? const SizedBox(),
        );
      },
      cancelText: 'cancel'.translate,
      confirmText: 'confirm'.translate,
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.buttonText == 'finish_date'
          ? DateTime.now()
          : DateTime(2015, 8),
      lastDate: widget.buttonText == 'start_date'.translate
          ? DateTime.now()
          : DateTime(2100),
    );
    setState(() {
      selectedDate = picked;
    });
  }
}
