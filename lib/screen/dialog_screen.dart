
import 'package:app_challenge/api/firestore/firestore.dart';
import 'package:app_challenge/screen/report_screen.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({Key? key, this.price}) : super(key: key);
  final price;

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {

  final FireStoreService fireStoreService = FireStoreService();
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
              const Text('Name'),
              const SizedBox(height: 10,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
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
              const SizedBox(height: 20,),
              const Text('Phone No'),
              const SizedBox(height: 10,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
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
              const SizedBox(height: 20,),
              const Text('Address'),
              const SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
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
              const SizedBox(height: 10,),
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
                      if(_phNumber != null || _name != null || _address != null) {
                        fireStoreService.addProduct(_name!, widget.price, _phNumber!, _address!);
                        if(mounted){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReportScreen()));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Successfully Ordered')));
                        }
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReportScreen()));
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
