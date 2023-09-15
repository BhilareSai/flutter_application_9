import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_9/Model/data.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'dart:developer' as dev;
import 'dart:io';

class DataRepresentation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataRepresentation();
  }
}

class _DataRepresentation extends State<DataRepresentation> {
  ItemData? data = null;
  final formKey = GlobalKey<FormState>();
  File? _image;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  void getImage() async {}

  void getData() async {
    // var res = await http.get(Uri.parse("ff"));
    // data = ItemData.fromJson(jsonDecode(res.body));
    data = ItemData(
        name: "First item",
        entryDate: "sss",
        location: "ssss",
        sId: "sss",
        status: "ss",
        category: "ssss",
        expirationDate: "sss");
  }

  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: AssetImage(
                            'asset/dmg.png',
                          ))),
                  height: size.height * 0.6,
                  width: size.width,
                  padding: EdgeInsets.all(30),
                  child: Column(children: [
                    Text(
                      data!.name.toString(),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    datarow(
                      "Category",
                      data!.category.toString(),
                    ),
                    datarow(
                      "EntryDate",
                      data!.entryDate.toString(),
                    ),
                    datarow(
                      "ExpiryDate",
                      data!.expirationDate.toString(),
                    ),
                    datarow(
                      "Location",
                      data!.location.toString(),
                    ),
                    datarow(
                      "status",
                      data!.status.toString(),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                      return AlertDialog(
                                        content: Container(
                                          height: size.height * 0.9,
                                          width: size.width,
                                          child: Form(
                                            key: formKey,
                                            child: Column(
                                              children: [
                                                Card(
                                                  child: Container(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text("Report"),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  height: size.height * 0.25,
                                                  child: Stack(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 130,
                                                        backgroundImage: _image ==
                                                                null
                                                            ? AssetImage(
                                                                "asset/placeholder.png")
                                                            : Image.file(
                                                                    _image!)
                                                                .image,
                                                      ),
                                                      Positioned(
                                                          top: 130,
                                                          right: 30,
                                                          child: IconButton(
                                                            icon: Container(
                                                              height: 60,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              final image =
                                                                  await ImagePicker()
                                                                      .pickImage(
                                                                          source:
                                                                              ImageSource.camera);
                                                              if (image ==
                                                                  null) {
                                                              } else {
                                                                final imageTemp =
                                                                    File(image
                                                                        .path);
                                                                setState(() {
                                                                  this._image =
                                                                      imageTemp;
                                                                });
                                                              }
                                                            },
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                TextFormField(
                                                  onSaved: (newValue) {},
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      prefixIcon:
                                                          Icon(Icons.title),
                                                      label: Text("Title"),
                                                      hintText: "Item"),
                                                  validator: (value) {
                                                    if (value != null) {
                                                      if (value.isNotEmpty) {
                                                        return null;
                                                      } else {
                                                        return "Invalid Title";
                                                      }
                                                    } else {
                                                      return "Title cannot be empty";
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                TextFormField(
                                                  maxLines: 4,
                                                  onSaved: (newValue) {},
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      label:
                                                          Text("Discription"),
                                                      hintText:
                                                          "Mention in brief"),
                                                  validator: (value) {
                                                    if (value != null) {
                                                      if (value.isNotEmpty) {
                                                        return null;
                                                      } else {
                                                        return "Invalid Username";
                                                      }
                                                    } else {
                                                      return "username cannot be empty";
                                                    }
                                                  },
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("submit"))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              child: Text("Request")),
                          SizedBox(width: 20),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Submit"))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            )),
    );
  }

  Widget datarow(String field, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            "$field : ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
