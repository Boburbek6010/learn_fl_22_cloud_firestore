import 'package:flutter/material.dart';
import 'package:learn_fl_22_cloud_firestore/services/cloud_firestore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = false;

  @override
  void initState() {
    CFSService.readAllData(collectionPath: "Note").then((value) {
      isLoading = true;
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ?ListView.builder(
        itemCount: CFSService.documents.length,
        itemBuilder: (_, index){
          return Card(
            child: ListTile(
              title: Text(CFSService.documents[index].id.toString()),
              subtitle: Text(CFSService.documents[index].reference.path),
              trailing: Text(CFSService.documents[index].data()["title"]),
            ),
          );
        },
      ):const Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{

          final note = <String, dynamic> {
            "title":"University",
            "content":"PDP University",
            "dateTime":DateTime.now(),
          };

          await CFSService.storeData(collectionPath: "Note", data: note);

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
