import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Constant/strings.dart';
import '/Cubits/auth_cubit/auth_cubit.dart';

import '../Constant/colors.dart';
import '../Widgets/custom_inputfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController? userName;
  TextEditingController? passWord;
  GlobalKey<FormState>? signinKey;
  @override
  void initState() {
    userName = TextEditingController();
    passWord = TextEditingController();
    signinKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    userName?.dispose();
    passWord?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(''),
          ));
          Navigator.pushNamedAndRemoveUntil(context, '', (route) => false);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(''),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(''),
                const Text(
                  AppStrings.signIn,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                  child: Form(
                    key: signinKey,
                    child: Column(
                      spacing: 10,
                      children: [
                        CustomInputField(
                          primaryColor: AppColors.primaryColor,
                          controller: userName,
                          hintText: AppStrings.userName,
                          icon: const Icon(Icons.person),
                          suffixIcon: true,
                          validator: true,
                        ),
                        CustomInputField(
                          primaryColor: AppColors.primaryColor,
                          controller: passWord,
                          hintText: AppStrings.passWord,
                          icon: const Icon(Icons.lock),
                          suffixIcon: true,
                          prefixIcon: true,
                          obscureText: true,
                          validator: true,
                        ),
                      ],
                    ),
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
                      child: state is SignInLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(AppStrings.signIn,
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () {
                        context.read<AuthCubit>().signIn();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
