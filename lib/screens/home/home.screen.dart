import 'package:flutter/material.dart';
import 'package:login/widgets/custom_button.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff0b233f),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            child: Image.asset('../assets/images/Simbolo_1@2x.png', width: 22.0,),
          ),
          const Text(
            'Login feito com sucesso !', 
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 30),
          CustomButton(
            textColor: Colors.black,
            text: 'Logout',
            backgroundColor:const Color(0xff2fc4d0),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

