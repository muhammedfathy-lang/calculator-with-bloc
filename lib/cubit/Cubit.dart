import 'package:bloc/bloc.dart';
import 'package:calculator_use_bloc/state%20app/State%20app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  double num1=0;
  String textnum1='';
  double num2=0;
  String textnum2='';
  String operator='';
  String Text='';
  double result=0;
  bool checkEqual=false;
  bool checkResult=false;

  void onText({required String text}){

    print('text= $text');
    if((text=='0'||text=='1'||text=='2'||text=='3'||text=='4'||text=='5'||text=='6'||text=='7'||text=='8'||text=='9'||text=='.')
        &&operator=='')
    { clear();}
    if(text=='C'){clear();}
    else  if(textnum1==''&&text=='='&&checkResult==false){ Text='TExT error';}
    else {
      Text += text;
      if (text == '=') {
        print('check when i press = $checkEqual');
        if(checkEqual==true){
          textnum1=result.toString();
          calculateCaseMoreEqual(operator, textnum1, textnum2);
        }
        else
        {
          print('textnum1 $textnum1');
          print('textnum2 $textnum2');
          num1 = double.parse(textnum1);
          num2 = double.parse(textnum2);
          calculate(operator, num1, num2);
        }
      }
      else {
        if (text == '+' || text == '-' || text == '*' || text == '/' || text == '%'|| text == '+/_') {
          if(textnum1==''&&checkResult==true&&checkEqual==false){ Text='error';}
          else if(operator!=''&&checkEqual==false){
            calculateCase3num(operator, textnum1, textnum2);
          }
          operator = text;
        }
        else {
          print ('operator =$operator');
          if (operator == ''&&checkEqual==false)
          {
            if (Text=='error'){Text=text;}
            textnum1 += text;
          }
          else {
            print('check equal = $checkEqual');
            textnum2 += text;
            print('textnum2 = $textnum2');
          }
        }
      }
    }
    emit(AppWriteTextlState());

  }
  void calculate(String operator,double num1,double num2) {
    checkEqual=true;
    if (operator == '*') {result = num1 * num2;}
    else if(operator=='/'){ result=num1/num2;}
    else if(operator=='+'){ result=num1+num2;}
    else if(operator=='-'){ result=num1-num2;}
    else if(operator=='%'){ result=num1%num2;}
    else if(operator=='+/_'){ result=(-1*num1)+num2;}
    checkResult=true;
  Text+=result.toString();
    textnum1='';
    textnum2='';
    this.operator='';
    print('operater = empty');
}
  void calculateCase3num(String operator,String textnum1,String textnum2) {
    num1 = double.parse(textnum1);
    num2 = double.parse(textnum2);
    if (operator == '*') {result = num1 * num2;}
    else if(operator=='/'){ result=num1/num2;}
    else if(operator=='+'){ result=num1+num2;}
    else if(operator=='-'){ result=num1-num2;}
    else if(operator=='%'){ result=num1%num2;}
    else if(operator=='+/_'){ result=(-1*num1)+num2;}
    checkResult=true;
    this.textnum1='';
    this.textnum2='';
    this.operator='';
    print('result =$result');
    this.textnum1=result.toString();
}
  void calculateCaseMoreEqual(String operator,String textnum1,String textnum2) {
    num1 = double.parse(textnum1);
    num2 = double.parse(textnum2);
    if (operator == '*') {result = num1 * num2;}
    else if(operator=='/'){ result=num1/num2;}
    else if(operator=='+'){ result=num1+num2;}
    else if(operator=='-'){ result=num1-num2;}
    else if(operator=='%'){ result=num1%num2;}
    else if(operator=='+/_'){ result=(-1*num1)+num2;}
    checkResult=true;
    this.textnum1='';
    this.textnum2='';
    this.operator='';
    print('result =$result');
    this.textnum1=result.toString();
    Text+=result.toString();
}

  void clear() {
    result=0;
    num1=0;
    num2=0;
    textnum1='';
    textnum2='';
    operator='';
    Text='';
    checkEqual=false;
    checkResult=false;

  }
}