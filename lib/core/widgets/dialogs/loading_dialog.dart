import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // ignore: avoid_types_on_closure_parameters
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: context.lowCircular),
            backgroundColor: Colors.grey[300],
            content: const LoadingIndicator(),
          ),
        );
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.mediumEdgeInsets,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getLoadingIndicator(context),
          _getHeading(context),
        ],
      ),
    );
  }

  Padding _getLoadingIndicator(BuildContext context) {
    return Padding(
      padding: context.bottomMedium,
      child: SizedBox(
        width: context.height * 6,
        height: context.height * 6,
        child: const CircularProgressIndicator(strokeWidth: 3),
      ),
    );
  }

  Widget _getHeading(BuildContext context) {
    return Padding(
      padding: context.bottomLow,
      child: AutoSizeText(
        'please_wait'.translate,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
