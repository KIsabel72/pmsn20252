import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn20252/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'Correo electrónico'),
    );

    final txtPwd = TextField(
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(hintText: 'Contraseña'),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo2.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: const Color.fromARGB(156, 2, 69, 96),
                  fontSize: 40,
                  fontFamily: 'disney',
                ),
              ),
            ),
            Positioned(
              bottom: 400,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                  color: Color.fromARGB(142, 213, 194, 241),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPwd,
                    IconButton(
                      onPressed: () {
                        isValidating = true;
                        setState(() {});
                        Future.delayed(Duration(milliseconds: 3000)).then(
                          (value) => Navigator.pushNamed(context, "/home"),
                        );
                      },
                      icon: Icon(Icons.login, size: 40),
                    ),
                    TextButton(
                      onPressed: () {
                        Future.delayed(Duration(milliseconds: 3000)).then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "¿No tienes cuenta? Regístrate aquí",
                        style: TextStyle(
                          color: const Color.fromARGB(156, 2, 69, 96),
                          fontFamily: "disney",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: isValidating
                  ? Lottie.asset('assets/loading3.json', height: 200)
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
