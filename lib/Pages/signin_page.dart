import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:programming_languages_project/Widgets/custom_button.dart';
import 'package:programming_languages_project/Widgets/show_custom_toast.dart';
import '../core/Constant/strings.dart';
import '/Cubits/auth_cubit/auth_cubit.dart';

import '../core/Constant/colors.dart';
import '../Widgets/custom_inputfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController? phoneNum;
  TextEditingController? passWord;
  GlobalKey<FormState>? signinKey;
  @override
  void initState() {
    phoneNum = TextEditingController();
    passWord = TextEditingController();
    signinKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    phoneNum?.dispose();
    passWord?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showCustomToast(message: state.message);
          Navigator.pushNamedAndRemoveUntil(
              context, 'homepage', (route) => false);
        } else if (state is SignInFailure) {
          showCustomToast(message: state.errMessage);
        }
      },
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  SvgPicture.asset(
                    'assets/svg/Tablet login-amico.svg',
                    height: size.height / 3,
                  ),
                  const Text(
                    AppStrings.signIn,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Form(
                      key: signinKey,
                      child: Column(
                        spacing: 16,
                        children: [
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: phoneNum,
                            hintText: AppStrings.phoneNum,
                            icon: const Icon(Icons.phone),
                            suffixIcon: true,
                            validator: true,
                            isPhone: true,
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
                      CustomButton(
                        primaryColor: AppColors.primaryColor,
                        child: state is SignInLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                AppStrings.signIn,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                        onPressed: () {
                          if (signinKey!.currentState!.validate()) {
                            context.read<AuthCubit>().signIn({
                              'phone_number': phoneNum!.text,
                              'password': passWord!.text,
                            });
                          } else {
                            showCustomToast(
                                message: AppStrings.validFieldsMessage);
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: const Text(
                                AppStrings.signUp,
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  'signup',
                                  (route) => false,
                                );
                              }),
                          const Text(
                            AppStrings.newUser,
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
        );
      },
    );
  }
}
