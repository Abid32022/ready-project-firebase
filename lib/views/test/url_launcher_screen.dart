import 'package:flutter/material.dart';
import '../../utils/helper/url-launcher.dart';

class UrlLauncherScreen extends StatefulWidget {

  @override

  State<UrlLauncherScreen> createState() => _UrlLauncherScreenState();

}



class _UrlLauncherScreenState extends State<UrlLauncherScreen> {

  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher Demo'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: Column(

          children: [

            TextField(

              controller: _whatsappController,

              decoration: InputDecoration(

                labelText: 'WhatsApp Number',

                hintText: 'Enter number without +',

                border: OutlineInputBorder(),

              ),

            ),

            SizedBox(height: 10),

            ElevatedButton(

              onPressed: () {

                UrlLauncher.whatsapp(_whatsappController.text);

              },

              child: Text('Launch WhatsApp'),

            ),

            SizedBox(height: 20),

            TextField(

              controller: _phoneController,

              decoration: InputDecoration(

                labelText: 'Phone Number',

                hintText: 'Enter phone number',

                border: OutlineInputBorder(),

              ),

            ),

            SizedBox(height: 10),

            ElevatedButton(

              onPressed: () {

                UrlLauncher.phoneCall(_phoneController.text);

              },

              child: Text('Make Phone Call'),

            ),

            SizedBox(height: 20),

            TextField(

              controller: _emailController,

              decoration: InputDecoration(

                labelText: 'Email Address',

                hintText: 'Enter email address',

                border: OutlineInputBorder(),

              ),

            ),

            SizedBox(height: 10),

            ElevatedButton(

              onPressed: () {

                UrlLauncher.email(_emailController.text);

              },

              child: Text('Send Email'),

            ),

            SizedBox(height: 20),

            TextField(

              controller: _websiteController,

              decoration: InputDecoration(

                labelText: 'Website URL',

                hintText: 'Enter website URL',

                border: OutlineInputBorder(),

              ),

            ),

            SizedBox(height: 10),

            ElevatedButton(

              onPressed: () {

                UrlLauncher.websiteUrl(_websiteController.text);

              },

              child: Text('Open Website'),

            ),

          ],

        ),

      ),

    );

  }

}