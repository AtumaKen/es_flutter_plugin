import 'package:es_flutter_plugin/src/utilities/package_strings.dart';
import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Image(
          image: AssetImage(("assets/images/easyswitch_icon.png"),
              package: Strings.packageName)),
    );
  }
}
