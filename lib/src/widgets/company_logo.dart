import 'package:es_flutter_plugin/src/utilities/package_strings.dart';
import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  final Widget logo;
  final String logoUrl;

  const CompanyLogo({this.logo, this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: _logo(),
    );
  }

  Widget _logo() {
    if (logo != null)
      return logo;
    // else if (logoUrl.isNotEmpty)
    //   return Image(image: NetworkImage(logoUrl));
    else
      return Image(
          image: AssetImage(("assets/images/easyswitch_icon.png"),
              package: Strings.packageName));
  }
}
