part of 'clac_bmi_cubit.dart';

@immutable
sealed class ClacBmiState {}

final class BmiInitial extends ClacBmiState {}

final class Bmiloaded extends ClacBmiState {}

final class Bmisuccess extends ClacBmiState {
  // final BmiModel bmimodel;

  // Bmisuccess(this.bmimodel);
}

final class Bmifailed extends ClacBmiState {
  String? errmessage;
  Bmifailed({required this.errmessage});
}
