import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signupapp/userdata.dart';

class Confirmation extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          children:[
            _username(context),
          ]

      ),
    );
  }

  Widget _username(BuildContext context){
    var lastname = context.select((UserData ud) => ud.lastname);
    var firstname = context.select((UserData ud)=> ud.firstname);

    return Row(
        children:[
          Expanded(child:Text('本人氏名'),flex:2),
          Expanded(
            flex: 4,
            child:Row(
              children:[
                Expanded(child:Text('姓'),flex:1),
                Expanded(child:Text('$lastname'),flex:3),
            ]),
          ),
          Expanded(
            flex: 4,
            child:Row(
                children:[
                  Expanded(child:Text('名'),flex:1),
                  Expanded(child:Text('$firstname'),flex:3),
                ]),
          ),
         Expanded(
           flex:1,
           child: ElevatedButton(
              child: const Text('修正'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return AlertDialog(
                      title: Text("以下の情報を修正してください"),
                      content: Text("本人氏名"),
                      actions: [
                        TextField(
                            decoration: const InputDecoration(
                              hintText: ('姓'),
                            ),
                            onChanged:(text){
                              context.read<UserData>().getlastname(text);
                            }
                        ),
                        TextField(
                            decoration: const InputDecoration(
                              hintText: ('名'),
                            ),
                            onChanged:(text){
                              context.read<UserData>().getfirstname(text);
                            }
                        ),
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
              );
            },
          ),
         ),
        ]
    );
  }

}
