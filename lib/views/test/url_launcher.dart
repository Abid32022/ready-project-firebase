// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class UrlLauncherHelper {
//   /// Launch WhatsApp with a specific phone number and optional message.
//   static Future<void> launchWhatsApp({required String phoneNumber, String? message}) async {
//     final whatsappUrl = Uri.parse(
//         "https://wa.me/$phoneNumber${message != null ? "?text=${Uri.encodeComponent(message)}" : ""}"
//     );
//
//     if (await canLaunchUrl(whatsappUrl)) {
//       await launchUrl(whatsappUrl);
//     } else {
//       throw 'Could not launch WhatsApp';
//     }
//   }
//
//   /// Make a phone call to the specified phone number.
//   static Future<void> makePhoneCall(String phoneNumber) async {
//     final phoneUrl = Uri.parse("tel:$phoneNumber");
//
//     if (await canLaunchUrl(phoneUrl)) {
//       await launchUrl(phoneUrl);
//     } else {
//       throw 'Could not make phone call';
//     }
//   }
//
//   /// Send an email to the specified email address with optional subject and body.
//   static Future<void> sendEmail({
//     required String emailAddress,
//     String? subject,
//     String? body,
//   }) async {
//     final emailUrl = Uri(
//       scheme: 'mailto',
//       path: emailAddress,
//       query: Uri(queryParameters: {
//         if (subject != null) 'subject': subject,
//         if (body != null) 'body': body,
//       }).query,
//     );
//
//     if (await canLaunchUrl(emailUrl)) {
//       await launchUrl(emailUrl);
//     } else {
//       throw 'Could not send email';
//     }
//   }
//
//   /// Open a website URL in the default browser.
//   static Future<void> openWebsite(String websiteUrl) async {
//     final url = Uri.parse(websiteUrl);
//
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not open website';
//     }
//   }
// }
//
// // // Example Usage
// // void main() {
// //   runApp(MyApp());
// // }
//
// class UrlLauncherScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('URL Launcher Example')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () => UrlLauncherHelper.launchWhatsApp(
//                   phoneNumber: '1234567890',
//                   message: 'Hello from Flutter!',
//                 ),
//                 child: Text('Open WhatsApp'),
//               ),
//               ElevatedButton(
//                 onPressed: () => UrlLauncherHelper.makePhoneCall('03483374071'),
//                 child: Text('Make Phone Call'),
//               ),
//               ElevatedButton(
//                 onPressed: () => UrlLauncherHelper.sendEmail(
//                   emailAddress: 'example@example.com',
//                   subject: 'Hello',
//                   body: 'This is a test email.',
//                 ),
//                 child: Text('Send Email'),
//               ),
//               ElevatedButton(
//                 onPressed: () => UrlLauncherHelper.openWebsite('https://example.com'),
//                 child: Text('Open Website'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
