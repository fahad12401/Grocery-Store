import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Home_screen.dart';
import 'package:shoppingapp/Screens/Login_Screen.dart';

class SignupScreen extends StatefulWidget {
  // final Key fieldKey;
  // final String hintText;
  // final String labelText;
  // final String helperText;
  // final FormFieldSetter<String> onSaved;
  // final FormFieldValidator<String> validator;
  // final ValueChanged<String> onFieldSubmitted;

  // const SignupScreen(Key key, this.fieldKey, this.hintText, this.labelText,
  //     this.helperText, this.onSaved, this.validator, this.onFieldSubmitted)
  //     : super(key: key);
  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Colors.red,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => Signup();
}

class Signup extends State<SignupScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _firstname;
  late String _lastname;
  late String _phone;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autovalidate = false;
  bool _formWasEdited = false;
  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Signup',
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
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                    _verticalID(),
                    GestureDetector(
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
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
                        key: formKey,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
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
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Enter First Name',
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (val) =>
                                    val!.length < 1 ? 'Enter First Name' : null,
                                onSaved: (val) => _firstname = val!,
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  icon: Icon(
                                    Icons.perm_identity,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Enter Last Name',
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (val) =>
                                    val!.length < 1 ? 'Enter Last Name' : null,
                                onSaved: (val) => _lastname = val!,
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Your Email address',
                                  labelText: 'Email ',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                                keyboardType: TextInputType.text,
                                //validator: validemail,
                                onSaved: (String? val) {
                                  _email = val!;
                                },
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  icon: Icon(
                                    Icons.phone_android,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Your phone no.',
                                  labelText: 'Phone ',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                                keyboardType: TextInputType.text,
                                // validator: validateMobile,
                                onSaved: (String? val) {
                                  _phone = val!;
                                },
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black87,
                                          style: BorderStyle.solid)),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Your Password',
                                  labelText: 'Password ',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (val) => val!.length < 6
                                    ? 'Password too short'
                                    : null,
                                onSaved: (String? val) {
                                  _password = val!;
                                },
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          _submit();
                                        },
                                        child: Text(
                                          'Signup',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
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
        )));
  }

  // String validemail(String value) {
  //    Pattern pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value))
  //     return 'Enter Valid email';
  //   else
  //     return null!;
  // }
  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null!;
  }

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 07.0, bottom: 0.0),
      );
  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      _performLogin();
    } else {
      showbottomsheet('Please fix the errors in red before submitting.');
    }
  }

  void showbottomsheet(String value) {
    scaffoldKey.currentState!.showBottomSheet((context) => Text(value));
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
