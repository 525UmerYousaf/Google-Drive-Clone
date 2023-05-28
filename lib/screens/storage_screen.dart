import 'package:flutter/material.dart';

import '../widgets/storage_container.dart';
import '../widgets/upload_options.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const [
          SizedBox(height: 40),
          StorageContainer(),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: UploadOptions(),
          ),
        ],
      ),
    );
  }
}
