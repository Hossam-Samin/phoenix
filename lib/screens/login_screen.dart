import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/screens/tap_item.dart';
import 'package:phoenix/services/figurePrint.dart';
import 'package:phoenix/styles/all_images_app.dart';
import '../widgets/custom_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<LoginScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  String userEmail = "";
  String userPassword = "";
  bool light = true;
  bool  isObscure = true;
  String? selectedCountryCode;
  onCountryChange(CountryCode countryCode) {
    selectedCountryCode = countryCode.dialCode.toString();
  }
  // To get current country by phone user
  String getCurrentCountryCode() {
    return WidgetsBinding.instance.platformDispatcher.locale.countryCode ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.indigo.shade100,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius:  BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs:  [
                    TabItem(title: 'Login'),
                    TabItem(title: 'Signup'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children:[
            SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _loginKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Center(
                    child: Text('Welcome Back',style: TextStyle(fontSize: 25,fontFamily: 'Rubik'),),
                  ),
                  const Center(
                    child:  Text('Welcome Back, please enter your details',style: TextStyle(color: Colors.grey,fontFamily: 'Rubik')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Colors.grey.withOpacity(.3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomTextField(
                        prefixIcon:  Icon(Icons.email,color: Colors.indigo.withOpacity(.6),),
                        onChange: (value) {},
                        onSaved: (value) {
                          userEmail = value;
                        },
                        controller: emailController,
                        hintText: 'E-Mail',
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'E-Mail is Empty';
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Colors.grey.withOpacity(.3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomTextField(
                          prefixIcon:  Icon(Icons.key,color: Colors.indigo.withOpacity(.6),),
                          isObscureText: isObscure,
                          onChange: (value) {},
                          onSaved: (value) {
                            userPassword = value;
                          },
                          controller: passwordController,

                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: FaIcon(
                              isObscure == true
                                  ? FontAwesomeIcons.unlockKeyhole
                                  : FontAwesomeIcons.lock,
                              color: Colors.indigo.withOpacity(.6),
                            ),
                          ),
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is Empty';
                            }
                          }
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MaterialButton(
                        onPressed: ()async{
                          try{
                            if (_loginKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Process Data')),
                              );
                              //   final convertBytes = utf8.encode(passwordController.text);
                              //   final password = sha256.convert(convertBytes).toString();
                              //   await  baseApi.loginWithUser(email: emailController.text, password: password ).then((value) {
                              //     if (value != null) {
                              //       LocalStorageDB localStorageDB = LocalStorageDB();
                              //       localStorageDB.storeData(email: emailController.text, password: password, userid: value.userid!, token: value.token!);
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //           SnackBar(content: Text(S.of(context).snackBar_login_suc)));
                              //       // Navigator.pushNamed(context, '/AppLayout');
                              //       return Navigator.pushNamed(context,"/ChatScreen");
                              //     } else if (value == null){
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //           SnackBar(content: Text(S.of(context).snackBar_login_invalid)));
                              //     } else{
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //           SnackBar(content: Text(S.of(context).snackBar_error_internet)));
                              //     }
                              //   });
                            }
                          }catch(error){
                            debugPrint('Error: ${error.toString()}');
                          }
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 10),
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Login',style:  TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Rubik"),),

                      )
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        FigureAuth().figureAuth();
                      },
                      child: RichText(
                          text: TextSpan(
                            text: 'Do you prefer login by ',
                            style: const TextStyle(color: Colors.black,fontFamily: "Rubik"),
                            children: [
                              TextSpan(text: 'FigurePrint ?',style: TextStyle(color: Colors.indigo.shade200,decoration: TextDecoration.underline))
                            ]
                          )
                        ,),
                    )
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const   Expanded(
                            child: Divider(
                              thickness: 2,
                            )),
                        Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color:Colors.grey.withOpacity(.9),fontFamily: "Rubik"),
                          ),
                        ),
                        const  Expanded(
                            child: Divider(
                              thickness: 2,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.indigo.withOpacity(.6), width: 2),
                        ),
                        child: InkWell(
                          onTap: () async {},
                          child: const Image(
                            image: AssetImage(AppImages.google),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.indigo.withOpacity(.6), width: 2), // Optional: circle border
                        ),
                        child: InkWell(
                          onTap: () async {},
                          child: Image.asset(AppImages.apple),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _signupKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Center(
                      child: Text('Welcome To Signup',style: TextStyle(fontSize: 25,fontFamily: 'Rubik'),),
                    ),
                    const Center(
                      child:  Text('Welcome, please enter your details',style: TextStyle(color: Colors.grey,fontFamily: 'Rubik')),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Card(
                              color: Colors.grey.withOpacity(.3),
                              elevation: 0,
                              child: CustomTextField(
                                prefixIcon:  Icon(Icons.person,color: Colors.indigo.withOpacity(.6),),
                                onChange: (value) {},
                                onSaved: (value) {
                                  userEmail = value;
                                },
                                controller: emailController,
                                hintText: 'First Name',
                                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name is Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Card(
                              color: Colors.grey.withOpacity(.3),
                              elevation: 0,
                              child: CustomTextField(
                                prefixIcon:  Icon(Icons.person,color: Colors.indigo.withOpacity(.6),),
                                onChange: (value) {},
                                onSaved: (value) {
                                  userEmail = value;
                                },
                                controller: emailController,
                                hintText: 'Last Name',
                                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name is Empty';
                                  }
                                },
                              ),
                            ),
                          ),
                      ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Card(
                        color: Colors.grey.withOpacity(.3),
                        elevation: 0,
                        child: CustomTextField(
                          prefixIcon:  Icon(Icons.email,color: Colors.indigo.withOpacity(.6),),
                          onChange: (value) {},
                          onSaved: (value) {
                            userEmail = value;
                          },
                          controller: emailController,
                          hintText: 'E-Mail',
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-Mail is Empty';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Card(
                        color: Colors.grey.withOpacity(.3),
                        elevation: 0,
                        child: CustomTextField(
                            prefixIcon:  Icon(Icons.key,color: Colors.indigo.withOpacity(.6),),
                            isObscureText: isObscure,
                            onChange: (value) {},
                            onSaved: (value) {
                              userPassword = value;
                            },
                            controller: passwordController,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: FaIcon(
                                isObscure == true
                                    ? FontAwesomeIcons.unlockKeyhole
                                    : FontAwesomeIcons.lock,
                                color: Colors.indigo.withOpacity(.6),
                              ),
                            ),
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is Empty';
                              }
                            }
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Card(
                        color: Colors.grey.withOpacity(.3),
                        elevation: 0,
                        child: CustomTextField(
                            prefixIcon:  Icon(Icons.key,color: Colors.indigo.withOpacity(.6),),
                            isObscureText: isObscure,
                            onChange: (value) {},
                            onSaved: (value) {
                              userPassword = value;
                            },
                            controller: passwordController,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5),fontFamily: "Rubik"),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: FaIcon(
                                isObscure == true
                                    ? FontAwesomeIcons.unlockKeyhole
                                    : FontAwesomeIcons.lock,
                                color: Colors.indigo.withOpacity(.6),
                              ),
                            ),
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm Password is Empty';
                              }
                            }
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Card(
                          color: Colors.grey.withOpacity(.3),
                          elevation: 0,
                          child: CustomTextField(
                              prefixIcon: Padding(
                                padding:
                                const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CountryCodePicker(
                                      onInit: (CountryCode? countryCode) {
                                        selectedCountryCode = countryCode!.dialCode.toString();
                                      },
                                      onChanged: onCountryChange,
                                      initialSelection: getCurrentCountryCode(),
                                      flagDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5)),
                                      dialogBackgroundColor: Colors.white,
                                      dialogTextStyle: const TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                   Container(
                                   height: 35.0,
                                   width: 2.0,
                                   color: Colors.grey,
                                   margin: const EdgeInsets.only(
                                       right: 30.0),
                                                                    )
                                  ],
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              controller: phoneController,
                              onSaved: (value) {
                                phoneController.text = value;
                              },
                              onChange: (value) {},
                              hintText: 'Phone Number',
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Phone Number is Empty";
                                }
                                if (value.length < 10) {
                                  return "Phone Number is valid";
                                }
                              }),
                        )),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          onPressed: ()async{
                            try{
                              if (_loginKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Process Data')),
                                );
                                //   final convertBytes = utf8.encode(passwordController.text);
                                //   final password = sha256.convert(convertBytes).toString();
                                //   await  baseApi.loginWithUser(email: emailController.text, password: password ).then((value) {
                                //     if (value != null) {
                                //       LocalStorageDB localStorageDB = LocalStorageDB();
                                //       localStorageDB.storeData(email: emailController.text, password: password, userid: value.userid!, token: value.token!);
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //           SnackBar(content: Text(S.of(context).snackBar_login_suc)));
                                //       // Navigator.pushNamed(context, '/AppLayout');
                                //       return Navigator.pushNamed(context,"/ChatScreen");
                                //     } else if (value == null){
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //           SnackBar(content: Text(S.of(context).snackBar_login_invalid)));
                                //     } else{
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //           SnackBar(content: Text(S.of(context).snackBar_error_internet)));
                                //     }
                                //   });
                              }
                            }catch(error){
                              debugPrint('Error: ${error.toString()}');
                            }
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 10),
                          color: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Signup',style:  TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Rubik"),),

                        )
                    ),
                   ]
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}