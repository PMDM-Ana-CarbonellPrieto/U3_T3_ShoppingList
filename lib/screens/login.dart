import 'package:flutter/material.dart';
import 'package:t3_shopping_list/screens/products.dart';

class LoginScreen extends StatefulWidget {
  // TODO Act3: Usarios de prueba
  static final Map<String, String> users = {
    'batoi@gmail.com': 'B_123456',
    'anadam@gmail.com': 'A_123456',
    'empar@gmail.com': 'E_profe1'
  };

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // TODO Act3: Controladores para recoger los valores de los TextField del formulario
  final _emailController = TextEditingController();
  final _pswrdController = TextEditingController();

  @override
  void dispose() {
    // TODO Act3: Deshabilita los controladores
    _emailController.dispose();
    _pswrdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _eMailInput(),
            _passwordInput(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _eMailInput() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        // TODO Act3: Añade el controlador
        controller: _emailController,
        decoration: InputDecoration(
            labelText: 'User',
            hintText: 'Write your email address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Sorry, user can\'t be empty.';
          // TODO Act3: Comprueba si el usuario tiene @
          if (!value.contains('@')) return 'Sorry, user has to be an email';
          return null;
        },
      ),
    );
  }

  Widget _passwordInput() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        // TODO Act3: Añade el controlador
        controller: _pswrdController,
        obscureText: true,
        obscuringCharacter: '*',
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Write your password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Sorry, password can not be empty.';
          // TODO Act3: Comprueba los distintos requisitos de la contraseña
          if (value.length < 8) return 'Sorry, password length must be 8 characters or greater';
          if (!value.contains(RegExp(r'[A-Z]'))) return 'Sorry, password has to contain at least one capital letter.';
          if (!value.contains(RegExp(r'[0-9]'))) return 'Sorry, password has to contain at least one number.';
          if (!value.contains(RegExp(r'[\W_]'))) return 'Sorry, password has to contain at least one symbol.';
          return null;
        },
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        child: const Text('Login'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // TODO Act3: Comprueba si el usuario existe y si la contraseña es correcta
            final String email = _emailController.text;

            if (LoginScreen.users.containsKey(email) && LoginScreen.users[email] == _pswrdController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logging in ... Welcome!'),),
              );
              // TODO Act3: Remplaza la pantalla actual por la de productos
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProductsScreen()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Incorrect user or password, try again.'),),
              );
            }
          }
        }
      ),
    );
  }
}
