import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp({required String phoneNumber, String? message}) async {
  // phoneNumber should include country code, no + or spaces, e.g. "97336123456"
  final encodedMessage = message != null ? Uri.encodeComponent(message) : '';
  final whatsappUrl = Uri.parse(
    'https://wa.me/$phoneNumber${message != null ? '?text=$encodedMessage' : ''}',
  );

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch WhatsApp');
  }
}