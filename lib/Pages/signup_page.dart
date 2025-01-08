import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_languages_project/Widgets/custom_button.dart';
import 'package:programming_languages_project/Widgets/pick_image_widget.dart';
import 'package:programming_languages_project/Widgets/show_custom_toast.dart';
import '../core/Constant/colors.dart';
import '../core/Constant/strings.dart';
import '/Cubits/auth_cubit/auth_cubit.dart';

import '../Widgets/custom_inputfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController? firstName;
  TextEditingController? lastName;

  TextEditingController? passWord;
  TextEditingController? phoneNum;
  TextEditingController? position;

  GlobalKey<FormState>? signUpKey;
  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    passWord = TextEditingController();
    phoneNum = TextEditingController();
    position = TextEditingController();
    signUpKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    firstName?.dispose();
    lastName?.dispose();
    passWord?.dispose();
    phoneNum?.dispose();
    position?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showCustomToast(message: state.message);

          Navigator.pushNamedAndRemoveUntil(
            context,
            'signin',
            (route) => false,
          );
        } else if (state is SignUpFailure) {
          showCustomToast(message: state.errMessage);
        }
      },
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Form(
                key: signUpKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    PickImageWidget(),
                    const Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        spacing: 16,
                        children: [
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: firstName,
                            hintText: AppStrings.firstName,
                            icon: const Icon(Icons.person),
                            suffixIcon: true,
                            validator: true,
                          ),
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: lastName,
                            hintText: AppStrings.lastName,
                            icon: const Icon(Icons.person),
                            suffixIcon: true,
                            validator: true,
                          ),
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
                            obscureText: true,
                            icon: const Icon(Icons.lock),
                            prefixIcon: true,
                            suffixIcon: true,
                            validator: true,
                          ),
                          CustomInputField(
                            primaryColor: AppColors.primaryColor,
                            controller: position,
                            hintText: AppStrings.position,
                            icon: const Icon(Icons.location_on_rounded),
                            suffixIcon: true,
                            validator: true,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomButton(
                          primaryColor: AppColors.primaryColor,
                          child: state is SignUpLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  AppStrings.signUp,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                          onPressed: () {
                            if (signUpKey!.currentState!.validate()) {
                              context.read<AuthCubit>().register({
                                'first_name': firstName!.text,
                                'last_name': lastName!.text,
                                'phone_number': phoneNum!.text,
                                'password': passWord!.text,
                                'image': context.read<AuthCubit>().profilePic,
                                'position': position!.text
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
                                AppStrings.signIn,
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
