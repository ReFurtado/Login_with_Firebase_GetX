// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/welcome_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthController extends GetxController{

  //Instância estática da classe para fácil acesso
  static AuthController instance = Get.find();

  //Variável para armazenar informações do usuário autenticado
  //Usamos Rx (parte do GetX) para monitorar mudanças nessa variável
  late Rx<User?> _user;

  //Instância do FirebaseAuth para gerenciar a autenticação
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

     //Inicializa a variável _user com o usuário atualmente autenticado
    _user = Rx<User?> (auth.currentUser);

    //Atualização da variável _user sempre que houver uma alteração na autenticação
    _user.bindStream(auth.userChanges());

    // Observa a variável _user e executa a função _initialScreen sempre que _user mudar
    ever(_user, _initialScreen);
  }

  // Função para decidir qual página exibir com base no estado de autenticação do usuário
  _initialScreen(User? user) {
    if(user == null){
      print('login page');
      // Se não houver usuário autenticado, redireciona para a página de login
      Get.offAll(() => LoginPage());
    } else {
      // Se houver um usuário autenticado, redireciona para a página de boas-vindas
      Get.offAll(() => WelcomePage(email: user.email!));
    }
  }

  //Função para criar uma nova conta de usuário com um email e senha
  Future<void> register(String email, password) async {
    try {
      //Tentativa de criar a conta de usuário usando o Firebase Authentication
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      //Exibe uma notificação de erro (snackbar) para o usuário
      Get.snackbar(
        'Sobre o usuário', 'Mensagem usuário', //Títulos temporários
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Ops! Não foi possível criar a conta.\n Verifique suas informações e tente novamente.",
          textAlign: TextAlign.center, //Notificação de erro
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),
        ),
        messageText: Text(
          e.toString(),
          style: GoogleFonts.poppins(
            color: Colors.white
          ),
        )
      );
    }
  }

  //Função para autenticar um usuário com um email e senha
  Future<void> login(String email, password) async {
    try {
      //Tentativa de autenticar o usuário usando o Firebase Authentication
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      //Exibe uma notificação de erro (snackbar) para o usuário
      Get.snackbar(
        'Sobre o login', 'Mensagem login', //Títulos temporários
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Falha no login!\n Por favor tente novamente.",
          textAlign: TextAlign.center, //Notificação de erro
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),
        ),
        messageText: Text(
          e.toString(),
          style: GoogleFonts.poppins(
            color: Colors.white
          ),
        )
      );
    }
  }

  //Função para sair da conta do usuário autenticado
  void logOut() async {
    await auth.signOut();
  }

}