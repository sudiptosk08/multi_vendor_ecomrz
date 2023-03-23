import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helper/helper.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final RxBool isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Helper.dissmissKeyboard(),
          child: EmptyTemplate(
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Join us to start searching',
                      style: TextStyles.mediumPoppins24Black24,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You can search course, apply course and find\n scholarship for abroad studies',
                      style: TextStyles.regularRubik12Gray94,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SocialLoginContainer(
                          name: 'Google',
                          imageString: AppAssets.googleLogo,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SocialLoginContainer(
                          name: 'Facebook',
                          imageString: AppAssets.fbLogo,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextFieldContainer(
                            hint: 'Email',
                            label: 'example@example.com',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => TextFieldContainer(
                              hint: 'Password',
                              label: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    isObscure.value = !isObscure.value;
                                  },
                                  icon: isObscure.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined)
                                      : const Icon(Icons.visibility_outlined)),
                              obscureText: isObscure.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomButton(
                      name: 'Login',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () => forgotPasswordBottomSheet(context),
                      child: Text(
                        'Forgot password',
                        style: TextStyles.regularRubik14Green7F,
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyles.regularRubik14Green7F,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.registrationPage);
                            },
                            child: Text(
                              'Join us',
                              style: TextStyles.regularRubik14Green7F,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

forgotPasswordBottomSheet(BuildContext context) {
  showSheet(
    context,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GrayHandle(),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Forgot password',
            style: TextStyles.mediumPoppins24Black24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Enter your email for the verification proccesss, we will send 4 digits code to your email.',
            style: TextStyles.regularRubik14Gray94,
          ),
          const SizedBox(
            height: 35,
          ),
          const TextFieldContainer(
            hint: 'Email',
            label: 'example@example.com',
            padding: 0,
          ),
          const SizedBox(
            height: 35,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                Get.back();
                verificationBottomSheet(context);
              },
              name: 'Continue',
            ),
          ),
        ],
      ),
    ),
  );
}

verificationBottomSheet(BuildContext context) {
  showSheet(
    context,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GrayHandle(),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Enter 4 Digits Code',
            style: TextStyles.mediumPoppins24Black24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Enter the 4 digits code that you received on your email.',
            style: TextStyles.regularRubik14Gray94,
          ),
          const SizedBox(
            height: 35,
          ),
          //Pin code,
          PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: (value) {},
            onCompleted: (value) {
              Get.back();
            },
            obscureText: false,
            animationType: AnimationType.fade,
            textStyle: TextStyles.boldPTSans26Green7F,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(15),
              fieldHeight: 65,
              fieldWidth: 65,
              activeFillColor: AppColors.white,
              inactiveColor: AppColors.gray94.withOpacity(0.16),
              selectedColor: AppColors.gray94.withOpacity(0.65),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                Get.back();
                resetPasswordBottomSheet(context);
              },
              name: 'Continue',
            ),
          ),
        ],
      ),
    ),
  );
}

resetPasswordBottomSheet(BuildContext context) {
  final RxBool isObscure = true.obs;
  showSheet(
    context,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GrayHandle(),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Reset password',
            style: TextStyles.mediumPoppins24Black24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Set the new password for your account so you can login and access all the features.',
            style: TextStyles.regularRubik14Gray94,
          ),
          const SizedBox(
            height: 35,
          ),
          Obx(
            () => TextFieldContainer(
              hint: 'New password',
              label: 'New password',
              suffixIcon: IconButton(
                  onPressed: () {
                    isObscure.value = !isObscure.value;
                  },
                  icon: isObscure.value
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined)),
              obscureText: isObscure.value,
              padding: 0,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Obx(
            () => TextFieldContainer(
              hint: 'Re-enter password',
              label: 'Re-enter password',
              suffixIcon: IconButton(
                  onPressed: () {
                    isObscure.value = !isObscure.value;
                  },
                  icon: isObscure.value
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined)),
              obscureText: isObscure.value,
              padding: 0,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                Get.back();
              },
              name: 'Update Password',
            ),
          ),
        ],
      ),
    ),
  );
}