import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/widgets/bottom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';

var ID;
double sumTransactions = 0;
double groceriesTransactions = 0;
double leisureTransactions = 0;
double fuelTransactions = 0;
double cosmeticsTransactions = 0;
double healthTransactions = 0;


class ButtonAddTransaction extends StatefulWidget {
  const ButtonAddTransaction({Key? key}) : super(key: key);


  @override
  State<ButtonAddTransaction> createState() => _ButtonAddTransactionState();
}

class _ButtonAddTransactionState extends State<ButtonAddTransaction> {

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7,  bottom: MediaQuery.of(context).size.height * 0.05),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.orangeAccent, width: 2),
                ),
                onPressed: () async{

                  print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                  print(groceriesTransactions);
                  print(leisureTransactions);
                  print(fuelTransactions);
                  print(cosmeticsTransactions);
                  print(healthTransactions);

                  print(valueChosen);
                    setState(() {
                      sumTransactions = sumTransactions + double.parse(userInput);


                      if(valueChosen == "Groceries"){
                        groceriesTransactions = groceriesTransactions + double.parse(userInput);
                      }
                      else if(valueChosen == 'Leisure'){
                        leisureTransactions = leisureTransactions + double.parse(userInput);
                      }
                      else if(valueChosen == 'Fuel'){
                        fuelTransactions = fuelTransactions + double.parse(userInput);
                      }
                      else if(valueChosen == 'Cosmetics'){
                        cosmeticsTransactions = cosmeticsTransactions + double.parse(userInput);
                      }
                      else if(valueChosen == 'Health'){
                        healthTransactions = healthTransactions + double.parse(userInput);
                      }

                    });

                    ID = FirebaseAuth.instance.currentUser?.uid;
                    await FirebaseFirestore.instance
                        .collection('transactions')
                        .add({
                      'userID': ID,
                      "transfer_amount": double.parse(userInput),
                      "category_name": valueChosen,
                      // "summa": sumTransactions,
                      "time": '${DateTime.now()}',
                      // "category_icon": valueIcon.toString(),
                      "date": '${DateTime.now().day.toString().length<2? "0${DateTime.now().day}":DateTime.now().day} / ${DateTime.now().month.toString().length<2? "0${DateTime.now().month}":DateTime.now().month} / ${DateTime.now().year}',

                    });

                    if(valueChosen == "Groceries"){
                      // groceriesTransactions += double.parse(userInput);
                      print("LLLLLLLLLLOOOOOOOOOOOOOKKKKKKKKK HHHHHHHHHere");
                      print(groceriesTransactions);
                      chartData.add(ChartData(valueChosen, groceriesTransactions));
                      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                        "summa": sumTransactions,
                        'groceries_summa': groceriesTransactions,
                      });
                    }
                    else if(valueChosen == 'Leisure'){
                      // leisureTransactions += double.parse(userInput);
                      print("LLLLLLLLLLOOOOOOOOOOOOOKKKKKKKKK HHHHHHHHHere");
                      print(leisureTransactions);
                      chartData.add(ChartData(valueChosen, leisureTransactions));
                      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                        "summa": sumTransactions,
                        'leisure_summa':leisureTransactions,
                      });
                    }
                    else if(valueChosen == 'Fuel'){
                      // fuelTransactions += double.parse(userInput);
                      print("LLLLLLLLLLOOOOOOOOOOOOOKKKKKKKKK HHHHHHHHHere");
                      print(fuelTransactions);
                      chartData.add(ChartData(valueChosen, fuelTransactions));
                      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                        "summa": sumTransactions,
                        'fuel_summa': fuelTransactions,
                      });
                    }
                    else if(valueChosen == 'Cosmetics'){
                      // cosmeticsTransactions += double.parse(userInput);
                      print("LLLLLLLLLLOOOOOOOOOOOOOKKKKKKKKK HHHHHHHHHere");
                      print(cosmeticsTransactions);
                      chartData.add(ChartData(valueChosen, cosmeticsTransactions));
                      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                        "summa": sumTransactions,
                        'cosmetics_summa':cosmeticsTransactions,
                      });

                    }
                    else if(valueChosen == 'Health'){
                      // healthTransactions += double.parse(userInput);
                      print("LLLLLLLLLLOOOOOOOOOOOOOKKKKKKKKK HHHHHHHHHere");
                      print(healthTransactions);
                      chartData.add(ChartData(valueChosen, healthTransactions));
                      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                        "summa": sumTransactions,
                        'health_summa':healthTransactions,
                      });
                    }
                    userInput = "0";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );

                },
                child: const Text("Add transaction", style: const TextStyle(color: Colors.black, fontSize: 16),)),
          ),
        ),
      ),
    );
  }
}