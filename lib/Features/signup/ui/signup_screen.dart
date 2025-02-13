import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/Features/login/ui/widgets/accept_terms_conditions_text.dart';
import 'package:flutter_complete_project/Features/signup/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_complete_project/Features/signup/ui/widgets/already_have_an_account.dart';
import 'package:flutter_complete_project/Features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:flutter_complete_project/Features/signup/ui/widgets/signup_form.dart';
import 'package:flutter_complete_project/core/helpers/spacing_helper.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/my_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14lightGreyNormal,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    MyTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const AcceptTermsAndConditions(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateThenDoSignup(BuildContext context) async {
    if (context.read<SignupCubit>().formkey.currentState!.validate()) {
      await context.read<SignupCubit>().emitSignupStates();
    }
  }
}
