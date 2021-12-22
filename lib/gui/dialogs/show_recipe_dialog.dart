import 'package:flutter/material.dart';


class ShowRecipe{
  final String title;
  final String category;
  const ShowRecipe({required this.title,required this.category});

  static dialog(String title, String category,BuildContext context){
    showDialog(
        context:context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            ),
            child: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white70,
                      child: Image.network("http://cdn.shopify.com/s/files/1/0503/8522/3842/files/OWG_Logo_red_d4bf00d0-ea58-46ab-99ee-d170c2524837_1024x.png?v=1622017445"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                      child: SizedBox.expand(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(category,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text("Rezept $title",
                                style:const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              RaisedButton(
                                color: Colors.white,
                                child:const Text('Schliessen'),
                                onPressed: ()=> {
                                  Navigator.of(context).pop()
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
