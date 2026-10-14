import 'package:flutter/material.dart';
import '../home/main_view.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';

class CongratulationsView extends StatelessWidget {
  const CongratulationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              const Icon(
                Icons.check_circle,
                size: 110,
                color: AppColor.primary,
              ),
              const SizedBox(height: 24),
              const Text('Congratulations!', style: AppTextStyle.title),
              const SizedBox(height: 12),
              const Text(
                'Your account is complete, please enjoy the best menu from us.',
                textAlign: TextAlign.center,
                style: AppTextStyle.subtitle,
              ),
              const Spacer(),
              CustomButtonWidget(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainView()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
