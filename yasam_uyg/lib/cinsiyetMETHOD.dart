import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_uyg/constantsSTYLE.dart';

class IconCinsiyet extends StatelessWidget {
  final String cinsiyetbilgisi;
  final IconData icon;

  const IconCinsiyet({
    Key? key,
    this.cinsiyetbilgisi = "MALE", // Varsayılan olarak "Kadın" atandı
    this.icon = FontAwesomeIcons.venus, // Varsayılan olarak FontAwesomeIcons.venus atandı
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: const Color.fromARGB(255, 50, 50, 50),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          cinsiyetbilgisi,
          style: metinStilleri
        ),
      ],
    );
  }
}