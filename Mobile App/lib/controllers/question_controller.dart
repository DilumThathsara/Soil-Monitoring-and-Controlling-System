import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/models/faq_model.dart';
import 'package:soil_app/models/qa_model.dart';

class QuestionController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference faq = FirebaseFirestore.instance.collection('FAQ');
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference qa = FirebaseFirestore.instance.collection('Q&A');

  Future<List<FAQModel>> fetchFAQ() async {
    try {
      //----------------firebase query that find and fetch user data according to the uid
      QuerySnapshot querySnapshot = await faq.get();
      Logger().i(querySnapshot.docs.length);

      List<FAQModel> list = [];

      //---mapping fetched data user data into usermodel
      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        FAQModel model = FAQModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }
      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  Future<List<QAModel>> fetchQA() async {
    try {
      //----------------firebase query that find and fetch user data according to the uid
      QuerySnapshot querySnapshot = await qa.get();
      Logger().i(querySnapshot.docs.length);

      List<QAModel> list = [];

      //---mapping fetched data user data into usermodel
      for (var e in querySnapshot.docs) {
        //------------mapping product data into organizer model
        QAModel model = QAModel.fromJason(e.data() as Map<String, dynamic>);

        //---adding to the product list
        list.add(model);
      }
      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  Future<void> addQuestion(
    String question,
    String answer,
    String dateTime,
  ) {
    return qa
        .doc(question)
        .set(
          {'QuestionText': question, 'AnswerText': answer, 'date': dateTime},
        )
        .then((value) => Logger().i("Successfully added a question"))
        .catchError((error) => Logger().e("Failed to merge data: $error"));
  }
}
