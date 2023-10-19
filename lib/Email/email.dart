import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

sendEmail(BuildContext context //For showing snackbar
    ) async {
  String username = 'alviannowijaya@gmail.com'; //Your Email
  String password =
      'jgsw mfih cflk yqkw'; // 16 Digits App Password Generated From Google Account

  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.

  // Create our message.
  final message = Message()
        ..from = Address(username, 'PetNear')
        ..recipients.add('alviannowijaya@gmail.com')
        ..ccRecipients.addAll([
          'richabellark@gmail.com',
          'xyz@gmail.com'
        ]) // For Adding Multiple Recipients
        // ..bccRecipients.add(Address('a@gmail.com')) For Binding Carbon Copy of Sent Email
        ..subject = 'PetNear - Forgot Password'
        ..text =
            'Hello dear, I am sending you email from Flutter application \n PETNEAR'
      // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>"; // For Adding Html in email
      // ..attachments = [
      //   FileAttachment(File('image.png'))  //For Adding Attachments
      //     ..location = Location.inline
      //     ..cid = '<myimg@3.141>'
      // ]
      ;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Mail Send Successfully")));
  } on MailerException catch (e) {
    print('Message not sent.');
    print(e.message);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
