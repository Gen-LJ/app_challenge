
import 'package:app_challenge/screen/report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? _name,_phNumber,_address;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name'),
              SizedBox(height: 10,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: TextFormField(
                  validator: (name){
                    if(name == null || name.isEmpty){
                      return 'Please Enter your Name';
                    }
                  },
                  onSaved: (name){
                    _name = name;
                  },
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('Phone No'),
              SizedBox(height: 10,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: TextFormField(
                  validator: (ph){
                    if(ph == null || ph.isEmpty){
                      return 'Please Enter your Phone Number';
                    }
                  },
                  onSaved: (ph){
                    _phNumber = ph;
                  },
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('Address'),
              SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: TextFormField(
                  maxLines: 5,
                    validator: (address){
                      if(address == null || address.isEmpty){
                        return 'Please Enter your address';
                      }
                    },
                    onSaved: (address){
                      _address = address;
                    },
                    decoration:  InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        )

                    )
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),

                      onPressed: (){
                    _formKey.currentState?.save();
                    if(_formKey.currentState?.validate() ?? false){
                      //DateTime now= DateTime.now();
                      //int? cost =int.tryParse(_cost!);
                      if(_phNumber != null || _name != null || _address != null) {
                        //databaseProvider.expenseDatabaseHelper.insertExpense(name: _name!, cost: cost!, time: now.toString(), category: _category!);
                        if(mounted){
                          //Navigator.pop(context,'inserted');
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportScreen()));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Successfully saved')));
                        }
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportScreen()));
                    }

                  },
                      child: const Text('ORDER')),

                ],
              ),
            ],
          ),
        )
    );
  }
}
