import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final Color renk; // parametre değişken
  final Widget? child; // child değişkeni nullable yapıldı
  final Function? tiklababa; // Nullable fonksiyon

  const Containers({
    Key? key,
    this.tiklababa,
    this.renk = const Color.fromARGB(255, 243, 254, 255), // parametreyi kullanma izni ve Varsayılan olarak beyaz renk atandı
    this.child, // child parametresi eklendi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tiklababa != null ? () => tiklababa!() : () {}, // Null-check ile tiklababa fonksiyonunu kontrol ediyoruz
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: renk, // Burada renk parametresini kullanıyoruz.
        ),
        child: child,
      ),
    );
  }
}
