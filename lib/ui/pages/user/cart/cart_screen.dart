import 'package:flutter/material.dart';
import 'package:test1/ui/pages/user/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CheckOurCard(),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      height: 110.0,
      decoration: BoxDecoration(
        color: Color(0xfff9fafb),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20.0,
            color: Color(0xFFDADADA).withOpacity(0.25),
          )
        ],
      ),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.all(10.0),
          //       height: 40.0,
          //       width: 40.0,
          //       decoration: BoxDecoration(
          //         color: Color(0xFFF5F5F9),
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       child: Icon(
          //         Icons.receipt_rounded,
          //         color: Theme.of(context).primaryColor,
          //       ),
          //     ),
          //     Spacer(),
          //     Text('Add voucher code'),
          //     const SizedBox(
          //       width: 10.0,
          //     ),
          //     Icon(Icons.arrow_forward)
          //   ],
          // ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Total: \n",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: "\$337.15",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 190.0,
                child: ElevatedButton(
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 30.0,
                      right: 30.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
