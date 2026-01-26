import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/features/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_base_architecture/features/auth/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_base_architecture/widgets/text_fields/custom_text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/blocs/sign_in_bloc/sign_in_event.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../gen/assets.gen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final authRepo = context.read<AuthRepository>();

    return BlocProvider(
      create: (_) => SignInBloc(authRepo),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final heightLayout = constraints.maxHeight;

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: Stack(
                children: [
                  Assets.images.headerBackground.image(fit: BoxFit.cover),
                  Column(
                    children: [
                      SizedBox(height: heightLayout * 0.13),
                      Center(child: Assets.images.logo.image()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: BlocConsumer<SignInBloc, SignInState>(
                        listener: (context, state) {
                          if (state.status == SignInStatus.success) {
                            context.go(AppRoutes.home);
                          }
                          if (state.status == SignInStatus.failure &&
                              state.error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error!)),
                            );
                          }
                          if (state.status == SignInStatus.invalid) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Введіть логін та пароль'),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          final bloc = context.read<SignInBloc>();
                          final isLoading =
                              state.status == SignInStatus.loading;

                          final canSubmit = state.isValid && !isLoading;

                          final identifierError =
                              state.identifier.isEmpty ||
                                      state.isIdentifierValid
                                  ? null
                                  : 'Обовʼязкове поле';
                          final passwordError =
                              state.password.isEmpty || state.isPasswordValid
                                  ? null
                                  : 'Мінімум 6 символів';

                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: heightLayout * 0.4),
                                Text(
                                  'Welcome back',
                                  style: TextStyle(
                                    color: AppColors.dark,
                                    fontSize: 24.0,
                                    fontWeight: AppFonts.w700bold,
                                    fontFamily: AppFonts.fontFamily,
                                    height: 1,
                                    letterSpacing: 0,
                                  ),
                                ),
                                SizedBox(height: heightLayout * 0.05),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: AppFonts.w400regular,
                                    fontFamily: AppFonts.fontFamily,
                                    color: AppColors.softGray,
                                    height: 1,
                                    letterSpacing: 0,
                                  ),
                                ),
                                SizedBox(height: heightLayout * 0.03),

                                // identifier
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFieldWidget(
                                      hintStyle: TextStyle(
                                        color: AppColors.softGray,
                                        fontSize: 16.0,
                                        height: 1,
                                        fontWeight: AppFonts.w500medium,
                                        fontFamily: AppFonts.fontFamily,
                                        letterSpacing: 0,
                                      ),
                                      prefix: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 18.0,
                                          bottom: 18.0,
                                          left: 12.0,
                                        ),
                                        child: Assets.icons.user.svg(
                                          width: 24.0,
                                          height: 24.0,
                                        ),
                                      ),
                                      hintText: 'Enter your login or email',
                                      textInputAction: TextInputAction.next,
                                      onChanged:
                                          (v) => bloc.add(
                                            LoginIdentifierChanged(v),
                                          ),
                                    ),
                                    if (identifierError != null) ...[
                                      const SizedBox(height: 6),
                                      const SizedBox(height: 2),
                                      Text(
                                        identifierError,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),

                                SizedBox(height: heightLayout * 0.03),

                                // password
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFieldWidget(
                                      prefix: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 18.0,
                                          bottom: 18.0,
                                          left: 12.0,
                                        ),
                                        child: Assets.icons.lock.svg(
                                          width: 24.0,
                                          height: 24.0,
                                        ),
                                      ),
                                      hintText: 'Enter your password',
                                      isPassword: true,
                                      textInputAction: TextInputAction.done,
                                      onSubmitted: (_) {
                                        if (canSubmit) {
                                          bloc.add(const LoginSubmitted());
                                        }
                                      },
                                      onChanged:
                                          (v) =>
                                              bloc.add(LoginPasswordChanged(v)),
                                    ),
                                    if (passwordError != null) ...[
                                      const SizedBox(height: 6),
                                      const SizedBox(height: 2),
                                      Text(
                                        passwordError,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),

                                SizedBox(height: heightLayout * 0.03),

                                CustomButtonsWidget(
                                  label: isLoading ? 'Loading…' : 'SIGN IN',
                                  onPressed:
                                      canSubmit
                                          ? () =>
                                              bloc.add(const LoginSubmitted())
                                          : null,
                                ),

                                SizedBox(height: heightLayout * 0.03),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomCheckBoxWidget(
                                          isSelected: state.rememberMe,
                                          onPressed: () {
                                            context.read<SignInBloc>().add(
                                              const LoginRememberToggled(),
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          'Keep Sign In',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: AppFonts.w600semiBold,
                                            fontFamily: AppFonts.fontFamily,
                                            color: AppColors.dark,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.go(AppRoutes.test);
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: AppFonts.w600semiBold,
                                          fontFamily: AppFonts.fontFamily,
                                          color: AppColors.orange,
                                          letterSpacing: 0,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1.5,
                                          decorationColor: AppColors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: heightLayout * 0.07),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don’t have an account? ',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: AppFonts.w400regular,
                                        fontFamily: AppFonts.fontFamily,
                                        color: AppColors.softGray,
                                        height: 1,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.go(AppRoutes.signUp);
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: AppFonts.w600semiBold,
                                          fontFamily: AppFonts.fontFamily,
                                          color: AppColors.orange,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
