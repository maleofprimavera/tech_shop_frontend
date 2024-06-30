import 'package:ecommerce_responsive/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:ecommerce_responsive/screens/screen_cart.dart';
import 'package:ecommerce_responsive/utils/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_responsive/utils/strings_constant.dart';

class ScreenOrderSummary extends StatefulWidget {
  static const String tag = '/orderSummary';

  const ScreenOrderSummary({super.key});

  @override
  ScreenOrderSummaryState createState() => ScreenOrderSummaryState();
}

class ScreenOrderSummaryState extends State<ScreenOrderSummary> {
  List<ProductResponse>? orderList = [];
  @override
  void initState() {
        context.read<CartBloc>().add(const GetCartProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///todo: remove address box for now
    // var address = addressList.isNotEmpty?
    // Card(
    //   child: Container(
    //     width: double.infinity,
    //     constraints: const BoxConstraints(maxWidth: 480),
    //     padding: const EdgeInsets.all(spacing_standard_new),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text("${addressList[selectedPosition].first_name!} ${addressList[selectedPosition].last_name!}", style: boldTextStyle(size: 18),),
    //         4.height,
    //         Text(addressList[selectedPosition].address.toString(), style: primaryTextStyle()),
    //         Text("${addressList[selectedPosition].city!},${addressList[selectedPosition].state!}", style: secondaryTextStyle()),
    //         Text("${addressList[selectedPosition].country!},${addressList[selectedPosition].pinCode!}", style: secondaryTextStyle()),
    //         16.height,
    //         Text(addressList[selectedPosition].phone_number.toString(), style: secondaryTextStyle()),
    //         16.height,
    //         SizedBox(
    //           width: double.infinity,
    //           height: 45,
    //           child: RoundedButton(
    //             title: sh_lbl_change_address,
    //               color: sh_colorPrimary,
    //               titleColor: sh_white,
    //               onPress:() async {
    //               ///todo: remove this feature for now
    //                 // // var pos = await Get.toNamed(ScreenAddressManager.tag) ?? selectedPosition;
    //                 // setState(() {
    //                 //   selectedPosition = pos;
    //                 // });
    //               },
    //           )
    //         )
    //       ],
    //     ),
    //   ),
    // ): const SizedBox.shrink();
    return Scaffold(
      appBar: const DefaultAppBar(title: sh_order_summary),
      body: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state.loadStatus != LoadStatus.success) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Column(
                      children: <Widget>[
                        ScreenCartState.paymentDetail(
                            context.read<CartBloc>().state.cartProducts),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
