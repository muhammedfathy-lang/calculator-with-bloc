import 'package:calculator_use_bloc/cubit/Cubit.dart';
import 'package:calculator_use_bloc/state%20app/State%20app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Component/default button.dart';

void main(){
  runApp(Calculator());
}
class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) =>AppCubit(),
        child: BlocConsumer<AppCubit,AppState>(
          listener: (BuildContext context, Object? state) {  },
          builder: (BuildContext context, state)
          {
            var Cubit=AppCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text('Calculator ',
                  style: TextStyle( fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('${Cubit.Text}',style: TextStyle(
                          fontSize: 40,color:Colors.white,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),

                  Expanded(flex: 2,
                    child: Row(
                        children:[
                          defaultButton( num:'C', flex: 1,c: const Color(0xFF9E9E9E), context: context),
                          defaultButton(num: '+/_', flex: 1,c: const Color(0xFF9E9E9E), context: context),
                          defaultButton(num: '%', flex: 1,c: const Color(0xFF9E9E9E), context: context),
                          defaultButton(num: '/', flex: 1,c: const Color(0xFFFF9800), context: context),

                        ]
                    ),
                  ),
                  Expanded(flex: 2,
                    child: Row(

                        children:[
                          defaultButton( num:'7', flex: 1, context: context),
                          defaultButton(num: '8', flex: 1, context: context),
                          defaultButton(num: '9', flex: 1, context: context),
                          defaultButton(num: '*', flex: 1,c: const Color(0xFFFF9800), context: context),

                        ]
                    ),
                  ),
                  Expanded(flex: 2,
                    child: Row(

                        children:[
                          defaultButton( num:'4', flex: 1, context: context),
                          defaultButton(num: '5', flex: 1, context: context),
                          defaultButton(num: '6', flex: 1, context: context),
                          defaultButton(num: '-', flex: 1,c: const Color(0xFFFF9800), context: context),

                        ]
                    ),
                  ),
                  Expanded(flex: 2,
                    child: Row(

                        children:[
                          defaultButton( num:'1', flex: 1, context: context),
                          defaultButton(num: '2', flex: 1, context: context),
                          defaultButton(num: '3', flex: 1, context: context),
                          defaultButton(num: '+', flex: 1,c: const Color(0xFFFF9800), context: context),

                        ]
                    ),
                  ),
                  Expanded(flex: 2,
                    child: Row(
                        children:[
                          defaultButton( num:'0', flex: 2, context: context),
                          defaultButton(num: '.', flex: 1, context: context),
                          defaultButton(num: '=', flex: 1,c: const Color(0xFFFF9800), context: context),

                        ]
                    ),
                  ),
                ],
              )
          );
          },


        ),
      ),
    );
  }

}