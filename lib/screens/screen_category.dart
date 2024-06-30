import 'dart:async';
import 'package:ecommerce_responsive/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_responsive/bloc/category/category_bloc.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:ecommerce_responsive/screens/screen_view_all_products.dart';
import 'package:ecommerce_responsive/utils/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_responsive/models/model_category.dart';
import 'package:ecommerce_responsive/utils/colors_constant.dart';
import 'package:ecommerce_responsive/utils/size_constant.dart';
import 'package:ecommerce_responsive/utils/strings_constant.dart';
import 'package:ecommerce_responsive/utils/common_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/widgets/appbar.dart';

class ScreenCategory extends StatefulWidget {
  static const String tag = '/subCategory';
  final ModelCategory? category;

  const ScreenCategory({super.key, this.category});

  @override
  ScreenCategoryState createState() => ScreenCategoryState();
}

class ScreenCategoryState extends State<ScreenCategory> {
  List<String> images = [];
  var currentIndex = 0;
  List<ProductResponse> categoryProducts = [];
  List<ProductResponse> newestProducts = [];
  List<ProductResponse> featuredProducts = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  void startTimer() {
    if (timer != null) {
      return;
    }
    timer = Timer.periodic(const Duration(seconds: 3), (time) {
      setState(() {
        if (currentIndex == images.length - 1) {
          currentIndex = 0;
        } else {
          currentIndex = currentIndex + 1;
        }
      });
    });
  }

  fetchData() {
    setState(() {
      currentIndex = 0;
      startTimer();
    });
  }

  void filterProducst(List<ProductResponse> products) {
    categoryProducts = products;
    featuredProducts.clear();
    newestProducts.clear();
    for (var product in categoryProducts) {
      if (product.featured!) {
        featuredProducts.add(product);
      }

      if (product.newArrival!) {
        newestProducts.add(product);
      }

      if (product.images!.isNotEmpty) {
        images.add(
            product.images?[0].src! ?? ConstantManager.placeholderImagePath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: DefaultAppBar(title: widget.category!.name!),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state.loadStatus != LoadStatus.success) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          filterProducst(state.categoryProducts);
          return MultiBlocListener(
            listeners: [
              BlocListener<CategoryBloc, CategoryState>(
                listener: (context, state) {
                  if ([LoadStatus.success, LoadStatus.failed]
                      .contains(state.loadStatus)) {
                    Fluttertoast.showToast(
                      msg: state.loadStatus == LoadStatus.success
                          ? "Load category successfully"
                          : "Failed load category !!!",
                      gravity: ToastGravity.TOP,
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 2,
                      webPosition: "center",
                      webBgColor: "linear-gradient(to right, #FF6347, #FA4352)",
                      backgroundColor: Colors.pinkAccent.shade700,
                    );
                  }
                },
              ),
            ],
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  images.isNotEmpty
                      ? Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: sh_view_color, width: 0.5)),
                          margin: const EdgeInsets.all(spacing_standard_new),
                          child: Image.network(images[currentIndex],
                              width: double.infinity,
                              height: height * 0.3,
                              fit: BoxFit.contain),
                        )
                      : Container(),
                  horizontalHeading(sh_lbl_newest_product, callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenViewAllProduct(
                                products: newestProducts,
                                title: sh_lbl_newest_product)));
                  }),
                  ProductHorizontalList(newestProducts),
                  const SizedBox(height: spacing_standard_new),
                  horizontalHeading(sh_lbl_Featured, callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenViewAllProduct(
                                products: featuredProducts,
                                title: sh_lbl_Featured)));
                  }),
                  ProductHorizontalList(featuredProducts),
                  const SizedBox(height: spacing_large),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
