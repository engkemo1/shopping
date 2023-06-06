

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/add_item_controller/add_item_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../core/class/handlingdataview.dart';
import '../kimber_theme.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() =>
      _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  @override
  Widget build(BuildContext context) {
    AddItemController controller =
    Get.put(AddItemController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffe74c3c),
        title:const Text(
          'ADD item',
          style: TextStyle(fontSize: 20),
        ) ,
        leading:                        IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<AddItemController>(
        builder: (controller) => HandlingDataView(
      statusRequest: controller.statusRequest,
      widget:Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 135),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Text(
                                'Upload File',
                                style: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(
                            'Choose your file to upload',
                            style: KimberTheme.bodyText1.override(
                              fontFamily: 'NatoSansKhmer',
                              color: Color(0x96303030),
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: InkWell(
                              onTap: ()async{

                                  final XFile? pickedImage =
                                  await _picker.pickImage(source: ImageSource.gallery);
                                  if (pickedImage != null) {


                                      controller.file = File(pickedImage.path);
                                      controller.filename=pickedImage.name;
                                  }



                              },
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Browse Images',
                                            textAlign: TextAlign.center,
                                            style:
                                            KimberTheme.bodyText1.override(
                                              fontFamily: 'NatoSansKhmer',
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'PNG JPEG, WEBP (10Mb max)',
                                              textAlign: TextAlign.center,
                                              style: KimberTheme.bodyText1
                                                  .override(
                                                fontFamily: 'NatoSansKhmer',
                                                color: Color(0x80303030),
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Text(
                                'Title',
                                style: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: TextFormField(
                              controller: controller.name,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'please enter title',
                                hintStyle: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  color: Color(0x9A303030),
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: KimberTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Text(
                                'Price',
                                style: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.price,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter price',
                                hintStyle: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  color: Color(0x9A303030),
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: KimberTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Text(
                                'Count',
                                style: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.count,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Count',
                                hintStyle: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  color: Color(0x9A303030),
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: KimberTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Text(
                                'Discount',
                                style: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: TextFormField(
                              keyboardType: TextInputType.number,

                              controller: controller.discount,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Discount',
                                hintStyle: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  color: Color(0x9A303030),
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: KimberTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Text(
                                'Description',
                                style: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: TextFormField(
                              controller: controller.disc,
                              obscureText: false,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Enter Description',
                                hintStyle: KimberTheme.bodyText1.override(
                                  fontFamily: 'NatoSansKhmer',
                                  color: Color(0x9A303030),
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x65757575),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: KimberTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 1),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          color: const Color(0xffe74c3c),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 10,),
                            SizedBox(

                              width: MediaQuery.of(context).size.width*0.8,

                              child: ElevatedButton(
                                onPressed: () {
                                  controller.addItem();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black54, // Background color
                                ),
                                child: const Text(
                                  'ADD',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 32),
                                    child: Text(
                                      'Publishing you confirm that all the materials were created by yourseft & don\'t infringe any rights.',
                                      textAlign: TextAlign.center,
                                      style: KimberTheme.bodyText1.override(
                                        fontFamily: 'NatoSansKhmer',
                                        color: Colors.white,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
