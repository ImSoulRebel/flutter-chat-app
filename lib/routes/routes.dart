import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/users_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => const UsersScreen(),
  'chat': (_) => const ChatScreen(),
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
  'loading': (_) => const LoadingScreen(),
};
