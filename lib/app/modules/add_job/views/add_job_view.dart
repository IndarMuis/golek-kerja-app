import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_job_controller.dart';

class AddJobView extends GetView<AddJobController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddJobView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddJobView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
