import 'package:flutter/material.dart';
import 'package:kitmans_gallery/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:kitmans_gallery/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Kitman\'s Gallery',
        theme: ThemeData(
          // This is the theme of your application.
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.blueAccent[400]),
        ),
        // Menggunakan widget baru untuk menentukan halaman awal
        home: const InitialScreenDeterminer(), 
        routes: {
                    "/login": (BuildContext context) => const LoginPage(),
                },
      ),
    );
  }
}

// Widget baru untuk memeriksa status login dan menentukan layar awal
class InitialScreenDeterminer extends StatelessWidget {
  const InitialScreenDeterminer({super.key});

  @override
  Widget build(BuildContext context) {
    // Memantau perubahan pada CookieRequest
    final request = context.watch<CookieRequest>();

    // Memeriksa status login
    if (request.loggedIn) {
      // Jika sudah login, tampilkan Home Page
      return MyHomePage();
    } else {
      // Jika belum login, tampilkan Login Page
      return const LoginPage();
    }
  }
}