import 'package:flutter/material.dart';
import 'package:flutter_tech_commerce_ui/core/constants/app_colors.dart';
import 'package:flutter_tech_commerce_ui/core/constants/app_constants.dart';
import 'package:flutter_tech_commerce_ui/core/constants/app_text_styles.dart';
import 'package:flutter_tech_commerce_ui/features/auth/home/home_screen.dart';
import 'package:flutter_tech_commerce_ui/features/auth/register_screen.dart';
import 'package:flutter_tech_commerce_ui/widgets/como_button.dart';
import 'package:flutter_tech_commerce_ui/widgets/como_text_field.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppConstants.paddingM),

              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppConstants.paddingL),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusL,
                        ),
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedShoppingBag01,
                        color: AppColors.white,
                        size: 48,
                      ),
                    ),
                    SizedBox(height: AppConstants.paddingL),
                    Text(
                      'Welcome Back!',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: AppConstants.paddingS),
                    Text(
                      'Sign in to continue shopping',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingL * 2),
              Text('Email', style: AppTextStyles.titleSmall.copyWith(color: AppColors.primary)),
              const SizedBox(height: AppConstants.paddingS),
              ComoTextField(
                controller: _emailController,
                hint: 'Enter your email',
                prefixIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedMail02,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: AppConstants.paddingL),

              Text('Password', style: AppTextStyles.titleSmall.copyWith(color: AppColors.primary)),
              const SizedBox(height: AppConstants.paddingS),

              ComoTextField(
                controller: _passwordController,
                hint: 'Enter your password',
                prefixIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedLockPassword,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: HugeIcon(
                    icon: _isPasswordVisible
                        ? HugeIcons.strokeRoundedView
                        : HugeIcons.strokeRoundedViewOff,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: AppConstants.paddingM),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        activeColor: AppColors.textSecondary,
                        
                      ),
                      Text('Remember me', style: AppTextStyles.bodyMedium.copyWith(color:AppColors.primary)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingL),
              ComoButton(
                text: 'Sign in',
                isFullWidth: true,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
              ),

              const SizedBox(height: AppConstants.paddingL),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.border)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingM,
                    ),
                    child: Text(
                      'Or continue with',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.border)),
                ],
              ),
              const SizedBox(height: AppConstants.paddingL),
              Row(
                children: [
                  Expanded(
                    child: _buildSocialButton(
                      'Google',
                      HugeIcons.strokeRoundedGoogle,
                      () {},
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingM),
                  Expanded(
                    child: _buildSocialButton(
                      'Apple',
                      HugeIcons.strokeRoundedApple,
                      () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppConstants.paddingM),
              
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.bodyMedium.copyWith(color:AppColors.primary),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, IconData icon, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingM),
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(
            icon: icon,
            color: AppColors.textPrimary,
            size: 20,
          ),
          const SizedBox(width: AppConstants.paddingS),
          Text(
            text,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
