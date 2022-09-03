import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class WillPopScopeComponent extends StatefulWidget {
  final Widget child;
  const WillPopScopeComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<WillPopScopeComponent> createState() => _WillPopScopeComponentState();
}

class _WillPopScopeComponentState extends State<WillPopScopeComponent> {
  // will the user exit the scope of this widget
  Future<bool> _onWillPop() async {
    return await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            title: CustomTextWidget(
              textAlign: TextAlign.center,
              text: 'Are you sure?',
              color: BrandColors.colorGreen,
              fontWeight: FontWeight.w900,
            ),
            content: CustomTextWidget(
              textAlign: TextAlign.center,
              text: 'Do you want to exit an App',
              color: BrandColors.colorText,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    text: 'No',
                    width: 120.0,
                    buttonColor: BrandColors.colorDarkGreen,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Yes',
                    width: 120.0,
                    buttonColor: BrandColors.kErrorColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: widget.child,
    );
  }
}
