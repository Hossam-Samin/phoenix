
import 'package:local_auth/local_auth.dart';

final LocalAuthentication authentication = LocalAuthentication();
class FigureAuth{
  figureAuth()async{
    bool isAvailable = await authentication.canCheckBiometrics;
    print(isAvailable);
    if(isAvailable){
      bool result = await authentication.authenticate(
        localizedReason: 'Scan your figurePrint to proceed',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if(result){
        // Navigator.pushNamed(context, )
      }else{
        print('Permission denied ');
      }
    }else{
      print('No biometric sensor detected');
    }

  }
}
