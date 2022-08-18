import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalDeviceAuthentication {
  static final LocalAuthentication auth = LocalAuthentication();
  static late bool canAuthenticate;
  static late bool fingerprintAvailable;

  static authInit() async {
    canAuthenticate = await checkAuth();
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    fingerprintAvailable =
        availableBiometrics.contains(BiometricType.fingerprint);
  }

  static Future<bool> checkAuth() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    return canAuthenticate;
  }
}