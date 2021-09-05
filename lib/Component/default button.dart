import 'package:calculator_use_bloc/cubit/Cubit.dart';
import 'package:flutter/material.dart';

Widget defaultButton(
    {required String num,required int flex, Color c = const Color(0xFF616161),required context})
{
  return Expanded(flex: flex,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: c,

        ),
        child: TextButton(onPressed: (){
        AppCubit.get(context).onText(text: num);
        },
            child: Text('$num',style: TextStyle(
            fontSize: 30.0,color: Colors.white,
            ) ),),
      ),
    ),
  );
}