import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter_application_1/view/widget/home/customcardhome.dart';
import 'package:flutter_application_1/view/widget/home/customtitlehome.dart';
import 'package:flutter_application_1/view/widget/home/listcategorieshome.dart';
import 'package:flutter_application_1/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(

        builder: (controller) => Container(

            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  hasIconBack: false,
                  mycontroller: controller.search!,
                  iconData:  Icons.favorite_border_outlined,
                  titleappbar: "Find Product",
                  // onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavroite);
                  },
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ?  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHome(title: " ", body: ""),
                              CustomTitleHome(title: "Categories"),
                              ListCategoriesHome(),

                              CustomTitleHome(title: "Product for you"),
                             controller.isLoading2==true?
                                CircularProgressIndicator() :
                              ListItemsHome(),
                            ],
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata)),
                const CustomTitleHome(title: "Offer"),
                 controller.isLoading==true?
                const Center(child: CircularProgressIndicator(),) :
                const ListItemsHome()
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
