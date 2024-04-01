import 'package:flutter/material.dart';
import 'package:online/pages/home_page.dart';

import 'package:provider/provider.dart';

import '../model/cart_model.dart';

class PayNow extends StatelessWidget {
  final _textController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Confirm Payment"),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 350,
                    width: 800,
                    color: Colors.blueAccent,
                    child: Column(
                      children: [
                        const Text("Pay With MTN Mobile Money"),
                 const       SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: TextField(
                            controller: _textController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Enter Mobile Number?",
                                errorText:
                                    _validate ? "Please Enter a Number" : null,
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _textController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                )),
                          ),
                        ),
                        SizedBox(height: 60),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(color: Colors.green[200]),
                                  ),

                                  const SizedBox(height: 8),
                                  // total price
                                  Text(
                                    '\$${value.calculateTotal()} RWF',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                           
       
            GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return successful();
                                    },
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green.shade200),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  padding: const EdgeInsets.all(7),
                                  child: Row(
                                    children: const [
                                    Text(
                                        'Pay Now',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ), SizedBox(width: 10,),
                                      Icon(
                                        Icons.payment,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // pay now
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          );
        },),);
  }
}

class successful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text("Payment Successful"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Your Payment Was Successful, Thanks For Ordering"),
            Icon(
              Icons.payment,
              size: 30,
            )
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
