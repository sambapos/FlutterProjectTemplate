import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core_shelf.dart';

bool errorDialogHelper(provider, BuildContext context, [shouldPop]) {
  if (provider.errorMessage == '') {
    return true;
  } else {
    if (shouldPop != null && shouldPop) Navigator.of(context).pop();
    Utils.instance.textDialog(context, '', text: provider.errorMessage);
    provider.errorMessage = '';
    return false;
  }
}
