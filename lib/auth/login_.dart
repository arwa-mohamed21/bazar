import 'package:flutter/material.dart';
import '../services/validators.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_social_button_widget.dart';
import '../widget/custom_textfield_widget.dart';
import '../home/main_view.dart';
import 'sign_up.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: real login with AuthService
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainView()),
    );
  }

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SignUpView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text('Welcome Back 👋', style: AppTextStyle.title),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to your account',
                  style: AppTextStyle.subtitle,
                ),
                const SizedBox(height: 32),
                CustomTextFieldWidget(
                  label: 'Email',
                  hint: 'Your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  label: 'Password',
                  hint: 'Your password',
                  controller: _passwordController,
                  isPassword: true,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Password is required' : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {}, // TODO: Forgot Password
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyle.subtitle.copyWith(
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomButtonWidget(text: 'Login', onPressed: _login),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: AppTextStyle.subtitle,
                    ),
                    GestureDetector(
                      onTap: _goToSignUp,
                      child: Text(
                        'Sign Up',
                        style: AppTextStyle.subtitle.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text('or with', style: AppTextStyle.subtitle),
                ),
                const SizedBox(height: 16),
                CustomSocialButtonWidget(
                  text: 'Sign in with Google',
                  icon: Icons.g_mobiledata,
                  onPressed: () {}, // TODO: Google sign in
                ),
                const SizedBox(height: 12),
                CustomSocialButtonWidget(
                  text: 'Sign in with Apple',
                  icon: Icons.apple,
                  onPressed: () {}, // TODO: Apple sign in
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
