import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://jsonplaceholder.typicode.com/posts

void main() async {
  List _data = await getJSON();
  //print(" data is  $__data");
//  for (var i = 0; i> _data.length ; i++ )
//    {
//      print("title ${_data[i]["title"]}");
//    }

  runApp(new MaterialApp(
    home: new Scaffold(
        appBar: new AppBar(
          title: Text("json Parsing"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: new ListView.builder(

            itemCount: _data.length,
            padding: const EdgeInsets.all(12.5),
            itemBuilder: (BuildContext context, int position) {
              return Column(
                children: <Widget>[

                  Divider(
                    height: 15.5,
                    color: Colors.black12,
                  ),
                  Ink(
                    color: Colors.white70,
                    child: ListTile(


                      title: Text(" ${_data[position]["id"].toString()}  ${_data[position]["title"]}",style:
                        TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15.2,

                        ),),
                      subtitle: Text(_data[position]["body"]),
                      leading: CircleAvatar(
                        child: Text(_data[position]["title"][0]),
                        radius: 40.0,
                      ),
                      onTap:()=> Showmssgtap(context,_data[position]["title"]),
                    ),
                  )
                ],
              );
            })),
  ));
}

void Showmssgtap(BuildContext context,String message) async{
   var alertbox = new AlertDialog(
     title: Text(message),
     actions: <Widget>[
       FlatButton(
           onPressed: ()=>Navigator.pop(context),
           child: Text("Ok"))
       
     ],

     
   );

   showDialog(context: context, builder: (context){
     return alertbox;
   });

}

Future<List> getJSON() async {
  String apiURl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiURl);

  return json.decode(response.body);
}
