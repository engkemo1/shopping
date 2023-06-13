import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../controller/add_item_controller/add_item_controller.dart';
import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';

class MyProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemController = Get.put(AddItemController());

    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.all(1),
            child: GetBuilder<AddItemController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView(children: [
                        CustomAppBar(
                          hasIconBack: true,
                          mycontroller: TextEditingController(),
                          titleappbar: "Find Product",
                          // onPressedIcon: () {},
                          onPressedSearch: () {},
                          onChanged: (val) {},
                          onPressedIconFavorite: () {},
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(
                            controller.itemsModelList.length,
                            (index) => InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Hero(
                                              tag: "item",
                                              child: CachedNetworkImage(
                                                imageUrl: controller
                                                    .itemsModelList[index]
                                                    .itemsImage
                                                    .toString(),
                                                height: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                controller.itemsModelList[index]
                                                    .itemsName
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "${controller.itemsModelList[index].itemsPrice} \$",
                                                    style: const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "sans")),
                                                IconButton(
                                                    onPressed: () {
                                                      controller.deleteItem(
                                                          controller
                                                              .itemsModelList[
                                                                  index]
                                                              .itemsId
                                                              .toString());
                                                      controller.getItem();
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color:
                                                          AppColor.primaryColor,
                                                    ))
                                              ],
                                            )
                                          ]),
                                    ),
                                  ),
                                )))
                      ]),
                    ))));
  }
}
