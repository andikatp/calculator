import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:function_tree/function_tree.dart';

class CalculationBloc extends Cubit<CalculationState> {
  CalculationBloc() : super(CalculationState(dataList: ['0']));
  String prevData = ' ';
  List<String> _dataList = ['0'];
  bool isSign = false;
  bool isResult = false;

  String get data => _dataList.join(' ');

  String get equation => data
      .replaceAll('\u00F7', '/')
      .replaceAll('\u00D7', '*')
      .replaceAll('\u2212', '-');

  //Put number on Screen
  void typeNumber(String number) {
    if (isResult || (_dataList.length == 1 && _dataList.last == '0')) {
      _dataList = [number];
      isResult = false;
    } else if (isSign) {
      _dataList.add(number);
      isSign = false;
    } else if (_dataList.last.startsWith('(')) {
      final temp = _dataList.last.substring(0, _dataList.last.length - 1);
      _dataList.last = '$temp$number';
    } else {
      _dataList.last += number;
    }
    emit(CalculationState(dataList: _dataList));
  }

  //show result above input text
  void _showResult() {
    prevData = data;
    final result = equation.interpret();
    _dataList = [
      result % 1 == 0 ? result.toInt().toString() : result.toString()
    ];
    isResult = true;
    emit(CalculationState(dataList: _dataList));
  }

  //clear all data
  void _clear() {
    _dataList = ['0'];
    prevData = ' ';
    isSign = false;
    emit(CalculationState(dataList: _dataList));
  }

  //put decimal on number
  void _decimalPoint() {
    if (_dataList.last.contains('.')) {
      return;
    }
    if (isSign) {
      _dataList.add('0');
      isSign = false;
    }
    if (_dataList.last.startsWith('(')) {
      final temp = _dataList.last.substring(0, _dataList.last.length - 1);
      _dataList.last = '$temp.)';
    } else {
      _dataList.last += '.';
    }
  }

  //percentage function
  void _percentage() {
    if (isSign) {
      return;
    }

    final result = _dataList.last.interpret() * 0.01;
    _dataList.last = result < 0 ? '($result)' : result.toString();
  }

  //negation function
  void _negation() {
    if (isSign) {
      return;
    }
    if (_dataList.last.startsWith('(')) {
      _dataList.last = _dataList.last.substring(2, _dataList.last.length - 1);
    } else if (_dataList.last.startsWith('-')) {
      _dataList.last = '(${_dataList.last})';
    } else {
      _dataList.last = '(-${_dataList.last})';
    }
  }

  //case to calculate
  void addSign(String sign) {
    isResult = false;

    switch (sign) {
      case '+/\u2212':
        _negation();
        break;
      case '%':
        _percentage();
        break;
      case '.':
        _decimalPoint();
        break;
      case 'C':
        _clear();
        break;
      case '=':
        _showResult();
        break;
      default:
        if (isSign) {
          _dataList.last = sign;
        } else {
          _dataList.add(sign);
          isSign = true;
        }
        break;
    }
    emit(CalculationState(dataList: _dataList));
  }
}

class CalculationState {
  List<String> dataList = ['0'];

  CalculationState({required this.dataList});
}
