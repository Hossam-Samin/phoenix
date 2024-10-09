import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/custom_textfield.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});
  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
                  child: CustomTextField(
                    prefixIcon:  Icon(Icons.search,color: Colors.indigo.withOpacity(.6),),
                    onChange: (value) {},
                    onSaved: (value) {
                      searchController.text = value;
                    },
                    label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5,),
                        child:  const Text("Search",style: TextStyle(fontFamily: "Rubik"),)),
                    controller: searchController,
                  ),
                ),
             ),
                Container(
                  height: 45,
                  width: 45,
                  margin:
                  const EdgeInsets.only(top: 50, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.indigo.withOpacity(.4)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.sliders, size: 20,color: Colors.white),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin:
                  const EdgeInsets.only(top: 50, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.indigo.withOpacity(.4)),
                  child: IconButton(
                    onPressed: () {},
                    //  drawerController.toggle,
                    icon: const Badge(child: FaIcon(FontAwesomeIcons.bell, size: 20,color: Colors.white,)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}