import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class Trans {
  late int recamount; 
  late String title;
  late DateTime date;

  Trans( this.title, this.recamount,  this.date);
}

class RazorpayPage extends StatefulWidget {
   RazorpayPage({super.key,required this.Title}) ;
  String  Title;

  @override
  State<RazorpayPage> createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late int recamount; 
  late String title;
  late DateTime date;

  // Trans trans = Trans(title: title, recamount: recamount, date: date);

  void openCheckout(amount)  {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'Ashirwad',
      'prefill': {
        'contact': '8308112825',
        'email': 'ashirwadkatkamwar@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
      print("options opened");
    } catch (e) {
      print("error in opening options");
      debugPrint('Error : e');
    }
  }

  void _recordAmount(int amt) {
    recamount = amt;
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    
    Fluttertoast.showToast(
        msg: "Payment successful ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "Payment successful ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              'https://pixlok.com/wp-content/uploads/2021/05/flutter-logo-300x300.jpg',
              height: 100,
              width: 300,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Welcome to Payment gateway',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    autofocus: false,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Enter amount to be paid',
                      labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: amtController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please valid amount';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
              height: 30,
            ),
                  TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Enter Donor Name',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please valid name';
                  } else {
                    return null;
                  }
                },
              ),
                ],
              ),
              
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {

                  final url = Uri.https(
          "widgetwizards-c50c8-default-rtdb.firebaseio.com", 'user.json');
      final response = await http.post(url,
          headers: {
            'Content-type': 'crises/json',
          },
          body: json.encode({
            'name':nameController.text,
            'title' : widget.Title,
            'amount' : int.parse(amtController.text.toString()),
            // 'image': ImageUrl,
          }));
      print(response);


                  setState(() {
                    int amount = int.parse(amtController.text.toString());
                    recamount = amount;
                    openCheckout(amount);
                  });

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Make Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
