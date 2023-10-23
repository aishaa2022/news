import 'package:flutter/material.dart';
import 'package:news/Auth/login.dart';
import 'package:news/Core/colors.dart';
import 'package:news/Feature/Home/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "create a new account",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name must be not empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "name",
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email must be not empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "email",
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password must not be empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        labelText: "password",
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon((isVisible)
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Home()));
                      }
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.lamonada,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "sign up",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "if you have account",
                        style: TextStyle(color: AppColors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Text(
                            "login",
                            style: TextStyle(color: AppColors.lamonada),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
