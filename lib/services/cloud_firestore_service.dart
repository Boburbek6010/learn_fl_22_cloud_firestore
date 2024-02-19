import 'package:cloud_firestore/cloud_firestore.dart';

class CFSService{

  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = [];


  static Future<void> storeData({required String collectionPath, required Map<String, dynamic> data})async{
    await db.collection(collectionPath).add(data);
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readAllData({required String collectionPath})async{
    await db.collection(collectionPath).get().then((value) {
      for(var doc in value.docs){
        documents.add(doc);
      }
    });
    return documents;
  }


  static Future<void> delete({required String collectionPath, required String id})async{
    await db.collection(collectionPath).doc(id).delete();
  }

  static Future<void> update({required String collectionPath, required String id, required Map<String, dynamic> data})async{
    await db.collection(collectionPath).doc(id).update(data);
  }


}