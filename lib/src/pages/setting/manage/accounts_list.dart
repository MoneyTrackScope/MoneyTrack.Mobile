import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:money_track/src/components/add_account_form.dart';
import 'package:money_track/src/models/account_model.dart';

class AccountsList extends StatefulWidget {
  const AccountsList({ Key? key }) : super(key: key);

  @override
  _AccountsListState createState() => _AccountsListState();
}

class _AccountsListState extends State<AccountsList> {
  final _formKey = GlobalKey<AddAccountFormState>();

  late final List<AccountModel> _accounts;


  //test
  Iterable<int> countDownFromSync(int num1, int num2) sync* {
    int counter = num1;
    while (counter <= num2) {
      yield counter++;
    }
  }

  _AccountsListState(){
    _accounts = countDownFromSync(1, 5).map((e) => AccountModel(
          name: "name"+e.toString(),
          balance: Decimal.fromInt(e)
        )
      ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _accounts.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: ListTile(
              title: Text(
                _accounts[index].name.length > 100
                ? _accounts[index].name.substring(0, 100) + "..."
                : _accounts[index].name,
              ),
              trailing: Text(
                _accounts[index].balance.toString(),
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
            onTap: () => {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context){
                  return Container(
                    margin: const EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          AddAccountForm(key: _formKey, model:  _accounts[index]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                              child: const Text("Update"),
                              onPressed: () => {
                                // Update
                                },
                              ),
                              TextButton(
                                child: const Text("Delete"),
                                onPressed: () => {
                                  // Delete
                                },
                              ),
                              OutlinedButton(
                                child: const Text("Cancel"),
                                onPressed: () => {
                                  Navigator.pop(context)
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                isScrollControlled:true
              )
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var account = AccountModel(balance: Decimal.zero);

          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context){
              return Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      AddAccountForm(key: _formKey, model: account),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Add"),
                            onPressed: () => {
                              // Add
                            },
                          ),
                          OutlinedButton(
                            child: const Text("Cancel"),
                            onPressed: () => {
                              Navigator.pop(context)
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            isScrollControlled:true
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}