// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mars/themes/themes.dart';
import 'package:mars/widgets/widgets.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CSScaffold(
      title: 'Not Found',
      child: Center(
        heightFactor: 2,
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Text(
            'Page not found',
            style: context.textBody(fontWeight: FontWeight.normal, bold: true),
          ),
        ),
      ),
    );
  }
}
