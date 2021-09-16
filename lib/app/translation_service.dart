import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'ToDo_List': 'ToDo List',
          'Welcome': 'Welcome',
          'loading...': 'loading...',
          'Error_creating_Account': 'Error creating Account',
          'Error_signing_in': 'Error signing in',
          'Error_signing_out': 'Error_signing_out',
          'Sign_Up': 'Sign Up',
          'Full_Name': 'Full Name',
          'Email': 'Email',
          'Password': 'Password',
          'Account': 'Account',
          'Login': 'Login',
          'Add_Todo_Here:': 'Add Todo Here:',
          'Your_Todos': 'Your_Todos',
        },
        'pt_BR': {
          'ToDo_List': 'Lista de Tarefas',
          'Welcome': 'Bem Vindo',
          'loading...': 'atualizando...',
          'Error_creating_Account': 'Erro ao criar a conta',
          'Error_signing_in': 'Erro ao entrar',
          'Error_signing_out': 'Erro ao sair',
          'Sign_Up': 'Entrar',
          'Full_Name': 'Nome Completo',
          'Email': 'Email',
          'Password': 'Senha',
          'Account': 'Conta',
          'Login': 'Entrar',
          'Add_Todo_Here:': 'Adicione Tarefas Aqui:',
          'Your_Todos': 'Suas Tarefas',
        },
      };
}
