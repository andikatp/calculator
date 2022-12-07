import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationBloc extends Cubit<int> {
  CalculationBloc() : super(0);
  List<String> dataList = ['0'];
  String prevData = '';

  bool isSign = false;
  bool isResult = false;
  
}
