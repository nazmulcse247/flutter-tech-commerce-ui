import 'package:flutter/material.dart';
import 'package:flutter_tech_commerce_ui/core/constants/app_colors.dart';
import 'package:flutter_tech_commerce_ui/core/constants/app_constants.dart';
import 'package:flutter_tech_commerce_ui/core/constants/app_text_styles.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppConstants.paddingXL,),

              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppConstants.paddingL),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppConstants.radiusL),
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedShoppingBag01,
                         color: AppColors.white,
                         size: 48,
                         ),
                    ),
                    SizedBox(height: AppConstants.paddingL,),
                    Text('Welcome Back!',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textSecondary),
                    ),
                    SizedBox(height: AppConstants.paddingS,),
                    Text(
                      'Sign in to continue shopping',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: AppConstants.paddingXL * 2),
              Text(
                'Email',
                style: AppTextStyles.titleSmall
                ),
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

              Text(
                'Password',
                style: AppTextStyles.titleSmall,
                ),
                const SizedBox(height: AppConstants.paddingS),

            ],

          ),
        )
        ),
    );
  }
}