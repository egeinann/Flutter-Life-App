// Nesne içerisinde kapsüleme
class UserData{
  String seciliCinsiyet; // cinsiyet row 4
  double icilensigara; // slider row 3
  double yapilanspor; // slider row 2
  int boy; // HEIGHT boy row 1
  int kilo; // WEIGHT kilo row 1
  double bmi; // boy kilo endeks

  // constructor
  UserData({required this.boy,required this.icilensigara,required this.kilo,required this.seciliCinsiyet,required this.yapilanspor,required this.bmi});
}