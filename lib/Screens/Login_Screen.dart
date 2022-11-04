import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Home_screen.dart';
import 'package:shoppingapp/Screens/Signup_Screen.dart';

class LoginScreen extends StatefulWidget {
  // final Key fieldkey;
  // final String hintText;
  // final String labelText;
  // final String helperText;
  // final FormFieldSetter<String> onSaved;
  // final FormFieldValidator<String> validator;
  // final ValueChanged<String> onFieldsubmitted;

  // const LoginScreen(Key? key, this.fieldkey, this.hintText, this.labelText,
  //     this.helperText, this.onSaved, this.validator, this.onFieldsubmitted)
  //     : super(key: key);
  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
        hintColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0)));
  }

  @override
  State<StatefulWidget> createState() => login();
}

class login extends State<LoginScreen> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //bool _autovalidate = false;
  bool _formWasEdited = false;
  String _validatename(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Name is Required';
    final RegExp nameExp = RegExp(r'^[A-Z a-z ] +$');
    if (!nameExp.hasMatch(value))
      return 'Please Enter Only Aplphabetical characters,';
    return null!;
  }

  @override
  Widget build(BuildContext context) {
    bool _obsecureText = true;
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 50.0,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 7.0),
              child: Row(
                children: <Widget>[
                  _verticalID(),
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                  _verticalID(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SafeArea(
                top: false,
                bottom: false,
                child: Card(
                  elevation: 5.0,
                  child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(
                              height: 24.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        style: BorderStyle.solid)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        style: BorderStyle.solid)),
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'Your Email address',
                                labelText: 'E-mail',
                                labelStyle: TextStyle(color: Colors.black87),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => val!.contains('@')
                                  ? 'Not a Valid email.'
                                  : null,
                              onSaved: (val) => _email = val!,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid)),
                                  icon: Icon(Icons.lock, color: Colors.black38),
                                  hintText: 'Your Password',
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black54)),
                              validator: (val) =>
                                  val!.length < 6 ? 'Password too short' : null,
                              onSaved: (val) => _password = val!,
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      },
                                      child: Text('Login',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ))
          ],
        ),
      )),
    );
  }

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 07.0, bottom: 0.0),
      );
  void _submit() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      _performLogin();
    } else {
      showbottomsheet('Please fix the errors in red before submitting.');
    }
  }

  void showbottomsheet(String value) {
    scaffoldkey.currentState!.showBottomSheet((context) => Text(value));
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
