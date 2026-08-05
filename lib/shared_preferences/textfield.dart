import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final TextEditingController any;

  const Textfields({
    super.key, 
    required this.any,
  });
  
  @override
  Widget build(BuildContext context){
    return TextField(
       controller: any,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.2,
                  style: BorderStyle.solid,
                ),
              ),
            ),

    );
  }

}

class Btn extends StatelessWidget{
  VoidCallback? method ;
  String name;

  Btn({
    super.key,
    required this.method,
    required this.name,
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed: method, child: Text(name));

  }
}