import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Constant/colors.dart';
import '/Constant/strings.dart';
import '/Cubits/auth_cubit/auth_cubit.dart';

import '../Widgets/custom_inputfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController? userName;

  TextEditingController? passWord;
  TextEditingController? phoneNum;

  GlobalKey<FormState>? signUpKey;
  @override
  void initState() {
    userName = TextEditingController();
    passWord = TextEditingController();
    phoneNum = TextEditingController();
    signUpKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    userName?.dispose();
    passWord?.dispose();
    phoneNum?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(''),
            ),
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            'signin',
            (route) => false,
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: signUpKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 200),
                child: Column(
                  spacing: 16,
                  children: [
                    SvgPicture.asset(''),
                    const Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 40),
                      child: Column(
                        spacing: 16,
                        children: [
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: userName,
                            hintText: AppStrings.userName,
                            icon: const Icon(Icons.person),
                            suffixIcon: true,
                          ),
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: phoneNum,
                            hintText: AppStrings.phoneNum,
                            icon: const Icon(Icons.phone),
                            suffixIcon: true,
                          ),
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: passWord,
                            hintText: AppStrings.passWord,
                            obscureText: true,
                            icon: const Icon(Icons.lock),
                            prefixIcon: true,
                            suffixIcon: true,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          elevation: 10,
                          color: AppColors.primaryColor,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          height: 40,
                          minWidth: 200,
                          child: state is SignUpLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(AppStrings.signUp,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                          onPressed: () {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('signin');
                              },
                            ),
                            const Text(
                              AppStrings.oldUser,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
