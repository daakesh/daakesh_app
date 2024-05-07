import 'package:daakesh/src/core/core.export.dart';
import 'package:daakesh/src/features/authentication/authentication.export.dart';
import 'package:flutter/material.dart';

class GuestAlarmWidget extends StatelessWidget {
  const GuestAlarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: LayoutBuilderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Text(
                'Welcome! To Daakesh',
                style: context.easyTheme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Unlock All Features by Logging In',
                style: context.easyTheme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12.0),
              Text(
                  'Welcome! To unlock all features and personalize your experience, please log in or sign',
                  style: context.easyTheme.textTheme.bodyMedium),
              const SizedBox(height: 50.0),
              DefaultButtonWidget(
                  text: 'LOGIN',
                  onPressed: () => Utils.openNewPage(const WelcomeScreen())),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
