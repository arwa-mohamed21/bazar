import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../services/validators.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_textfield_widget.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: UserService.name);
  final _emailController = TextEditingController(text: UserService.email);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: send the new data to the backend
    UserService.name = _nameController.text.trim();
    UserService.email = _emailController.text.trim();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Changes saved')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'My Account',
                      style: AppTextStyle.label.copyWith(fontSize: 18),
                    ),
                  ],
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
                const SizedBox(height: 32),
                CustomButtonWidget(text: 'Save Changes', onPressed: _save),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
