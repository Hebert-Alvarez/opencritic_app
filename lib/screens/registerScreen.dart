import 'package:flutter/material.dart';
import 'package:opencritic_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.grey[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            // Agrega algún espaciado alrededor del Card
            margin: EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Título "Registro"
                    const Text(
                      'Registro',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _emailController,
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
                    // Espaciado entre el correo electrónico y la contraseña
                    SizedBox(height: 16.0),
                    // Campo de texto para la contraseña
                    TextFormField(
                      controller: _passwordController,
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
                    // Espaciado entre la contraseña y el botón de registro
                    SizedBox(height: 16.0),
                    // Botón de registro
                    ElevatedButton(
                      onPressed: () async {
                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        //espera respuesta y si es asignado correctamente el token registra
                        String? result = await authService.createUser(email,
                            password); //crea el usuario mandandole los valores ingresados y autenticados

                        if (result == null) {
                          Navigator.pushReplacementNamed(context, 'login');
                        } else {
                          print('Error en el registro: $result');
                        }
                      },
                      child: Text('Registrar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
