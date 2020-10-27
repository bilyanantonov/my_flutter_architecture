import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_flutter_architecture/common_widget/social_log_in_button.dart';
import 'package:my_flutter_architecture/model/user.dart';
import 'package:my_flutter_architecture/utils/alert_message.dart';
import 'package:my_flutter_architecture/utils/validation_mixin.dart';
import 'package:my_flutter_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

int myException;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with ValidationMixin {
  var formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (myException != null) {
        _showDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Sign In page",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff94e7e1), Color(0xff3eb6e2)])),
          )),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_loginForm()],
      )),
    );
  }

  void _showDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Uyarı"),
            content: Text("Giriş Yapılamadı"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Tamam"))
            ],
          );
        });
  }

  Widget _loginForm() {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email", hintText: "mail@mail.com"),
              validator: validateEmail,
              onSaved: (String value) {
                _email = value;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
              validator: validatePassword,
              onSaved: (String value) {
                _password = value;
              },
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                butonText: "SIGN IN",
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    // AlertMessage.alertMessage(context, "Başarılı", "Giriş Yapıldı");
                    User _user = await _userViewModel.signIn(_email, _password);
                    if (_user != null) {
                      print(_user.userName);
                    } else {
                      myException = 1;
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
