import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/gui/screens/private/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email,_password;
  final GlobalKey<FormState> _validLoginKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        color:Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("for the ultimate experience",style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Column(
                    children: <Widget>[

                    ],
                  )
                ],
              ),
             const SizedBox(height: 50,),
             Column(
               children: <Widget>[
                 Form(
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Email Address",style: TextStyle(color: Colors.grey)),
                       const SizedBox(height: 10),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius:  BorderRadius.circular(5),
                           color: Colors.white
                         ),
                         child: TextFormField(
                           keyboardType: TextInputType.emailAddress,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (val){

                           },
                         ),
                       ),
                       const SizedBox(height: 40),
                       const Text("Password",style: TextStyle(color: Colors.grey)),
                       const SizedBox(height: 10),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius:  BorderRadius.circular(5),
                           color: Colors.white,
                         ),
                         child: TextFormField(
                           obscureText: isPasswordHidden,
                           keyboardType: TextInputType.emailAddress,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           decoration: InputDecoration(
                             suffixIcon: InkWell(
                               onTap: _togglePasswordView,
                               child:!isPasswordHidden?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                             ),
                           ),
                           validator: (val){

                           },
                         ),
                       ),
                       const SizedBox(height: 5),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const <Widget>[
                           Text("Forgotten your password?",style: TextStyle(color: Colors.grey)),
                         ],
                       ),
                       const SizedBox(height: 40),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()
                            ),
                          );
                          /*if(_validLoginKey.currentState!.validate()){

                          }*/
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text("Dont't have an account?",style: TextStyle(color: Colors.grey)),
                            Text("Sign up here",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                       const SizedBox(height: 100),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:  BorderRadius.circular(5),
                        ),
                         height: 50,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: const <Widget>[
                             Text("LOGIN WITH FACEBOOK ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                           ],
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView(){
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }
}
