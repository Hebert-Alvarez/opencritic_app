import 'package:flutter/material.dart';
import 'package:opencritic_app/providers/login_form_providers.dart';
import 'package:opencritic_app/screens/home.dart';
import 'package:opencritic_app/screens/registerScreen.dart';
import 'package:opencritic_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginFormProvider _loginFormProvider = LoginFormProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
        backgroundColor: Colors.grey[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 30.0),
                      ChangeNotifierProvider(
                        create: (_) => _loginFormProvider,
                        child: _LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: const Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  _LoginForm({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginFormProvider.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingresa un correo electrónico válido';
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe tener al menos 6 caracteres';
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              if (loginFormProvider.isValidForm()) {
                loginFormProvider.isLoading = true;
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                final email = emailController.text;
                final password = passwordController.text;

                String? result = await authService.login(email, password);

                loginFormProvider.isLoading = false;

                if (result == null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Inicio de Sesión Incorrecto'),
                        content: Text(result),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
            child: Text('Iniciar Sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
