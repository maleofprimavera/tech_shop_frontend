
import 'package:ecommerce_responsive/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:ecommerce_responsive/utils/constant_manager.dart';
import 'package:ecommerce_responsive/utils/extension/currency_extension.dart';
import 'package:ecommerce_responsive/utils/widgets/appbar.dart';
import 'package:ecommerce_responsive/utils/widgets/cart_item_V2.dart';
import 'package:ecommerce_responsive/utils/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:nb_utils/nb_utils.dart';
import 'package:ecommerce_responsive/screens/screen_order_summary.dart';
import 'package:ecommerce_responsive/utils/colors_constant.dart';
import 'package:ecommerce_responsive/utils/size_constant.dart';
import 'package:ecommerce_responsive/utils/strings_constant.dart';
import 'package:ecommerce_responsive/utils/widgets/app_widget.dart';

class ScreenCart extends StatefulWidget {
  static const String tag = '/cart';

  const ScreenCart({super.key});

  @override
  ScreenCartState createState() => ScreenCartState();
}

class ScreenCartState extends State<ScreenCart> {
  List<ProductResponse>? cartList = [];

  @override
  void initState() {
    context.read<CartBloc>().add(const GetCartProductsEvent());
    super.initState();
  }

  static Widget paymentDetail(List<ProductResponse> productList) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(spacing_standard_new,
                    spacing_middle, spacing_standard_new, spacing_middle),
                child: Text(sh_lbl_payment_details,
                    style: boldTextStyle(size: 14)),
              ),
              const Divider(height: 1, color: sh_view_color),
              Padding(
                padding: const EdgeInsets.fromLTRB(spacing_standard_new,
                    spacing_middle, spacing_standard_new, spacing_middle),
                child: Column(
                  children: [
                    Row(
                      children: [
                        text(sh_lbl_offer, fontSize: 14),
                        4.width,
                        Text(sh_text_offer_not_available,
                            style: primaryTextStyle(size: 14)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        text(sh_lbl_shipping_charge, fontSize: 14),
                        text(sh_lbl_free,
                            textColor: Colors.green,
                            fontFamily: fontMedium,
                            fontSize: 14),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        text(sh_lbl_total_amount, fontSize: 14),
                        text(
                            productList
                                    .map(
                                      (e) => e.salePrice,
                                    )
                                    .toList()
                                    .reduce((value, element) {
                                      return (value ?? 0) + (element ?? 0);
                                    })
                                    .toString()
                                    .toCurrencyFormat() ??
                                "Updating",
                            textColor: sh_colorPrimary,
                            fontFamily: fontBold,
                            fontSize: 14),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget bottomButtons(List<ProductResponse> productList) => Container(
        height: 65,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: sh_shadow_color,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 3)),
        ], color: sh_white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: context.cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      productList
                              .map(
                                (e) => e.salePrice,
                              )
                              .toList()
                              .reduce((value, element) {
                                return (value ?? 0) + (element ?? 0);
                              })
                              .toString()
                              .toCurrencyFormat() ??
                          "Updating",
                      style: boldTextStyle()),
                  Text(sh_lbl_see_price_detail, style: secondaryTextStyle()),
                ],
              ),
            ).expand(),
            Container(
              color: sh_colorPrimary,
              alignment: Alignment.center,
              height: double.infinity,
              child: text(sh_lbl_continue,
                  textColor: sh_white,
                  fontSize: textSizeLargeMedium,
                  fontFamily: fontMedium),
            )
                .onTap(
                  () => Get.toNamed(ScreenOrderSummary.tag),
                )
                .expand()
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: "Cart",
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => previous != current,
        buildWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (Get.routing.current.contains(ScreenCart.tag) &&
              [LoadStatus.success, LoadStatus.failed]
                  .contains(state.loadStatus)) {
            if (!StaticVarManager.isShowToast) {
              StaticVarManager.isShowToast = true;
              Fluttertoast.showToast(
                msg: state.loadStatus == LoadStatus.success
                    ? "Succeeded"
                    : "Failed",
                gravity: ToastGravity.TOP,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 2,
                webPosition: "center",
                webBgColor: "linear-gradient(to right, #FF6347, #FA4352)",
                backgroundColor: Colors.pinkAccent.shade700,
              ).then(
                (value) {
                  StaticVarManager.isShowToast = false;
                },
              );
            }
          }
        },
        builder: (context, state) {
          if ([LoadStatus.loading, LoadStatus.pure, LoadStatus.failed]
              .contains(state.loadStatus)) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      cartListWidget(context, width),
                      50.height,
                      bottomButtons(
                          context.read<CartBloc>().state.cartProducts),
                      80.height,
                    ],
                  ),
                ),
                const Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter, child: Footer())),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget cartListWidget(BuildContext context, double width) {
    return context.isDesktop()
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: width < 840 ? 2 : 2.8),
            itemCount: context.read<CartBloc>().state.cartProducts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return IntrinsicHeight(
                  child: CartItemV2(
                      item:
                          context.read<CartBloc>().state.cartProducts[index]));
            })
        : ListView.builder(
            itemCount: cartList?.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: spacing_standard_new),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CartItemV2(item: cartList?[index]);
            });
  }
}
