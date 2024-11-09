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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Text(
                context.locale.welcomeMessage,
                style: context.easyTheme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 12.0),
              Text(
                context.locale.unlockFeaturesMessage,
                textAlign: TextAlign.start,
                style: context.easyTheme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12.0),
              Text(context.locale.welcomeLoginMessage,
                  style: context.easyTheme.textTheme.bodyMedium),
              const SizedBox(height: 50.0),
              DefaultButtonWidget(
                  text: context.locale.loginButton,
                  onPressed: () => Utils.openNewPage(const LoginScreen())),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
