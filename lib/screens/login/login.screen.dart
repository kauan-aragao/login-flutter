import 'package:flutter/material.dart';
import 'package:login/screens/home/home.screen.dart';
import 'package:login/widgets/custom_button.widget.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool doesPasswordHidden = true; 
  IconData? passwordIcon = Icons.visibility;
  bool isChecked = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    if(_emailController.text != "teste@email.com" || _passwordController.text != "@Senha123") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Entrada inválida: Login não encontrado.'),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: const Icon(Icons.close),color: Colors.white,)
              ]),
          duration: const Duration(seconds: 3),
          backgroundColor: const Color(0xfffd5a33),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      );
    }
    else {
      _emailController.clear();
      _passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      backgroundColor: const Color(0xff0b233f),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Image.asset('../assets/images/Simbolo_1@2x.png', width: 22.0,),
                ),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    hintStyle: const TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xff2fc4d0).withOpacity(0.8)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xff2fc4d0).withOpacity(0.8))
                    ),
                  ), 
                ),
                const SizedBox(height: 30.0,),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  obscureText: doesPasswordHidden,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Digite sua senha",
                    hintStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (doesPasswordHidden) {
                          setState(() {
                            doesPasswordHidden = false;
                            passwordIcon = Icons.visibility_off;
                          });
                        } 
                        else {
                          setState(() {
                            doesPasswordHidden = true;
                            passwordIcon = Icons.visibility;
                          });
                        }
                      },
                      icon: Icon(
                        passwordIcon,
                        color: const Color(0xff2fc4d0),
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xff2fc4d0).withOpacity(0.8)
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xff2fc4d0).withOpacity(0.8)
                      )
                    ),
                  ),
                ),  
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: const Color(0xff2fc4d0).withOpacity(0.6),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text('Manter-me conectado', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    ],
                  ),
                  ),
                const SizedBox(height: 70.0,),
                CustomButton(
                  text: 'Login',
                  backgroundColor: const Color(0xff2fc4d0),
                  textColor: Colors.black,
                  onPressed: handleLogin
                ),
                const SizedBox(height: 30.0,),    
                CustomButton(
                  text: 'Cadastre-se', 
                  backgroundColor: const Color(0xff05a686), 
                  onPressed: () {}, 
                  textColor: Colors.white
                ),               
                const SizedBox(height: 32.0,), 
                const Text('Esqueceu a senha?', style: TextStyle(color: Colors.white, fontSize: 16.0),),               
                const SizedBox(height: 12.0,),
                const Text('v. 1.3.91', style: TextStyle(color: Colors.white, fontSize: 12.0),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}