import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/add_account_form.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/services/account_service.dart';

class AccountsList extends StatefulWidget {
  const AccountsList({ Key? key }) : super(key: key);

  @override
  _AccountsListState createState() => _AccountsListState();
}

class _AccountsListState extends State<AccountsList> {
  final _formKey = GlobalKey<AddAccountFormState>();

  final AccountService _accountService;

  late final List<AccountModel> _accounts;

  _AccountsListState()
  : _accountService = GetIt.I.get<AccountService>();

  @override
  void initState(){
    super.initState();

    Future.delayed(Duration.zero, () async {
      var accountList = await _accountService.getAll();

      setState(() {
        _accounts = accountList;
      });
    });
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
                                onPressed: () async {
                                  var account = _formKey.currentState?.getAccount();

                                  if(account != null){
                                    await _accountService.update(account);
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text("Delete"),
                                onPressed: () async {
                                  await _accountService.delete(_accounts[index].id);
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
                            onPressed: () async {
                              var account = _formKey.currentState?.getAccount();

                              if(account != null){
                                await _accountService.add(account);
                              }
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