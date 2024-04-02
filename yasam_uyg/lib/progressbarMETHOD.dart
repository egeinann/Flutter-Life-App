import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

LinearPercentIndicator progressbarMETHOD(Color renk, double deger) {
  return LinearPercentIndicator(
    width: 280.0,
    lineHeight: 20,
    percent: deger,
    progressColor: renk,
  );
}