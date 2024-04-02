import 'package:yasam_uyg/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 80 + _userData.yapilanspor - _userData.icilensigara;
    if (_userData.seciliCinsiyet == "FEMALE") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
