// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  //Visibilidade da senha
  bool isVisible = true;

  //Logos
  List images = [
    'f.png',
    'g.png',
    't.png'
  ];

  //Controller 
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            //Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/background_topo.jpg',
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/profile.png',
                    ),
                  ),
                ],
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
                    'Crie sua conta',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
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
                        hintText: 'Escreva seu email',
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
                      ),
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
                        hintText: 'Escreva sua senha',
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
                      )
                    ),
                  ),
                  
                ],
              ),
            ),
      
            SizedBox(height: 30), //Espaçamento
      
            //Button 
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 26
              ),
              child: InkWell(
                onTap: () {
                  AuthController.instance.register(
                    emailController.text.trim(), 
                    passwordController.text.trim(),
                  );
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
                      'Abrir uma conta',
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
      
            //Crie sua conta
            RichText(
              text: TextSpan(
                text: 'Entre com uma dessas contas',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
      
            Wrap(
              children: List<Widget>.generate(
                3, (index) =>  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      "assets/"+images[index]
                    ),
                  ),
                )),
            )
            
          ],
        ),
      ),
    );
  }
}