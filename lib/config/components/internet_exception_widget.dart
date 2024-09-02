import 'package:blocprovider_clean_coding/config/color/colors.dart';
import 'package:flutter/material.dart';

class InternetExecpetionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExecpetionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'We are unable to show results.\n Please check your internet\nconnection.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(elevation: MaterialStatePropertyAll(20),
            backgroundColor: MaterialStatePropertyAll(AppColors.buttonColor)),
            child: Center(
              child: Text(
                'RETRY',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ))
      ],
    );
  }
}
