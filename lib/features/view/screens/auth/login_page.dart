import 'package:ecommerce_app/features/view/screens/auth/registration_page.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/helper/helper.dart';
import '../../../../utils/size/k_size.dart';
import '../../global_component/buttons/custom_button.dart';
import '../../global_component/gray_handle/gray_handle.dart';
import '../../global_component/show_sheet/show_sheet.dart';
import '../../global_component/text_field_container/text_field_container.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Helper.dissmissKeyboard(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TextFieldContainer(
                        hint: 'Email',
                        label: 'example@example.com',
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldContainer(
                        hint: 'password',
                        label: 'password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              value = value;
                            },
                            icon: value
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined)),
                        obscureText: value,
                      ),
                      TextButton(
                        onPressed: () => forgotPasswordBottomSheet(context),
                        child: Text(
                          'Forgot password ! ',
                          style: TextStyles.bodyText1
                              .copyWith(color: KColor.black54),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  name: 'Login',
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  width: KSize.getWidth(context, 180),
                  height: KSize.getHeight(context, 45),
                  color: KColor.primary,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style:
                          TextStyles.bodyText1.copyWith(color: KColor.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Text(
                        'Registration',
                        style: TextStyles.bodyText1
                            .copyWith(color: KColor.errorRedText),
                      ),
                    ),
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
          const Text(
            'Forgot password',
            // style: TextStyles.mediumPoppins24Black24,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Enter your email for the verification proccesss, we will send 4 digits code to your email.',
            // style: TextStyles.regularRubik14Gray94,
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
                Navigator.pop(context);
                verificationBottomSheet(context);
              },
              name: 'Continue',
              width: KSize.getWidth(context, 95),
              height: KSize.getHeight(context, 45),
              color: KColor.primary,
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
          const Text(
            'Enter 4 Digits Code',
            // style: TextStyles.mediumPoppins24Black24,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Enter the 4 digits code that you received on your email.',
            // style: TextStyles.regularRubik14Gray94,
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
              Navigator.pop(context);
            },
            obscureText: false,
            animationType: AnimationType.fade,
            // textStyle: TextStyles.boldPTSans26Green7F,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 65,
              fieldWidth: 65,
              activeFillColor: KColor.primary,
              inactiveColor: KColor.black54,
              selectedColor: KColor.black54,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                Navigator.pop(context);
                resetPasswordBottomSheet(context);
              },
              name: 'Continue',
              width: KSize.getWidth(context, 100),
              height: KSize.getHeight(context, 45),
              color: KColor.primary,
            ),
          ),
        ],
      ),
    ),
  );
}

resetPasswordBottomSheet(BuildContext context) {
  var value;
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
          const Text(
            'Reset password',
            // style: TextStyles.mediumPoppins24Black24,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Set the new password for your account so you can login and access all the features.',
            // style: TextStyles.regularRubik14Gray94,
          ),
          const SizedBox(
            height: 35,
          ),
          TextFieldContainer(
            hint: 'New password',
            label: 'New password',
            suffixIcon: IconButton(
                onPressed: () {
                  value = value;
                },
                icon: value
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined)),
            obscureText: value,
            padding: 0,
          ),
          const SizedBox(
            height: 35,
          ),
          TextFieldContainer(
            hint: 'Re-enter password',
            label: 'Re-enter password',
            suffixIcon: IconButton(
                onPressed: () {},
                icon: value
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined)),
            obscureText: value,
            padding: 0,
          ),
          const SizedBox(
            height: 35,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                Navigator.pop(context);
              },
              name: 'Update Password',
              width: KSize.getWidth(context, 60),
              height: KSize.getHeight(context, 30),
              color: KColor.primary,
            ),
          ),
        ],
      ),
    ),
  );
}
