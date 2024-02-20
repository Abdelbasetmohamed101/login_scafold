import 'package:flutter/material.dart';
import 'login.dart';

class scafold_signup extends StatelessWidget {
  const scafold_signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScaffold(),
    );
  }
}

class SignUpScaffold extends StatefulWidget {
  const SignUpScaffold({Key? key}) : super(key: key);
  @override
  State<SignUpScaffold> createState() => _SignUpScaffoldState();
}

class _SignUpScaffoldState extends State<SignUpScaffold> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintMaxLines: 1,
                  hintText: 'Enter your username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintMaxLines: 1,
                  hintText: 'Enter your email address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]+$")
                      .hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // You can add your sign-up logic here
                    Map<String, String> userData = {
                      'username': _usernameController.text,
                      'email': _emailController.text,
                      'password': _passwordController.text,
                    };
                    print(userData);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Sign Up Successful'),
                              content: const Text(
                                  'You have successfully signed up.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => scafold_login())));
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
