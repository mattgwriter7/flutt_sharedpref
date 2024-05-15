// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//  this page is Stateful (just to serve as an example)

//  classes
import '../classes/Config.dart';
import '../classes/Cookies.dart';
import '../classes/Utils.dart';
import '../providers/Count.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({super.key});

  @override
  State<Start_Page> createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {

  // (this page) variables
  final String filename = 'Start_Page.dart';

  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log( filename, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));

    setupApp();
  }

  @override
  void dispose() {
    Utils.log( filename, 'dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log( filename, '_buildTriggered()');
  }

  void setupApp() async {
    if ( !Config.app_ready ) {
    
      //  cookie stuff
      Cookies.getStr('today').then((value){
        Utils.log( filename, value );
        Cookies.setStr('today', 'is ok!');
      });
      Cookies.getNum( 'run_count' ).then((value){
        Utils.log( filename, value.toString() );
        value++;
        Cookies.setNum( 'run_count', value );
      });      
      //  app cookie 

      List<String> App = [
        'apple','12/25/2024','true'
      ];
      Cookies.getList('app').then((value){
        Utils.log( filename, value.toString() );
        Cookies.setList('app', App );
      });
    }
  }  


  // addPostFrameCallback" is called after build completed 
  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( filename, '_addPostFrameCallbackTriggered() (build completed)');
  }

  @override
  Widget build(BuildContext context) {
    
    _buildTriggered();
    
    return WillPopScope(
      onWillPop: () async {
        Utils.log( filename, 'pop() forbidden!');
        return false;  //  this allows the back button to work (if true)
      },      
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text( filename ),
            centerTitle: true,
          ), 
          body: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children : 
                [ 
                  ElevatedButton(
                    child: const Text( 'End_Page >>' ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('End_Page');         
                      return;
                    },
                  ),    
                  ElevatedButton(
                    child: const Text( 'Reset' ),
                    onPressed: () {
                      Cookies.reset();         
                      return;
                    },
                  ),  
                  ElevatedButton(
                    child: const Text( 'Show Vals' ),
                    onPressed: () {
                      Cookies.showValues();         
                      return;
                    },
                  ),                                                  
              ],
            ),  
          ),
        ),
      ),
    );
  }
}