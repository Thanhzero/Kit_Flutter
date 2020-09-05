import 'package:url_launcher/url_launcher.dart';

class CallAndMessageViewModel {
  void call(String number) => launch('tell://$number');
  void sendSms(String number) => launch('sms:$number');
}