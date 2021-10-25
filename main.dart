import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signupapp/conf.dart';
import 'package:signupapp/userdata.dart';


void main(){
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create:(_) => UserData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/': (context)=> EnterPage(),
        '/conf': (context) => Confirmation(),
      }
    );
  }
}

class EnterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var lastname = context.select((UserData ud)=> ud.lastname);
    var firstname = context.select((UserData ud)=> ud.firstname);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children:[
          _username(context),
          Center(
            child: ElevatedButton(
              child: const Text('確認画面へ'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/conf');
              },
            ),
          ),
        ]
      )

    );
  }

  Widget _username(BuildContext context) {
    return Row(
        children: [
          const Expanded(
            flex: 3,
            child: Text('氏名'),
          ),
          Expanded(
            flex: 5,
            child: Row(
                children: [
                  const Text('姓'),
                  Expanded(
                    child:TextField(
                      decoration: const InputDecoration(
                        hintText: ('姓'),
                      ),
                      onChanged: (text) {
                        context.read<UserData>().getlastname(text);
                      }
                    ),
                  ),
                ]
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
                children: [
                  const Text('名'),
                  Expanded(
                    child:TextField(
                      decoration: const InputDecoration(
                        hintText: ('名'),
                      ),
                      onChanged: (text) {
                        context.read<UserData>().getfirstname(text);
                      }
                    ),
                  ),
                ]
            ),
          ),
        ]
    );
  }

}

