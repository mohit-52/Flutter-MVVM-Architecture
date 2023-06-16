import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';

import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> _obscureText = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscureText.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height  = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Login"),centerTitle: true,),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                onFieldSubmitted: (valu){
                  Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.alternate_email)
                ),
              ),
              ValueListenableBuilder(valueListenable: _obscureText, builder: (context, value, child){
                return   TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: passwordFocusNode,
                  obscureText: _obscureText.value ,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Password",
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffix: InkWell(
                          onTap: (){
                            _obscureText.value = !_obscureText.value;
                          },
                          child: _obscureText.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
                  ),
                );
              }),
              SizedBox(height: height * 0.08,),
              RoundButton(title: "Log In", onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Email!", context);
                }else if (_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Password!", context);

                }else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessage("Password Length should be more than 6!", context);

                }else{
                  print("API HIT");
                }
              }),

            ],
          ),
        )
    );
  }
}
