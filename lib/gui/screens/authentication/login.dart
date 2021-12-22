import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/gui/errors/error_fields.dart';
import 'package:otto_wilde_recipies/gui/screens/authentication/validation/email/is_email_empty.dart';
import 'package:otto_wilde_recipies/gui/screens/authentication/validation/email/is_email_valid.dart';
import 'package:otto_wilde_recipies/gui/screens/private/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String emailAllowed = "test@example.com";
  String? _email,_password;
  final GlobalKey<FormState> _validLoginKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  final IsEmailValid _isEmailValid = IsEmailValid();
  final IsEmailEmpty _isEmailEmpty = IsEmailEmpty();

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SizedBox(
                        height: 100,
                        child: Image.network("http://cdn.shopify.com/s/files/1/0503/8522/3842/files/OWG_Logo_red_d4bf00d0-ea58-46ab-99ee-d170c2524837_1024x.png?v=1622017445",fit: BoxFit.fill,),
                      )
                    ],
                  )
                ],
              ),
             const SizedBox(height: 50,),
             Column(
               children: <Widget>[
                 Form(
                   key: _validLoginKey,
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
                             if(_isEmailEmpty.isEmailEmpty(val!)){
                               return ErrorFields.requiredField;
                             }else if(!_isEmailValid.isEmailValid(val)){
                               return ErrorFields.inValidEmail;
                             }else if(val!=emailAllowed){
                               return ErrorFields.wrongEmail;
                             }
                             else{
                               WidgetsBinding.instance?.addPostFrameCallback((_){
                                 setState(() {
                                   _email = val.trim();
                                 });
                               });
                             }
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
                             if(val!.isNotEmpty){
                               WidgetsBinding.instance?.addPostFrameCallback((_){
                                 setState(() {
                                   _password = val.trim();
                                 });
                               });
                             }
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
                        child: GestureDetector(
                          onTap: (){
                            if(_validLoginKey.currentState!.validate()){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
                            }
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
