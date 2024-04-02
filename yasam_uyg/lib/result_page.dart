import 'package:flutter/material.dart';
import 'package:yasam_uyg/constantsSTYLE.dart';
import 'package:yasam_uyg/progressbarMETHOD.dart';
import 'package:yasam_uyg/user_data.dart';
import 'package:yasam_uyg/hesap.dart';
import 'package:percent_indicator/percent_indicator.dart'; // progressBar

class sonucSayfasi extends StatelessWidget {
  final UserData _userData;
  sonucSayfasi(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 38, 171),
        title: const Center(
          child: Text(
            "RESULT PAGE",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 25),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    // egzersiz yapma oranı progressbar
                    Text(
                        "Exercise rate                                     %${(_userData.yapilanspor / 7 * 100).toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.white,
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    progressbarMETHOD(const Color.fromARGB(255, 29, 147, 27),
                        _userData.yapilanspor / 7),
                    const SizedBox(height: 20),
                    // içilen sigara oranı progressbar
                    Text(
                      "Rate of cigarettes smoked              %${(_userData.icilensigara / 40 * 100).toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.white,
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    progressbarMETHOD(const Color.fromARGB(255, 175, 39, 12),
                        _userData.icilensigara / 40),
                    const SizedBox(height: 20),
                    //boy kilo endeksi progressbar
                    bmiGosterici(), //text gerekli text methodu aşağıda
                    LinearPercentIndicator(
                      width: 280.0,
                      lineHeight: 20,
                      percent: _calculateBMIProgress(_userData.bmi), // gerekli method aşağıda
                      progressColor: const Color.fromARGB(255, 55, 26, 184),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("Estimated life expectancy", style: metinStilleri),
                const SizedBox(height: 10),
                Text(
                  Hesap(_userData).hesaplama().round().toString() + " years",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 230, 199, 248),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 230, 191, 253), // Arka plan rengi
                    elevation: 20, // Gölge efekti
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // Kenar yuvarlaklığı
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Go back", style: metinStilleri),
                ),
                const SizedBox(height: 10)
              ],
            ),
          )
        ],
      ),
    );
  }

  // bmi text methodu için hesaplama
  Widget bmiGosterici() {
    String bmiMetni;
    _userData.bmi =_userData.kilo / ((_userData.boy / 100.0) * (_userData.boy / 100.0));
    ; // boy kilo endeks bmi
    if (_userData.bmi < 18.5) {
      bmiMetni = "BMI status is low                           ${_userData.bmi.toStringAsFixed(1)}";
    } else if (_userData.bmi < 25) {
      bmiMetni = "BMI status is normal                     ${_userData.bmi.toStringAsFixed(1)}";
    } else if (_userData.bmi < 30) {
      bmiMetni = "BMI status overweight                  ${_userData.bmi.toStringAsFixed(1)}";
    } else {
      bmiMetni = "BMI status obese                   ${_userData.bmi.toStringAsFixed(1)}";
    }

    return Text(
      bmiMetni,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  // bmi progressbar hesaplama aracı methodu
  double _calculateBMIProgress(double bmi) {
    if (bmi < 18.5) {
      return 0.25; // BMI çok düşük, yüzde 25
    } else if (bmi < 25) {
      return 0.50; // BMI normal, yüzde 50
    } else if (bmi < 30) {
      return 0.75; // BMI fazla kilolu, yüzde 75
    } else {
      return 1.0; // BMI obez, yüzde 100
    }
  }
}
