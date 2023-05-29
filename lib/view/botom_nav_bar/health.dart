import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controlar/news_controlar.dart';
import '../../model/news_model.dart';

class Health extends StatelessWidget {
   const Health({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController controller=Get.put(NewsController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("News Now"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FutureBuilder(
            future: controller.getData("health"),
            builder: (context,AsyncSnapshot snapshot)
            {
              var data=snapshot.data;
              if(snapshot.hasData)
              {
                return ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder:(context,int index)
                    {
                      return Card(
                        color: Colors.grey[600],
                        elevation: 10,
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
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 130,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill ,
                                imageUrl: data.articles[index].urlToImage.toString(),
                                placeholder: (context, url) => CircularProgressIndicator(
                                  color: const Color.fromARGB(255, 38, 77, 172),),
                                errorWidget: (context, url, error) => Image.asset('assets/Untitled.png',fit: BoxFit.fill,),
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
                    } );
              }
              else{
                return const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 38, 77, 172),));
              }
            }),
      ),
    );
  }
}