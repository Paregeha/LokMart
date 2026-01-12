import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../../features/auth/blocs/sign_up_bloc/sign_up_event.dart';
import '../../../features/auth/blocs/sign_up_bloc/sign_up_state.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_fonts.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/buttons/custom_button_widget.dart';
import '../../../widgets/buttons/custom_square_check_box_widget.dart';
import '../../../widgets/text_fields/custom_text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(),
      child: BlocProvider(
        create: (ctx) => SignUpBloc(ctx.read<AuthRepository>()),
        child: _SignUpBody(
          isSelected: isSelected,
          onToggleTerms: () {
            setState(() => isSelected = !isSelected);
          },
        ),
      ),
    );
  }
}

class _SignUpBody extends StatelessWidget {
  const _SignUpBody({required this.isSelected, required this.onToggleTerms});

  final bool isSelected;
  final VoidCallback onToggleTerms;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                Positioned(
                  left: 0,
                  right: 0,
                  top: -heightLayout * 0.07,
                  child: Assets.images.headerBackground.image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: heightLayout * 0.03),
                    Assets.images.logo.image(width: double.infinity),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<SignUpBloc, SignUpState>(
                      listener: (context, state) {
                        if (state.status == SignUpStatus.success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Успішна реєстрація')),
                          );
                          context.go(AppRoutes.signIn);
                        }
                        if (state.status == SignUpStatus.failure &&
                            state.error != null) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(state.error!)));
                        }
                        if (state.status == SignUpStatus.invalid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Перевірте поля та умови використання',
                              ),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        final bloc = context.read<SignUpBloc>();

                        final isLoading = state.status == SignUpStatus.loading;
                        final canSubmit =
                            isSelected && state.isValid && !isLoading;

                        // Підготовка текстів помилок
                        final usernameError =
                            state.username.isEmpty || state.isUsernameValid
                                ? null
                                : 'Мінімум 3 символи';
                        final emailError =
                            state.email.isEmpty || state.isEmailValid
                                ? null
                                : 'Невірний email';
                        final passError =
                            state.password.isEmpty || state.isPasswordValid
                                ? null
                                : 'Мінімум 6 символів';

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: heightLayout * 0.28),
                              Text(
                                'Create your account',
                                style: TextStyle(
                                  color: AppColors.dark,
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w700bold,
                                  fontSize: 24.0,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: heightLayout * 0.05),

                              // USERNAME
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextFieldWidget(
                                    prefix: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 18,
                                        bottom: 18,
                                        left: 12,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.icons.user.path,
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    hintText: 'Enter your login',
                                    textInputAction: TextInputAction.next,
                                    onChanged:
                                        (v) =>
                                            bloc.add(SignUpUsernameChanged(v)),
                                  ),
                                  if (usernameError != null) ...[
                                    const SizedBox(height: 6),
                                    const SizedBox(height: 2),
                                    Text(
                                      usernameError,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ],
                              ),

                              SizedBox(height: heightLayout * 0.04),

                              // EMAIL
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextFieldWidget(
                                    prefix: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 18,
                                        bottom: 18,
                                        left: 12,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.icons.email.path,
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    hintText: 'Enter your email',
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onChanged:
                                        (v) => bloc.add(SignUpEmailChanged(v)),
                                  ),
                                  if (emailError != null) ...[
                                    const SizedBox(height: 6),
                                    const SizedBox(height: 2),
                                    Text(
                                      emailError,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ],
                              ),

                              SizedBox(height: heightLayout * 0.04),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextFieldWidget(
                                    hintText: 'Enter your password',
                                    prefix: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 18,
                                        bottom: 18,
                                        left: 12,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.icons.lock.path,
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                    isPassword: true,
                                    textInputAction: TextInputAction.done,
                                    onSubmitted: (_) {
                                      if (canSubmit) {
                                        bloc.add(const SignUpSubmitted());
                                      }
                                    },
                                    onChanged:
                                        (v) =>
                                            bloc.add(SignUpPasswordChanged(v)),
                                  ),
                                  if (passError != null) ...[
                                    const SizedBox(height: 6),
                                    const SizedBox(height: 2),
                                    Text(
                                      passError,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ],
                              ),

                              SizedBox(height: heightLayout * 0.04),

                              CustomButtonsWidget(
                                label: isLoading ? 'Loading…' : 'SIGN UP',
                                onPressed:
                                    canSubmit
                                        ? () =>
                                            bloc.add(const SignUpSubmitted())
                                        : null,
                              ),

                              SizedBox(height: heightLayout * 0.03),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCheckBoxWidget(
                                    isSelected: isSelected,
                                    onPressed: onToggleTerms,
                                  ),
                                  const SizedBox(width: 14.0),
                                  Expanded(
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          'By tapping “Sign Up” you accept our ',
                                          style: TextStyle(
                                            fontFamily: AppFonts.fontFamily,
                                            fontWeight: AppFonts.w500medium,
                                            fontSize: 16.0,
                                            color: AppColors.softGray,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size.zero,
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                          child: Text(
                                            'terms',
                                            style: TextStyle(
                                              fontFamily: AppFonts.fontFamily,
                                              fontWeight: AppFonts.w600semiBold,
                                              fontSize: 16.0,
                                              color: AppColors.orange,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ' and ',
                                          style: TextStyle(
                                            fontFamily: AppFonts.fontFamily,
                                            fontWeight: AppFonts.w500medium,
                                            fontSize: 16.0,
                                            color: AppColors.softGray,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size.zero,
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                          child: Text(
                                            'condition',
                                            style: TextStyle(
                                              fontFamily: AppFonts.fontFamily,
                                              fontWeight: AppFonts.w600semiBold,
                                              fontSize: 16.0,
                                              color: AppColors.orange,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: heightLayout * 0.05),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have account? ',
                                    style: TextStyle(
                                      fontFamily: AppFonts.fontFamily,
                                      fontWeight: AppFonts.w400regular,
                                      fontSize: 16.0,
                                      color: AppColors.softGray,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => context.go(AppRoutes.signIn),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontFamily: AppFonts.fontFamily,
                                        fontWeight: AppFonts.w600semiBold,
                                        fontSize: 16.0,
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
    );
  }
}
