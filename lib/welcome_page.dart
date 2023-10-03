// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {

  String email;

  WelcomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //Background
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/welcome.png',
                ),
                fit: BoxFit.cover
              )
            ),
          ),

          //Titulo
          Positioned(
            top: 140,
            left: 30,
            child: Text(
              'Bem Vindo',
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          
          //Email do usuário
          Positioned(
            top: 190,
            left: 30,
            child: Text(
              email,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white
              ),
            ),
          ),

          //Animação
          Center(
            child: LottieBuilder.network(
              'https://lottie.host/40ed26cf-a67b-4206-91d0-51fac4a27d10/qLC9Gluy5U.json',
              width: 300,
              height: 300,
            ), 
          ),

          //Botão sair
          Positioned(
            bottom: 50,
            left: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 0.5) / 2,
            child: InkWell(
                onTap: () {
                  AuthController.instance.logOut();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/button.jpg',
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Center(
                    child: Text(
                      'Sair',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
          ),

        ],
      ),
    );
  }
}