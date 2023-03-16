import 'package:flutter/material.dart';
import 'app_color.dart';

class CustomDialogBox extends StatefulWidget {
  final Function onCameraBTNPressed, onGalleryBTNPressed;

  const CustomDialogBox({
    required this.onCameraBTNPressed,
    required this.onGalleryBTNPressed,
    super.key,
  });

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Cnic Scanner',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Please select any option',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onCameraBTNPressed();
                      },
                      child: const Text(
                        'CAMERA',
                        style: TextStyle(
                            fontSize: 18, color: Color(kDeepDarkGreenColor)),
                      )),
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onGalleryBTNPressed();
                      },
                      child: const Text(
                        'GALLERY',
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(45)),
                child: Image.asset("assets/images/person_icon.png")),
          ),
        ),
      ],
    );
  }
}
