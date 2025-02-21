import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class FlutterTwilioVoice {
  static const MethodChannel _channel =
      const MethodChannel('flutter_twilio_voice');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> makeCall({ @required String accessTokenUrl, @required String to}) async
  {
    assert(accessTokenUrl != null);
    assert(to != null);
    final Map<String, Object> args = <String, dynamic>{"accessTokenUrl" : accessTokenUrl, "to" : to};
    await _channel.invokeMethod('makeCall', args);
  }

  static Future<void> hangUp() async{
    await _channel.invokeMethod('hangUp');
  }

  static Future<void> receiveCalls(String clientIdentifier) async{
    assert(clientIdentifier != null);
    final Map<String, Object> args = <String, dynamic>{"clientIdentifier" : clientIdentifier};
    await _channel.invokeMethod('receiveCalls', args);
  }


  static Future<void> muteCall(bool isMuted) async{
    assert(isMuted != null);
    final Map<String, Object> args = <String, dynamic>{"isMuted" : isMuted};
    await _channel.invokeMethod('muteCall', args);
  }

  static Future<void> toggleSpeaker(bool speakerIsOn) async{
    assert(speakerIsOn != null);
    final Map<String, Object> args = <String, dynamic>{"speakerIsOn" : speakerIsOn};
    await _channel.invokeMethod('toggleSpeaker', args);
  }

}
