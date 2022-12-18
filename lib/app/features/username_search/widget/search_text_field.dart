// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagify/app/features/username_search/username_search.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField(
      {Key? key,
      required this.onSubmit,
      required this.controller,
      this.validatorUpdate,
      this.focus,
      this.nextFocus,
      required this.onChanged})
      : super(key: key);
  final Function(String value) onSubmit, onChanged;
  final TextEditingController controller;
  final bool Function(String)? validatorUpdate;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController textEditingController;
  var _previousText = '';
  late FocusNode focusNode;

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    focusNode = widget.focus ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autocorrect: false,
      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,
      style: GoogleFonts.roboto(fontSize: 12),
      cursorColor: Colors.purple.shade800,
      onChanged: (value) {
        if (widget.validatorUpdate != null) {
          if (widget.validatorUpdate!(value)) {
            widget.onChanged(value);
            _previousText = value;
          } else {
            textEditingController
              ..text = _previousText
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: textEditingController.text.length),
              );
          }
        } else {
          widget.onChanged(value);
          _previousText = value;
        }
        setState(() {});
      },
      decoration: InputDecoration(
          suffixIcon: Padding(
              padding: EdgeInsets.all(12),
              child: (control.text == "")
                  ? IconButton(
                      padding: EdgeInsets.all(1),
                      iconSize: 13,
                      onPressed: () => null,
                      icon: FaIcon(
                        FontAwesomeIcons.search,
                        size: 18,
                        color: Colors.purple.shade800,
                      ),
                    )
                  : IconButton(
                      padding: EdgeInsets.all(1),
                      iconSize: 13,
                      onPressed: () {
                        setState(() {
                          widget.controller.text = "";
                        });
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.close,
                        size: 18,
                        color: Colors.purple.shade800,
                      ),
                    )),
          label: Text(
            "Username",
            style: TextStyle(
              color: Colors.purple.shade800,
            ),
          ),
          contentPadding: EdgeInsets.all(12),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.purple.shade800, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.purple.shade800, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.purple.shade800, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
          )),
      inputFormatters: [FilteringTextInputFormatter.deny("öçşğIü")],
      onFieldSubmitted: (value) => widget.onSubmit(value),
    );
  }
}
