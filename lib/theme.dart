import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle regularBody(BuildContext context, {Color? cuscolor}) {
    return GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: cuscolor ?? Colors.black,
    );
  }

  static TextStyle regularBodyLight(BuildContext context, {Color? cuscolor}) {
    return GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: cuscolor ?? Color(0xff767676),
    );
  }

  static TextStyle heading(BuildContext context, {Color? cuscolor}) {
    return GoogleFonts.nunito(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: cuscolor ?? Colors.black,
    );
  }

  static TextStyle Nameheading(BuildContext context, {Color? cuscolor}) {
    return GoogleFonts.montserrat(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: cuscolor ?? Colors.black,
    );
  }
}
