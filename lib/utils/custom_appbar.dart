import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.icon,
      required this.onPressed,
      this.icon2,
      this.onPressed2})
      : super(key: key);

  @override
  final String title;
  final IconData? icon;
  final Function() onPressed;
  final IconData? icon2;
  final Function()? onPressed2;
  @override
  Size get preferredSize => const Size.fromHeight(79);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 35, left: 11),
        child: InkWell(onTap: onPressed, child: Icon(icon)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 35, right: 11),
          child: InkWell(
            onTap: onPressed2,
            child: Icon(
              icon2,
              color: Colors.white,
            ),
          ),
        )
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            gradient: LinearGradient(
                colors: <Color>[Color(0xffC59DF4), Color(0xffA150FF)]),
            boxShadow: [BoxShadow(blurRadius: 2, color: Color(0xffA150FF))]),
      ),
    );
  }
}
