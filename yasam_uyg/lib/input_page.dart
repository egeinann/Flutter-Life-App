import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_uyg/cinsiyetMETHOD.dart';
import 'package:yasam_uyg/constantsSTYLE.dart';
import 'package:yasam_uyg/containersMETHOD.dart';
import 'package:yasam_uyg/result_page.dart';
import 'package:yasam_uyg/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = ""; // cinsiyet row 4
  double icilensigara = 0.0; // slider row 3
  double yapilanspor = 0.0; // slider row 2
  int boy = 170; // HEIGHTkilo row 1
  int kilo = 60; // HEIGHTkilo row 1
  double bmi = 27.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 38, 171),
        title: const Text(
          'LIFE QUALITY',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // yatayda beyaz columnların HEIGHTu hep aynı kalacak esneyecek
        children: [
          // ROW 1                                                              HEIGHT kilo seçimleri
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Containers(
                    child: outlineButtonRowu("HEIGHT"),
                  ),
                ),
                Expanded(
                  child: Containers(
                    child: outlineButtonRowu("WEIGHT"),
                  ),
                ),
              ],
            ),
          ),
          // ROW 2                                                              yapilan spor
          Expanded(
            child: Containers(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // container içindeki herşeyi center'la
                children: [
                  Text("How many days a week do you exercise ?",
                      style: metinStilleri),
                  const SizedBox(height: 5),
                  Text("${yapilanspor.round()}", style: gostergeSayiStilleri),
                  Slider(
                    // slider sürüklemeli widget
                    min: 0,
                    max: 7,
                    divisions: 7, // 7 ye böl
                    value:
                        yapilanspor, // değeri icilen sigara adlı double den al
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanspor =
                            newValue; // değişken = newValue(yeni değer)
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // ROW 3                                                              kaç adet sigara
          Expanded(
            child: Containers(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // container içindeki herşeyi center'la
                children: [
                  Text("How much do you smok per day ?", style: metinStilleri),
                  const SizedBox(height: 5),
                  Text("${icilensigara.round()}", style: gostergeSayiStilleri),
                  Slider(
                    // slider sürüklemeli widget
                    min: 0,
                    max: 40,
                    value:
                        icilensigara, // değeri icilen sigara adlı double den al
                    onChanged: (double newValue) {
                      setState(() {
                        icilensigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          // ROW 4                                                              cinsiyet seçimleri
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Containers(
                    tiklababa: () {
                      setState(() {
                        if (seciliCinsiyet == "FEMALE") {
                          seciliCinsiyet = ""; // Seçimi kaldır
                        } else {
                          seciliCinsiyet = "FEMALE";
                        }
                      });
                    },
                    renk: seciliCinsiyet == "FEMALE"
                        ? const Color.fromARGB(255, 173, 49, 215)
                        : const Color.fromARGB(255, 243, 254, 255),
                    child: const IconCinsiyet(
                      cinsiyetbilgisi: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: Containers(
                    tiklababa: () {
                      setState(() {
                        if (seciliCinsiyet == "MALE") {
                          seciliCinsiyet = ""; // Seçimi kaldır
                        } else {
                          seciliCinsiyet = "MALE";
                        }
                      });
                    },
                    renk: seciliCinsiyet == "MALE"
                        ? const Color.fromARGB(255, 101, 183, 234)
                        : const Color.fromARGB(255, 243, 254, 255),
                    child: const IconCinsiyet(
                      cinsiyetbilgisi: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          //                                                                    hesapla button
          SizedBox(
            width: 150, // Genişlik değeri
            height: 60, // Yükseklik değeri
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:
                    const Color.fromARGB(255, 230, 191, 253), // Arka plan rengi
                elevation: 20, // Gölge efekti
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // Kenar yuvarlaklığı
                ),
              ),
              onPressed: () {
                if (seciliCinsiyet != "FEMALE" && seciliCinsiyet != "MALE") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    // HATA MESAJI SNACAKBAR
                    const SnackBar(
                      content: Text('PLEASE SELECT GENDER',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      duration:
                          Duration(seconds: 2), // SnackBar'ın gösterim süresi
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sonucSayfasi(
                        UserData(
                          boy: boy,
                          icilensigara: icilensigara,
                          kilo: kilo,
                          seciliCinsiyet: seciliCinsiyet,
                          yapilanspor: yapilanspor,
                          bmi: bmi,
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Text("SHOW", style: metinStilleri),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Row outlineButtonRowu(String label) {
    // HEIGHT kilo içerisindeki frontEnd kodlar
    return Row(
      children: [
        const SizedBox(width: 5),
        RotatedBox(
          quarterTurns: -1,
          child: Text(label, style: metinStilleri),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(label == "HEIGHT" ? boy.toString() : kilo.toString(),
              style: gostergeSayiStilleri),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: const Color.fromARGB(255, 48, 4, 95), // Butonun metin rengi
                side: const BorderSide(
                  color: Color.fromARGB(255, 121, 98, 146), // Kenarlık rengi
                  width: 3.0, // Kenarlık genişliği
                ),
              ),
              child: const Icon(FontAwesomeIcons.plus, size: 25),
              onPressed: () {
                setState(() {
                  label == "HEIGHT" ? boy++ : kilo++;
                });
              },
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: const Color.fromARGB(255, 48, 4, 95), // Butonun metin rengi
                side: const BorderSide(
                  color: Color.fromARGB(255, 121, 98, 146), // Kenarlık rengi
                  width: 3.0, // Kenarlık genişliği
                ),
              ),
              child: const Icon(FontAwesomeIcons.minus, size: 25),
              onPressed: () {
                setState(() {
                  label == "HEIGHT" ? boy-- : kilo--;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
