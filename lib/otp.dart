library flutter_otp;

import 'dart:math';
import 'package:sms/sms.dart';



class FlutterOtp {
  int _otp, _minOtpValue, _maxOtpValue;
  void generateOtp([int min = 1000, int max = 9999]) {
    _minOtpValue = min;
    _maxOtpValue = max;
    _otp = _minOtpValue + Random().nextInt(_maxOtpValue - _minOtpValue);
  }

  void sendOtp(String phoneNumber,
      [String messageText,
      int min = 1000,
      int max = 9999,
      String countryCode = '+1']) {
    generateOtp(min, max);
    SmsSender sender = new SmsSender();
    String address = (countryCode ?? '+1') +
        phoneNumber;

    sender.sendSms(new SmsMessage(
        address, (messageText ?? 'Your OTP is : ') + _otp.toString()));
  }
  bool resultChecker(int enteredOtp) {
    return enteredOtp == _otp;
  }
}
