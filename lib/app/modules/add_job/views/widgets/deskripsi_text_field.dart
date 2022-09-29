
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lokerku/app/modules/add_job/controllers/add_job_controller.dart';
// import 'package:lokerku/app/modules/add_job/views/widgets/add_job_content.dart';

// class DeskripsiTextField extends StatefulWidget {
//   final int index;
//   DeskripsiTextField(this.index);
//   @override
//   _DeskripsiTextFieldState createState() => _DeskripsiTextFieldState();
// }

// class _DeskripsiTextFieldState extends State<DeskripsiTextField> {
//   late TextEditingController _nameController;
//   var controller = Get.put(AddJobController());
  
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       _nameController.text = controller.deskripsiList[widget.index] ?? '';
//     });

//     return TextFormField(
//       controller: _nameController,
//       onChanged: (v) => controller[widget.index] = v,
//       decoration: InputDecoration(
//         hintText: 'Enter your friend\'s name'
//       ),
//       validator: (v){
//         if(v.trim().isEmpty) return 'Please enter something';
//         return null;
//       },
//     );
//   }
// }