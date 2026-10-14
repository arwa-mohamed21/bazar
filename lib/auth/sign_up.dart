import 'package:flutter/material.dart';
import '../services/validators.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_textfield_widget.dart';
import 'login_.dart';
import 'otp_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _password = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpView()));
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
    );
  }

  Widget _rule(String text, bool passed) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(
            passed ? Icons.check_circle : Icons.cancel,
            size: 16,
            color: passed ? AppColor.success : AppColor.error,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyle.subtitle.copyWith(
              fontSize: 12,
              color: passed ? AppColor.success : AppColor.error,
            ),
          ),
        ],
      ),
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
                const SizedBox(height: 20),
                const Text('Sign Up', style: AppTextStyle.title),
                const SizedBox(height: 8),
                const Text(
                  'Create account and choose favorite menu',
                  style: AppTextStyle.subtitle,
                ),
                const SizedBox(height: 28),
                CustomTextFieldWidget(
                  label: 'Name',
                  hint: 'Your name',
                  controller: _nameController,
                  validator: Validators.name,
                ),
                const SizedBox(height: 20),
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
                  validator: Validators.password,
                  onChanged: (v) => setState(() => _password = v),
                ),
                const SizedBox(height: 6),
                _rule(
                  'Minimum 8 characters',
                  Validators.hasMinLength(_password),
                ),
                _rule(
                  'At least 1 number (1-9)',
                  Validators.hasNumber(_password),
                ),
                _rule(
                  'At least lowercase or uppercase letters',
                  Validators.hasUpperAndLower(_password),
                ),
                const SizedBox(height: 28),
                CustomButtonWidget(text: 'Register', onPressed: _register),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account? ',
                      style: AppTextStyle.subtitle,
                    ),
                    GestureDetector(
                      onTap: _goToLogin,
                      child: Text(
                        'Sign In',
                        style: AppTextStyle.subtitle.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
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
