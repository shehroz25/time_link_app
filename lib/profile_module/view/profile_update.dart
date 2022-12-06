import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_link_shehroz/auth_module/view%20model/authentication_methods.dart';
import 'package:time_link_shehroz/profile_module/view/profile_view.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:time_link_shehroz/utils/custom_btn.dart';
import 'package:time_link_shehroz/utils/custom_textfield.dart';
import 'package:time_link_shehroz/utils/custom_txt.dart';
import 'dart:io';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  File? _profileImage;

  Future imagePicked() async {
    final pickedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    final nameController = TextEditingController();

    final emailController = TextEditingController();

    final passwordController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pop(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                duration: const Duration(milliseconds: 500),
                child: const Profile()),
          );
        },
        title: "Profile",
        icon: Icons.arrow_back_ios,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 19),
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              var name = snapshot.data;
              var userData = snapshot.data;
              return SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.012,
                      ),
                      InkWell(
                          onTap: imagePicked,
                          child: _profileImage == null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(userData != null
                                      ? userData['imageUrl']
                                      : ''))
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(_profileImage!))),
                      //Image.asset("assets/images/pic3.png"),
                      const SizedBox(height: 2),
                      CustomTxt(
                          txt: name != null ? name['business name'] : "",
                          clr: Colors.black,
                          size: 16,
                          fnt_wght: FontWeight.w400),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          CustomTxt(
                              txt: "Business Name",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          CustomTextField(
                            Controller: nameController,
                            color1: const Color(0xffC59DF4),
                            color2: const Color(0xffA150FF),
                            obsecure: false,
                            hinttext: "Business Name",
                            inputtype: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 28.89),
                          CustomTxt(
                              txt: "User-name/Phone number/Email",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          CustomTextField(
                            Controller: emailController,
                            color1: const Color(0xffC59DF4),
                            color2: const Color(0xffA150FF),
                            obsecure: false,
                            hinttext: "Write your name or email",
                            inputtype: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 34.11),
                          CustomTxt(
                              txt: "Business password",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          CustomTextField(
                            Controller: passwordController,
                            color1: const Color(0xffC59DF4),
                            color2: const Color(0xffA150FF),
                            obsecure: true,
                            hinttext: "Password",
                            inputtype: TextInputType.emailAddress,
                            suffixicon: const ImageIcon(
                              AssetImage("assets/images/password.png"),
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 34.11),
                          CustomTxt(
                              txt: "Business password",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          const CustomTextField(
                            color1: Color(0xffC59DF4),
                            color2: Color(0xffA150FF),
                            obsecure: true,
                            hinttext: "Confirm password",
                            inputtype: TextInputType.emailAddress,
                            suffixicon: ImageIcon(
                              AssetImage("assets/images/password.png"),
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 34.11),
                          CustomTxt(
                              txt: "Business phone number",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          const CustomTextField(
                            color1: Color(0xffC59DF4),
                            color2: Color(0xffA150FF),
                            obsecure: false,
                            hinttext: "Write your number",
                            inputtype: TextInputType.phone,
                          ),
                          const SizedBox(height: 34.11),
                          CustomTxt(
                              txt: "Personal phone number",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          const CustomTextField(
                            color1: Color(0xffC59DF4),
                            color2: Color(0xffA150FF),
                            obsecure: false,
                            hinttext: "Write your number",
                            inputtype: TextInputType.phone,
                          ),
                          const SizedBox(height: 34.11),
                          CustomTxt(
                              txt: "Business email address",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          const CustomTextField(
                            color1: Color(0xffC59DF4),
                            color2: Color(0xffA150FF),
                            obsecure: false,
                            hinttext: "Write your email address",
                            inputtype: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 34.11),
                          CustomTxt(
                              txt: "ABN or ACN",
                              clr: const Color(0xff000000),
                              size: 14,
                              fnt_wght: FontWeight.w500),
                          const SizedBox(height: 5),
                          const CustomTextField(
                            color1: Color(0xffC59DF4),
                            color2: Color(0xffA150FF),
                            obsecure: false,
                            hinttext: "Write your ABN/ACN",
                            inputtype: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 44.14),
                          Center(
                            child: InkWell(
                              onTap: () {
                                updateProfile(nameController,
                                    passwordController, _profileImage as File);
                              },
                              child: Btn(
                                color1: const Color(0xffC59DF4),
                                color2: const Color(0xffA150FF),
                                txt: "Update",
                                wdgt: 200.0,
                                hgt: size.height * .055,
                              ),
                            ),
                          ),
                          const SizedBox(height: 44.14),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
