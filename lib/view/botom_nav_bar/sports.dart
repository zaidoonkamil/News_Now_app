import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controlar/news_controlar.dart';
import '../../model/news_model.dart';

// ignore: must_be_immutable
class Sports extends StatefulWidget {
     const Sports({Key key,}) : super(key: key);

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  String getdata;
  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      if(pref.getString('country')!=null && pref.getString('country').isNotEmpty){
        getdata=pref.getString('country');
        value=getdata;
      }
      else{
        getdata='nothing saved in sp';
      }
    });
  }

  savePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('country', value);
  }

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("News Now"),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: DropdownButton<String>(
              dropdownColor: Colors.grey[700],
              iconEnabledColor: Colors.white,
              icon: const Icon(Icons.more_vert),
              iconDisabledColor: Colors.white,
              value: value,
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text(
                    'Egypt',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'eg',
                ),
                DropdownMenuItem(
                    child: Text(
                      'Saudi Arabia',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'sa'),
                DropdownMenuItem(
                    child: Text(
                      'USA',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'us'),
                DropdownMenuItem(
                    child: Text(
                      'UAE',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'ae'),
                DropdownMenuItem(
                    child: Text(
                      'Turkey',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'tr'),
                DropdownMenuItem(
                    child: Text(
                      'Algeria',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'za'),
                DropdownMenuItem(
                    child: Text(
                      'United kingdom',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'gb'),
                DropdownMenuItem(
                    child: Text(
                      'Armenia',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'ar'),
                DropdownMenuItem(
                    child: Text(
                      'Australia',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'au'),
                DropdownMenuItem(
                    child: Text(
                      'Belgium',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'be'),
                DropdownMenuItem(
                    child: Text(
                      'Brazil',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'br'),
                DropdownMenuItem(
                    child: Text(
                      'Bulgaria',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'bg'),
                DropdownMenuItem(
                    child: Text(
                      'Switzerland',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'ch'),

                DropdownMenuItem(
                    child: Text(
                      'Germany',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'de'),
                DropdownMenuItem(
                    child: Text(
                      'Indonesia',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'id'),
                DropdownMenuItem(
                    child: Text(
                      'Ireland',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'il'),
                DropdownMenuItem(
                    child: Text(
                      'Mexico',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'mx'),
                DropdownMenuItem(
                    child: Text(
                      'Malaysia',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'my'),
                DropdownMenuItem(
                    child: Text(
                      'Philippines',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'ph'),

                DropdownMenuItem(
                    child: Text(
                      'Sweden',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'se'),
              ],
              onChanged: (String values) {
                setState(() {
                  value = values;
                  savePref();
                });
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FutureBuilder(
            future: controller.getData("sports"),
            // ignore: missing_return
            builder: (context, AsyncSnapshot snapshot) {
              Articles data = snapshot.data;
              if (snapshot.hasData) {
                if( (value=='eg') || (value=='ae') ){
                  return ListView.builder(
                      itemCount: data.articles.length,
                      itemBuilder: (context, int index) {
                        return Card(
                          color: Colors.grey[600],
                          elevation: 10,
                          //  shadowColor: Colors.grey[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Text(
                                  data.articles[index].title.toString(),
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 130,
                                child: Image.network(
                                  data.articles[index].urlToImage.toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Text(
                                  data.articles[index].description.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white60),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
                else{
                  return ListView.builder(
                      itemCount: data.articles.length,
                      itemBuilder: (context, int index) {
                        return Card(
                          color: Colors.grey[600],
                          elevation: 10,
                          //  shadowColor: Colors.grey[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Text(
                                  data.articles[index].title.toString(),
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 130,
                                child: Image.network(
                                  data.articles[index].urlToImage.toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Text(
                                  data.articles[index].description.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white60),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
              }
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 38, 77, 172),
                ));
              }
            }),
      ),
    );
  }
}
dynamic value='us';