import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_config.dart';
import 'package:ttk/src/configs/app_styles.dart';

class CustomRadio extends StatefulWidget {
  final String value;
  final String? selectedValue;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final ValueChanged<String> onSelect;
  final String text;
  final double textFontSize;

  CustomRadio(
      { required this.onSelect,
        required this.value,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor, this.text='I agree with the above terms.', this.textFontSize = 14, this.selectedValue});

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSelect(widget.value);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Transform.scale(
                  scale: 1.0,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: AppColors.white,
                        disabledColor: AppColors.white
                    ),
                    child: Radio<String>(
                      value: widget.value,
                      onChanged: (val) {
                        widget.onSelect(val??'');
                      },
                      groupValue: widget.selectedValue,
                      activeColor: AppColors.white,
                    ),
                  )),
            ),
            SizedBox(width: 8,),
            Text(
              '${widget.text}',
              style: TextStyle(
                fontSize: widget.textFontSize,
                color: AppColors.white,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
