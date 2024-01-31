import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:i_baza/features/presintation/pages/reg_screen/rag_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  File? avatar;
  final _name = Hive.box("profile_name");
  final _location = Hive.box("profile_location");
  final avatarBox = Hive.box('profile_avatar');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final name = await _name.get(1) ?? '';
    final location = await _location.get(1) ?? '';
    final avatarPath = await avatarBox.get('avatar_path');

    if (avatarPath != null) {
      avatar = File(avatarPath);
    }

    setState(() {
      _nameController.text = name;
      _locationController.text = location;
    });
  }

  Future<void> pickerAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File(file.path);
      });
      await avatarBox.put('avatar_path', file.path);
    }
  }

  void _saveProfileData() {
    _name.put(1, _nameController.text);
    _location.put(1, _locationController.text);
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
                  height: 370,
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
                  top: 120,
                    left: 16,
                    right: 16,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                         Text('F.I.Sh',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                     ),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "edit name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                             ),
                           ),
                        ),
                      ],
                    ),
                ),

                Positioned(
                  bottom: 12,
                  // left: 16,
                  // right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manzilingiz',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        constraints: BoxConstraints.tightFor(width: 340.0, height: 120.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _locationController,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               ]
              ),
            const SizedBox(height: 300),
            ElevatedButton(
              onPressed: () {
                _saveProfileData();
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
