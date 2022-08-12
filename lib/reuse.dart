import 'package:flutter/material.dart';

Container Button(BuildContext context,IconData icon,String text ,Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 40,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.amber
    ),
    child: Row(

      children: [
        IconButton(
          enableFeedback: false,
          icon: Icon(icon), onPressed: (){
          onTap();
        },),
        TextButton(
          onPressed: () {
          onTap();
        },
        child: Text(text, style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),),
        style: ButtonStyle(
        ),
        )
      ],
    ),
  );
}

Image logoWidget(String imagename){
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
    width: 180,
    height: 180,
  );
}
