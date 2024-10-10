import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phoenix/styles/all_images_app.dart';



class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.blueGrey,
                        Colors.indigo,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 50,right: 40),
                        child: Image.asset(AppImages.userPhoto,height: 100,width: 100,),
                      ),
                    ),
                    const Expanded(
                        child:Column(
                          children: [
                             SizedBox(height: 100),
                             Text('Hi  👋',style:  TextStyle(color: Colors.white,fontSize: 18,fontFamily: "Rubik"),),
                             SizedBox(height: 5),
                            ListTile(
                              contentPadding:   EdgeInsets.only(left: 30,right: 20),
                              leading:  FaIcon(FontAwesomeIcons.ccVisa,color: Colors.indigo,),
                              trailing: Text('0.00 EGP',style:  TextStyle(color: Colors.white,fontFamily: "Rubik"),),

                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),

              const SizedBox(height: 5,),
              ListTile(
                title: const Text('Notifications',style:  TextStyle(fontFamily: "Rubik"),),
                leading: FaIcon(FontAwesomeIcons.bell,color: Colors.indigo.withOpacity(.7),),
              ),
              const SizedBox(height: 5,),
              ListTile(
                title: const Text('Live Chat',style:  TextStyle(fontFamily: "Rubik"),),
                leading: FaIcon(FontAwesomeIcons.comments,color: Colors.indigo.withOpacity(.7),),
              ),
              const SizedBox(height: 5,),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 15,right: 15),
                title: const Text('Languages',style:   TextStyle(fontFamily: "Rubik"),),
                leading: FaIcon(FontAwesomeIcons.language,color: Colors.indigo.withOpacity(.7),),
                // trailing: const AppLanguages(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 10,right: 130,bottom: 20),
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          insetPadding: const EdgeInsets.symmetric(vertical: 100,horizontal: 40),
                          title:  const Text('Logout',style:  TextStyle(fontWeight: FontWeight.bold,fontFamily: "Rubik"),),
                          content:  const Text('Are you logout ?',style:  TextStyle(fontWeight: FontWeight.normal,fontFamily: "Rubik"),),
                          actions: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    onTap: ()async{
                                      // final AuthTypeServices authTypeServices = AuthTypeServices();
                                      // authTypeServices.logoutUser(context);
                                    },
                                    title:  const Text('Yes',
                                        style:  TextStyle(fontSize: 16,fontFamily: "Rubik")),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(color: Colors.green.withOpacity(0.4))
                                    ),
                                    leading: const FaIcon(FontAwesomeIcons.circleCheck),
                                  ),
                                ),
                                const SizedBox(width: 8.0,),
                                Expanded(
                                  child: ListTile(
                                    onTap: ()=> Navigator.of(context).pop(),
                                    title:  const Text('No',
                                        style:  TextStyle(fontSize: 16,fontFamily: "Rubik")),
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(color: Colors.redAccent.withOpacity(0.4))
                                    ),
                                    leading: const FaIcon(FontAwesomeIcons.circleXmark),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                    );
                  },
                  color: Colors.indigo.withOpacity(.7),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:  const Row(
                    children: [
                       Expanded(child: FaIcon(FontAwesomeIcons.rightFromBracket,size: 24,color: Colors.white,)),
                      Expanded(child: Text('Logout',style:  TextStyle(color: Colors.white,fontSize: 18,fontFamily: "Rubik"),)),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
