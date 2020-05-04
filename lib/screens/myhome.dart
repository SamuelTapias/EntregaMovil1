import 'package:converter_provider/widgets/converter.dart';
import 'package:converter_provider/widgets/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Screen with ChangeNotifier{
  

  bool  get screen =>_logged;
  bool _logged=true;
  String _username="";
  String _name="";
  String _email="";
  UserInfo  ui ;

  void init() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _logged=prefs.getBool('screen')??true;
    ui =UserInfo(token: 'placeholder',username: prefs.getString('username')??"",name: prefs.getString('name')??"",email: prefs.getString('email')??"");
    changeUsername(ui.username);
    changeEmail(ui.email);
    changeName(ui.name);
    notifyListeners();
  }
  
  
  void change_state(){
    _logged=!_logged;
    notifyListeners();
  }
  void changeUsername(String s){
    
    _username=s;
    notifyListeners();
  }
  get username => _username;
  void changeName(String s){
    
    _name=s;
    notifyListeners();
  }
  get name => _name;
  void changeEmail(String s){
    
    _email=s;
    notifyListeners();
  }
  get email => _email;

  
  void changeUser(UserInfo s){
    
    ui=s;
    print(s.prn());
    changeUsername(s.username);
    changeEmail(s.email);
    changeName(s.name);
    print(_email+" "+_username+" "+_name);
    notifyListeners();
  }
  get userinfo => ui;
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Screen>( 
      create: (context) => Screen(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login demo',
        theme: ThemeData(
           primaryColor: Colors.green,
           accentColor: Colors.greenAccent,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Login demo'),
            ),
            body: Center(child: Converter()))
      )
    );
  }
}
