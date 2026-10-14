import 'package:flutter/material.dart';
import '../auth/login_.dart';
import '../services/user_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_image_widget.dart';
import '../widget/custom_profile_tile_widget.dart';
import '../widget/custom_secondary_button_widget.dart';
import 'favorites_view.dart';
import 'help_center_view.dart';
import 'my_account_view.dart';
import 'order_history_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Future<void> _open(Widget page) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    if (mounted) setState(() {}); // refresh name after editing the account
  }

  void _showLogout() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Logout', style: AppTextStyle.label.copyWith(fontSize: 16)),
            const SizedBox(height: 8),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry.',
              style: AppTextStyle.subtitle,
            ),
            const SizedBox(height: 24),
            CustomButtonWidget(
              text: 'Logout',
              onPressed: () {
                // TODO: sign out from the backend
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginView()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 12),
            CustomSecondaryButtonWidget(
              text: 'Cancel',
              onPressed: () => Navigator.pop(sheetContext),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text('Profile', style: AppTextStyle.label.copyWith(fontSize: 18)),
              const SizedBox(height: 24),
              Row(
                children: [
                  const CustomImageWidget(
                    path: UserService.avatar,
                    width: 56,
                    height: 56,
                    circle: true,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(UserService.name, style: AppTextStyle.label),
                        const SizedBox(height: 2),
                        Text(
                          UserService.phone,
                          style: AppTextStyle.subtitle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: _showLogout,
                    child: Text(
                      'Logout',
                      style: AppTextStyle.subtitle.copyWith(
                        color: AppColor.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: AppColor.inactive),
              CustomProfileTileWidget(
                icon: Icons.person,
                title: 'My Account',
                onTap: () => _open(const MyAccountView()),
              ),
              CustomProfileTileWidget(
                icon: Icons.favorite,
                title: 'Your Favorites',
                onTap: () => _open(const FavoritesView()),
              ),
              CustomProfileTileWidget(
                icon: Icons.receipt_long,
                title: 'Order History',
                onTap: () => _open(const OrderHistoryView()),
              ),
              CustomProfileTileWidget(
                icon: Icons.help,
                title: 'Help Center',
                onTap: () => _open(const HelpCenterView()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
