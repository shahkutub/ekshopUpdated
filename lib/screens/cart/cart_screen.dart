import 'package:active_ecommerce_flutter/data_model/cart_item.dart';
import 'package:active_ecommerce_flutter/helpers/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toast/toast.dart';

import '../../custom/box_decorations.dart';
import '../../custom/device_info.dart';
import '../../custom/text_styles.dart';
import '../../custom/toast_component.dart';
import '../../custom/useful_elements.dart';
import '../../helpers/shared_value_helper.dart';
import '../../my_theme.dart';
import '../../presenter/cart_counter.dart';

class CartScreen extends StatefulWidget {

  CartScreen(
      {Key key, this.cartList,this.has_bottomnav, this.from_navigation = false})
      : super(key: key);
  final List<CartItem> cartList;
  final bool has_bottomnav;
  final bool from_navigation;


  @override
  State<CartScreen> createState() => _CartScreenState ();
}

class _CartScreenState extends State<CartScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<CartItem> cartList = [];
  ScrollController _mainScrollController = ScrollController();

  double _cartTotal;

  String _cartTotalString = '0';

  @override
  void initState() {
    super.initState();
    //setState(() {
      initData();
    //});
    getSetCartTotal();

  }

  @override
  void dispose() {
    super.dispose();
    _mainScrollController.dispose();
  }
  Future<void> _onRefresh() async {
    initData();
  }
  @override
  Widget build(BuildContext context) {

    print('cartList: ${widget.cartList.length}');

    return Scaffold(
        key: _scaffoldKey,
      appBar:  AppBar(
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) => widget.from_navigation
            ? UsefulElements.backToMain(context, go_back: false)
            : UsefulElements.backButton(context),
      ),
      title: Text(
        AppLocalizations.of(context).cart_screen_shopping_cart,
        style: TextStyles.buildAppBarTexStyle(),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    ),
        body: Stack(
          children: [
            RefreshIndicator(
              color: MyTheme.accent_color,
              backgroundColor: Colors.white,
              onRefresh: _onRefresh,
              displacement: 0,
              child: CustomScrollView(
                controller: _mainScrollController,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: buildCartSellerItemList(),
                      ),
                      Container(
                        height: widget.has_bottomnav ? 140 : 100,
                      )
                    ]),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomContainer(),
            )
          ],
        )
    );

  }

  initData() async {
    cartList = await DatabaseHelper.instance.getCartItems();
    print('cartList: ${cartList.length}');

  }
  SingleChildScrollView buildCartSellerItemList() {

    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 14,
        ),
        itemCount: widget.cartList.length,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return buildCartSellerItemCard(index);
        },
      ),
    );
  }
  buildCartSellerItemCard(int index) {
    return Container(
      height: 120,
      decoration: BoxDecorations.buildBoxDecoration_1(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: DeviceInfo(context).width / 4,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(6), right: Radius.zero),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/placeholder.png',
                      image: widget.cartList[index].imageUrl != null?widget.cartList[index].imageUrl:'http://13.250.177.76:3111/upload/1677348256896the_body_shop_british_rose_fresh_plumping_face_mask_-_75ml.jpg-1677348315766-.png',
                      fit: BoxFit.cover,
                    ))
            ),
            Container(
              //color: Colors.red,
              width: DeviceInfo(context).width / 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.cartList[index].name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: MyTheme.font_grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 23.0),
                      child: Row(
                        children: [
                          Text('${widget.cartList[index].price}',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: MyTheme.accent_color,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      DatabaseHelper.instance.deleteItem(widget.cartList[index].id);
                      widget.cartList.remove(widget.cartList[index]);
                      getSetCartTotal();
                      setState(() {

                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 14.0),
                        child: Image.asset(
                          'assets/trash.png',
                          height: 16,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.cartList[index].quantity = widget.cartList[index].quantity+1;
                        onQuantityIncrease(index);
                      });

                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration:
                      BoxDecorations.buildCartCircularButtonDecoration(),
                      child: Icon(
                        Icons.add,
                        color: MyTheme.accent_color,
                        size: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text('${widget.cartList[index].quantity}',
                      style:
                      TextStyle(color: MyTheme.accent_color, fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(widget.cartList[index].quantity >0){
                        widget.cartList[index].quantity = widget.cartList[index].quantity - 1;
                        onQuantityDecrease(index);
                      }
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration:
                      BoxDecorations.buildCartCircularButtonDecoration(),
                      child: Icon(
                        Icons.remove,
                        color: MyTheme.accent_color,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  Container buildBottomContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        /*border: Border(
                  top: BorderSide(color: MyTheme.light_grey,width: 1.0),
                )*/
      ),

      height: widget.has_bottomnav ? 200 : 120,
      //color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: MyTheme.soft_accent_color),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      AppLocalizations.of(context).cart_screen_total_amount,
                      style: TextStyle(
                          color: MyTheme.dark_font_grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(""+_cartTotalString.toString(),
                        style: TextStyle(
                            color: MyTheme.accent_color,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:
                        //     Border.all(color: MyTheme.accent_color, width: 1),
                        borderRadius: app_language_rtl.$
                            ? const BorderRadius.only(
                          topLeft: const Radius.circular(0.0),
                          bottomLeft: const Radius.circular(0.0),
                          topRight: const Radius.circular(6.0),
                          bottomRight: const Radius.circular(6.0),
                        )
                            : const BorderRadius.only(
                          topLeft: const Radius.circular(6.0),
                          bottomLeft: const Radius.circular(6.0),
                          topRight: const Radius.circular(0.0),
                          bottomRight: const Radius.circular(0.0),
                        )),
                    child: ElevatedButton(
                      child: Text(
                        AppLocalizations.of(context).cart_screen_update_cart,
                        style: TextStyle(
                            color: MyTheme.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        widget.cartList.forEach((element) {
                          DatabaseHelper.instance.updateItem(element);

                        });

                      },
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(color: MyTheme.accent_color, width: 1),
                        borderRadius: app_language_rtl.$
                            ? const BorderRadius.only(
                          topLeft: const Radius.circular(6.0),
                          bottomLeft: const Radius.circular(6.0),
                          topRight: const Radius.circular(0.0),
                          bottomRight: const Radius.circular(0.0),
                        )
                            : const BorderRadius.only(
                          topLeft: const Radius.circular(0.0),
                          bottomLeft: const Radius.circular(0.0),
                          topRight: const Radius.circular(6.0),
                          bottomRight: const Radius.circular(6.0),
                        )),
                    child: ElevatedButton(
                      child: Text(
                        AppLocalizations.of(context)
                            .cart_screen_proceed_to_shipping,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        //onPressProceedToShipping();
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  onQuantityIncrease(int item_index) {
    //cartList[item_index].quantity++;
    if (cartList[item_index].quantity <
        100) {
      cartList[item_index].quantity++;
      getSetCartTotal();
      setState(() {});
    } else {
      ToastComponent.showDialog(
          "${AppLocalizations.of(context).cart_screen_cannot_order_more_than} ${cartList[item_index].quantity} ${AppLocalizations.of(context).cart_screen_items_of_this}",
          gravity: Toast.center,
          duration: Toast.lengthLong);
    }
  }

  getSetCartTotal() {
    _cartTotal = 0.00;

        if (widget.cartList.length > 0) {
          widget.cartList.forEach((cart_item) {
            _cartTotal += double.parse(
                ((double.parse(cart_item.price)) * cart_item.quantity)
                    .toStringAsFixed(2));
            _cartTotalString = "${_cartTotal.toStringAsFixed(2)}";
          });
        }


    setState(() {});
  }

  onQuantityDecrease(int item_index) {
    if (cartList[item_index].quantity >
        0) {
      cartList[item_index].quantity--;
      getSetCartTotal();
      setState(() {});
    } else {
      // ToastComponent.showDialog(
      //     "${AppLocalizations.of(context).cart_screen_cannot_order_more_than} ${_shopList[seller_index].cart_items[item_index].lower_limit} ${AppLocalizations.of(context).cart_screen_items_of_this}",
      //     gravity: Toast.center,
      //     duration: Toast.lengthLong);
    }
  }

}