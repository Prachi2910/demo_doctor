import 'package:demo_doctor/constant/colors.constants.dart';
import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/constant/misc.constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextfield extends StatefulWidget {
  final TextFieldOption textOption;
  final Function(String text) textCallback;
  final VoidCallback? tapCallback;
  final VoidCallback? onNextPress;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool showUnderLine;
  final bool? enable;
  final bool autoCorrect;
  final bool filled;
  final Key? textKey;
  final TextAlign? textAlign;

  CommonTextfield(
      {required this.textOption,
      required this.textCallback,
      required this.textKey,
      this.tapCallback,
      this.onNextPress,
      this.inputAction,
      this.focusNode,
      this.showUnderLine = true,
      this.enable = true,
      this.autoCorrect = true,
      this.textAlign,
      this.filled = false});

  @override
  _CommonTextfieldState createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  bool obscureText = false;
  IconData obscureIcon = Icons.visibility;

  @override
  void initState() {
    super.initState();

    obscureText = widget.textOption.isSecureTextField ?? false;
  }

  @override
  void didUpdateWidget(CommonTextfield oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.textKey,
      autocorrect: widget.autoCorrect,
      enabled: widget.enable,
      maxLines: widget.textOption.maxLine,
      textInputAction: widget.inputAction ?? TextInputAction.done,
      focusNode: widget.focusNode ?? null,
      controller: widget.textOption.inputController ?? null,
      obscureText: this.obscureText,
      style: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      keyboardType: widget.textOption.keyboardType ?? TextInputType.text,
      cursorColor: Colors.indigo,
      inputFormatters: widget.textOption.formatter ?? [],
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: widget.filled ? Colors.white : Colors.transparent,
        enabledBorder: widget.showUnderLine == true
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(kCardRadiusSmall),
                borderSide: BorderSide(color: Colors.grey.shade500))
            : UnderlineInputBorder(
                borderRadius: BorderRadius.circular(kCardRadiusSmall),
                borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: widget.showUnderLine == true
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(kCardRadiusSmall),
                borderSide: BorderSide(color: Colors.grey.shade500))
            : UnderlineInputBorder(
                borderRadius: BorderRadius.circular(kCardRadiusSmall),
                borderSide: BorderSide(color: Colors.transparent)),
        labelStyle: TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
        labelText: widget.textOption.labelText,
        hintText: widget.textOption.hintText,
        hintStyle: TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
        prefixIcon: widget.textOption.prefixWid,
        prefixIconConstraints: BoxConstraints(),
        suffixIcon: (widget.textOption.suffixWid != null)
            ? widget.textOption.suffixWid
            : (widget.textOption.isSecureTextField != null &&
                    widget.textOption.isSecureTextField!)
                ? IconButton(
                    icon: Icon(
                      obscureIcon,
                      color: Colors.grey.withOpacity(.8),
                    ),
                    onPressed: () {
                      setState(() {
                        this.obscureText = !this.obscureText;
                        if (this.obscureText) {
                          this.obscureIcon = Icons.visibility;
                        } else {
                          this.obscureIcon = Icons.visibility_off;
                        }
                      });
                    },
                  )
                : widget.textOption.type == TextFieldType.DropDown
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        onPressed: () {},
                      )
                    : widget.textOption.type == TextFieldType.DateTime
                        ? IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            onPressed: () {},
                          )
                        : null,
      ),
      onSubmitted: (String text) {
        this.widget.textCallback(text);
        setFocus(context: context);
        if (widget.onNextPress != null) {
          widget.onNextPress!();
        }
      },
      onChanged: (String text) {
        this.widget.textCallback(text);
      },
      onEditingComplete: () {
        this.widget.textCallback(widget.textOption.inputController!.text);
      },
    );
  }
}

class TextFieldOption {
  String? text = "";
  String? labelText;
  String? hintText;
  bool? isSecureTextField = false;
  TextInputType? keyboardType;
  TextFieldType type;
  int maxLine;
  int maxLength;
  Widget? prefixWid;
  Widget? suffixWid;
  List<TextInputFormatter>? formatter;
  TextEditingController? inputController;

  TextFieldOption(
      {this.text,
      this.labelText,
      this.hintText,
      this.isSecureTextField,
      this.keyboardType,
      this.type = TextFieldType.Normal,
      this.maxLine = 1,
      this.maxLength = 200,
      this.formatter,
      this.inputController,
      this.prefixWid,
      this.suffixWid});
}

enum TextFieldType {
  Normal,
  DropDown,
  DateTime,
}
