import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/auth/data/auth_repository.dart';
import '../../features/profile/bloc/profile_bloc.dart';
import '../../features/profile/bloc/profile_event.dart';
import '../../features/profile/bloc/profile_state.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../../routes/app_routes.dart';
import '../../widgets/buttons/custom_button_profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> _contactUs(BuildContext context) async {
    final s = context.read<ProfileBloc>().state;

    const supportEmail = 'support@yourapp.com';

    final uri = Uri(
      scheme: 'mailto',
      path: supportEmail,
      queryParameters: {
        'subject': 'Support request',
        'body': '''
Hello,

I need help.

User: ${s.user?.username ?? ''}
Email: ${s.user?.email ?? ''}

Message:
''',
      },
    );

    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Could not open email app')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
      'PROFILE ProfileBloc hash=${identityHashCode(context.read<ProfileBloc>())}',
    );

    final gradient = LinearGradient(
      colors: [AppColors.gradientOne, AppColors.gradientTwo],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen:
          (p, n) =>
              p.editOpen != n.editOpen ||
              p.status != n.status ||
              p.error != n.error,
      listener: (context, s) async {
        if (s.status == ProfileStatus.loggedOut) {
          context.go(AppRoutes.signIn);
          return;
        }

        if (s.error != null && s.error!.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(s.error!)));
        }

        if (s.editOpen) {
          final bloc = context.read<ProfileBloc>();

          await showDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: true,
            builder:
                (_) => BlocProvider.value(
                  value: bloc,
                  child: const _EditProfileDialog(),
                ),
          );

          if (!context.mounted) return;
          context.read<ProfileBloc>().add(const ProfileEditClosed());
        }
      },
      builder: (context, s) {
        final user = s.user;
        final authRepo = context.read<AuthRepository>();

        return Scaffold(
          backgroundColor: const Color(0xFFF3F6FB),
          body: Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                decoration: BoxDecoration(gradient: gradient),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                          child: Container(
                            height: 106,
                            width: 106,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: _Avatar(
                              localPath: s.avatarLocalPath,
                              url: user?.avatarUrl,
                              toAbsoluteUrl: authRepo.toAbsoluteUrl,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap:
                                user == null
                                    ? null
                                    : () => context.read<ProfileBloc>().add(
                                      const ProfileEditOpened(),
                                    ),
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: AppColors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.white),
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user?.username ?? '...',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      user?.email ?? '',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: AppFonts.w500medium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (s.status == ProfileStatus.loading)
                      const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      _buildCard([
                        _button(
                          iconPath: Assets.icons.order.path,
                          label: 'My order',
                          onTap: () {
                            context.go(AppRoutes.order);
                          },
                        ),
                        const SizedBox(height: 20),
                        _button(
                          iconPath: Assets.icons.payment.path,
                          label: 'Payment Method',
                          onTap: () {
                            context.push(AppRoutes.addNewCard);
                          },
                        ),
                      ]),
                      const SizedBox(height: 18),

                      _buildCard([
                        _button(
                          iconPath: Assets.icons.helper.path,
                          label: 'Help Center',
                          onTap: () => _showHelpDialog(context),
                        ),
                        const SizedBox(height: 20),

                        _button(
                          iconPath: Assets.icons.mail.path,
                          label: 'Contact Us',
                          onTap: () => _contactUs(context),
                        ),
                      ]),
                      const SizedBox(height: 18),

                      _buildCard([
                        CustomButtonProfileWidget(
                          isLogout: true,
                          icon: SvgPicture.asset(
                            Assets.icons.logout.path,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          label: 'Logout',
                          onTap: () {
                            context.read<ProfileBloc>().add(
                              const ProfileLogoutPressed(),
                            );
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'About Our Store',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: const SingleChildScrollView(
            child: Text('''
Welcome to LokMarT 🛒

LokMarT is your trusted online grocery store, delivering fresh and high-quality products straight to your door.

We carefully select fruits, vegetables, meat, dairy, and everyday essentials to ensure top freshness and competitive prices.

Why choose us?

• Fast delivery
• Fresh daily products
• Secure payments
• Friendly customer support
• Easy returns

Our mission is to make grocery shopping simple, fast, and enjoyable.

If you have any questions, feel free to contact our support team anytime.

Thank you for choosing FreshMart!
            ''', style: TextStyle(fontSize: 14, height: 1.4)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(color: AppColors.orange),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  static Widget _button({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return CustomButtonProfileWidget(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
      label: label,
      onTap: onTap,
    );
  }
}

class _EditProfileDialog extends StatefulWidget {
  const _EditProfileDialog();

  @override
  State<_EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<_EditProfileDialog> {
  late final TextEditingController _username;
  late final TextEditingController _email;

  final _currentPass = TextEditingController();
  final _newPass = TextEditingController();
  final _confirmPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    final s = context.read<ProfileBloc>().state;

    _username = TextEditingController(text: s.username);
    _email = TextEditingController(text: s.email);

    _currentPass.text = s.currentPassword;
    _newPass.text = s.newPassword;
    _confirmPass.text = s.confirmPassword;

    _username.addListener(() {
      context.read<ProfileBloc>().add(ProfileUsernameChanged(_username.text));
    });
    _email.addListener(() {
      context.read<ProfileBloc>().add(ProfileEmailChanged(_email.text));
    });
    _currentPass.addListener(() {
      context.read<ProfileBloc>().add(
        ProfileCurrentPasswordChanged(_currentPass.text),
      );
    });
    _newPass.addListener(() {
      context.read<ProfileBloc>().add(ProfileNewPasswordChanged(_newPass.text));
    });
    _confirmPass.addListener(() {
      context.read<ProfileBloc>().add(
        ProfileConfirmPasswordChanged(_confirmPass.text),
      );
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _currentPass.dispose();
    _newPass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (p, n) => p.status != n.status,
      listener: (context, s) {
        if (s.status == ProfileStatus.successProfile) {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, s) {
          final bloc = context.read<ProfileBloc>();
          final authRepo = context.read<AuthRepository>();

          final isSavingProfile = s.status == ProfileStatus.savingProfile;
          final isChangingPass = s.status == ProfileStatus.changingPassword;
          final busy = isSavingProfile || isChangingPass;

          return AlertDialog(
            backgroundColor: AppColors.white,
            title: const Text('Edit profile'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // avatar row
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: _Avatar(
                          localPath: s.avatarLocalPath,
                          url: s.user?.avatarUrl,
                          toAbsoluteUrl: authRepo.toAbsoluteUrl,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed:
                              busy
                                  ? null
                                  : () => bloc.add(
                                    const ProfilePickAvatarPressed(),
                                  ),
                          icon: const Icon(
                            Icons.photo,
                            color: AppColors.orange,
                          ),
                          label: const Text(
                            'Choose photo',
                            style: TextStyle(color: AppColors.orange),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // profile fields
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _email,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 6),

                  // password fields
                  TextField(
                    controller: _currentPass,
                    decoration: const InputDecoration(
                      labelText: 'Current password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _newPass,
                    decoration: const InputDecoration(
                      labelText: 'New password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _confirmPass,
                    decoration: const InputDecoration(
                      labelText: 'Confirm new password',
                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 12),

                  if (!s.canSaveProfile)
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Profile: username>=3 + валідний email',
                        style: TextStyle(fontSize: 12, color: Colors.redAccent),
                      ),
                    ),

                  if (!s.canChangePassword &&
                      (s.currentPassword.isNotEmpty ||
                          s.newPassword.isNotEmpty ||
                          s.confirmPassword.isNotEmpty))
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password: current не пустий, new>=6 і підтвердження співпадає',
                        style: TextStyle(fontSize: 12, color: Colors.redAccent),
                      ),
                    ),

                  if (busy)
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: busy ? null : () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.orange),
                ),
              ),
              TextButton(
                onPressed:
                    (busy || !s.canChangePassword)
                        ? null
                        : () =>
                            bloc.add(const ProfileChangePasswordSubmitted()),
                child: const Text('Change password'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed:
                    (busy || !s.canSaveProfile)
                        ? null
                        : () => bloc.add(const ProfileSaveProfileSubmitted()),

                child: const Text(
                  'Save profile',
                  style: TextStyle(color: AppColors.orange),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.toAbsoluteUrl, this.url, this.localPath});

  final String Function(String) toAbsoluteUrl;
  final String? url;
  final String? localPath;

  @override
  Widget build(BuildContext context) {
    if (localPath != null && localPath!.isNotEmpty) {
      return Image.file(File(localPath!), fit: BoxFit.cover);
    }

    if (url != null && url!.isNotEmpty) {
      final full = toAbsoluteUrl(url!);
      return Image.network(
        full,
        fit: BoxFit.cover,
        errorBuilder:
            (_, __, ___) => Assets.images.man.image(fit: BoxFit.cover),
      );
    }

    // 3) fallback
    return Assets.images.man.image(fit: BoxFit.cover);
  }
}
