//
// import 'package:es_flutter_plugin/src/widgets/custom_dialog.dart';
// import 'package:es_flutter_plugin/src/widgets/pay_button.dart';
// import 'package:flutter/material.dart';
//
// import 'input_fields/card_number_input_field.dart';
// import 'company_logo.dart';
// import 'input_fields/cvv_input_field.dart';
// import 'input_fields/expiry_input_field.dart';
//
// class CardPaymentItems extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomAlertDialog(
//         // child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 20.0, left: 15.0, right: 15.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [CompanyLogo(), Text("Pay NGN 100")],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: Text(
//                         "email@email.com",
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CardNumberInputField(),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: CvvInputField(),
//                         ),
//                         SizedBox(
//                           width: 30.0,
//                         ),
//                         Expanded(
//                           child: ExpiryInputField(),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     Container(
//                         alignment: Alignment.center,
//                         child: PayButton()),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }
