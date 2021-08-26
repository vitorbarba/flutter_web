import 'package:get/get.dart';

class TranslateApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'ToDo List': 'ToDo List',
          'Welcome': 'Welcome',
          'loading...': 'loading...',
        },
        'de_DE': {
          'ToDo List': 'ToDo List',
          'Welcome': 'Welcome',
          'loading...': 'loading...',
        },
        'pt_BR': {
          'ToDo List': 'Lista de Tarefas',
          'Welcome': 'Bem Vindo',
          'loading...': 'atualizando...',
        }
      };
}
