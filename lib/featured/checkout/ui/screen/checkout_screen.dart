import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/checkout/provider/payment_provider.dart';
import 'package:flutter_food_app1/featured/checkout/ui/components/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    //final paymentProvider = Provider.of<PaymentProvider>(context);
    return Scaffold(
      backgroundColor: brandSecondaryColor,
      body: SizedBox(
        height: SizeUtils.screenHeight,
        width: SizeUtils.screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 30, right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Consumer<PaymentProvider>(builder: (context, paymentProvider, child) {
               return Column(
                 children: [
                   // back
                   CustomBackBtn(
                     onTap: () {
                       Navigator.pop(context);
                     },
                     title: 'Checkout',
                   ),
                   const SizedBox(height: 28),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       _text(text: 'Payment Method'),
                       GestureDetector(
                         onTap: (){},
                         child: Row(
                           children: const [
                             Icon(Icons.add,color: brandColor,size: 18,),
                             CustomTextOne(text: 'Add',textColor: brandColor),

                           ],
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 16),
                   //Payment Method
                   PaymentContainer(
                     paymentValue: PaymentValue.google,
                     icon: 'assets/icons/google-icon.svg',
                     text: _text(text: 'Google Pay'),
                     selectedValue: PaymentValue.google,
                     groupValue: paymentProvider.payment,
                     onTap: (){
                       paymentProvider.getSelectedMethod(PaymentValue.google);
                     },
                     onChange: (value){
                       paymentProvider.getSelectedMethod(value);
                     },
                   ),
                   const SizedBox(height: 14),
                   PaymentContainer(
                     paymentValue: PaymentValue.masterCard,

                     icon: 'assets/icons/mastercard.svg',
                     text: _text(text: 'Master Card'),
                     selectedValue: PaymentValue.masterCard,
                     groupValue: paymentProvider.payment,
                     onTap: (){
                       paymentProvider.getSelectedMethod(PaymentValue.masterCard);
                     },
                     onChange: (value){
                       paymentProvider.getSelectedMethod(value);
                     },
                   ),
                   const SizedBox(height: 14),
                   PaymentContainer(
                     paymentValue: PaymentValue.paypal,

                     icon: 'assets/icons/paypal.svg',
                     text: _text(text: 'Paypal'),
                     selectedValue: PaymentValue.paypal,
                     groupValue: paymentProvider.payment,
                     onTap: (){
                       paymentProvider.getSelectedMethod(PaymentValue.paypal);
                     },
                     onChange: (value){
                       paymentProvider.getSelectedMethod(value);
                       print(value);
                     },
                   ),

                 ],
               );
             },),

             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 _text(text: 'Delivery Address'),
                 const SizedBox(height: 16),
                 CustomContainer(
                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                   radius: 06,
                   width: double.infinity,
                   color: Colors.white,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           _text(text: '123 Newyork,Ny',color: brandSGrayColor,fontSize: 14,),
                           const SizedBox(height: 03),
                           _text(text: '11201, USA',color: brandSGrayColor,fontSize: 14,),
                         ],
                       ),
                       GestureDetector(
                         onTap: (){},
                         child: const Icon(Icons.edit,color: brandSGrayColor,size: 22,),
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(height: 20),
                 // Total price
                 CustomContainer(
                   padding:
                   const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                   height: SizeUtils.getProportionateScreenHeight(140),
                   color: Colors.white,
                   width: double.maxFinite,
                   radius: 12,
                   child: const TotalPrice(
                     subtotal: r'$14.20',
                     deliveryFee: r'$2.10',
                     total: r'$16.30',
                   ),
                 ),
                 const SizedBox(height: 45),
                 // Footer button
                 CustomBtn(
                   height: 50,
                   borderRadius: 50,
                   text: 'Checkout',
                   onPressed: () {
                     showModalBottomSheet<dynamic>(
                       context: context,
                       isScrollControlled: true,
                       shape: const RoundedRectangleBorder(
                         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                       ),
                       builder: (context) {
                       return SizedBox(
                         height: SizeUtils.getProportionateScreenHeight(610),
                         child: OrderSuccessful(),
                       );
                     },);
                   },
                 ),
               ],
             ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text({
    required String text,
    double? fontSize,
    Color? color,
  }){
    return  CustomTextOne(
      fontSize: fontSize,
      text: text,
      textColor: color,
      fontWeight: FontWeight.w500,
      textOverflow: TextOverflow.ellipsis,
    );
  }
}
