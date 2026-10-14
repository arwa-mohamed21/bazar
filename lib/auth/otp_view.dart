import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';
import 'congratulations_view.dart';

class OtpView extends StatefulWidget {
  final String contact;
  const OtpView({super.key, this.contact = 'your email'});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  static const int _length = 4;
  String _code = '';
  int _seconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _seconds = 30);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_seconds == 0) {
        t.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  void _onKey(String digit) {
    if (_code.length < _length) setState(() => _code += digit);
  }

  void _onDelete() {
    if (_code.isNotEmpty) {
      setState(() => _code = _code.substring(0, _code.length - 1));
    }
  }

  void _resend() {
    // TODO: send the code again
    setState(() => _code = '');
    _startTimer();
  }

  void _continue() {
    // TODO: verify the code with the backend
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const CongratulationsView()),
    );
  }

  Widget _codeBox(int index) {
    final hasDigit = index < _code.length;
    final isCurrent = index == _code.length;
    return Container(
      width: 56,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.secondaryButton,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrent ? AppColor.primary : AppColor.inactive,
          width: isCurrent ? 2 : 1,
        ),
      ),
      child: Text(hasDigit ? _code[index] : '', style: AppTextStyle.title),
    );
  }

  Widget _key(String label, {VoidCallback? onTap, IconData? icon}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 60,
          child: Center(
            child: icon != null
                ? Icon(icon, color: Colors.white, size: 24)
                : Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _keyboard() {
    Widget row(List<String> keys) => Row(
      children: keys.map((k) => _key(k, onTap: () => _onKey(k))).toList(),
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            row(['1', '2', '3']),
            row(['4', '5', '6']),
            row(['7', '8', '9']),
            Row(
              children: [
                _key(''),
                _key('0', onTap: () => _onKey('0')),
                _key('', icon: Icons.backspace_outlined, onTap: _onDelete),
              ],
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
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 16),
                    const Text('Verification', style: AppTextStyle.title),
                    const SizedBox(height: 8),
                    Text(
                      'Please enter the code we just sent to\n${widget.contact}',
                      style: AppTextStyle.subtitle,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_length, _codeBox),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: _seconds > 0
                          ? Text(
                              "If you didn't receive a code? Resend in ${_seconds}s",
                              style: AppTextStyle.subtitle,
                            )
                          : GestureDetector(
                              onTap: _resend,
                              child: Text(
                                'Resend code',
                                style: AppTextStyle.subtitle.copyWith(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 28),
                    CustomButtonWidget(
                      text: 'Continue',
                      onPressed: _code.length == _length ? _continue : null,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _keyboard(),
          ],
        ),
      ),
    );
  }
}
