// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_controller.dart';
import 'package:flutter_application_1/signup_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Visibilidade da senha
  bool isVisible = true;

  //Controller 
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            //Logo
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/logo.jpg',
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
      
            //Info
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Título
                  Text(
                    'Bem-vindo',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  //Subtitulo
                  Text(
                    'Entre na sua conta',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey.shade500
                    ),
                  ),

                  SizedBox(height: 40), //Espaçamento
                  
                  //Textbox
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFF5784FF)
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                      )
                    ),
                  ),

                  SizedBox(height: 20), //Espaçamento

                  //Textbox
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14
                        ),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xFF5784FF)
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white
                          )
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }, 
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            size: 24,
                            color: Colors.grey,
                          )
                        ),
                      ),
                    
                    ),
                  ),

                  SizedBox(height: 6), //Espaçamento

                  //Botão senha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a sua senha?',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey.shade500
                          ),
                        ),
                      ),
                    ],
                  ),     
                ],
              ),
            ),
          
            //Botão 
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 26
              ),
              child: InkWell(
                onTap: () {
                  AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
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
                      'Entrar',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
      
            //Crie sua conta
            RichText(
              text: TextSpan(
                text: 'Não tem uma conta?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                ),
                children: [
                  TextSpan(
                    text: '  Criar',
                    style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignupPage())
                  ),
                ]
              ),
            )
      
          ],
        ),
      ),
    );
  }
}