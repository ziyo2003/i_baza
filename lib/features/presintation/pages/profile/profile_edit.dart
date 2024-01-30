import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_baza/features/presintation/pages/reg_screen/rag_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  File? avatar;

  Future<void> pickerAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {}); // Call setState to rebuild the widget with the new icon
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 75,right: 90),
          child: Text(
            "Profilni tahrirlash",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(
                  height: 348,
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 16,
                  child: GestureDetector(
                    onTap: () {
                      pickerAvatar();
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: avatar == null
                          ? const Icon(Icons.person, size: 30, color: Colors.grey)
                          : Image.file(avatar!, fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Positioned(
                  top: 132,
                    left: 16,
                    right: 16,
                    child:
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'F.I.Sh',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      // keyboardType: TextInputType.text,
                    ),
                ),
                Positioned(
                    top: 212,
                    bottom: 12,
                    left: 16,
                    right: 16,
                    child: Container(
                  constraints: BoxConstraints.tightFor(width: 303.0, height: 120.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border color
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: const TextField(
                    maxLines: null, // Allows the text field to expand vertically
                    expands: true, // Expands the text field to fill the container
                    decoration: InputDecoration(
                      labelText: 'Manzilingiz',
                      border: InputBorder.none, // Removes the underline of the text field
                      contentPadding: EdgeInsets.all(10), // Padding inside the text field
                    ),
                  ),
                )

                ),

              ],
            ),
            const SizedBox(height: 300),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => RagScreen()),
                // );
              },
              child: Text('Saqlash',style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity,48),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
