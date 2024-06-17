import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';
import 'package:trive_bysc/widgets/Social%20Card/social_card.widget.dart';

class Publications extends StatefulWidget {
  const Publications({
    super.key,
  });

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Map<String, dynamic>> combinedData = [];
    try {
      QuerySnapshot publicationSnapshot =
          await FirebaseFirestore.instance.collection("Publications").get();

      List<QueryDocumentSnapshot> publications = publicationSnapshot.docs;
      for (var publication in publications) {
        print("publication");
        print(publication.data());
        Map<String, dynamic> publicationData =
            publication.data() as Map<String, dynamic>;
        String authorId = publicationData['author'];
        print(authorId);
        QuerySnapshot authorSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where(authorId)
            .get();
        if (authorSnapshot.docs.isNotEmpty) {
          print("venimos aca");
          Map<String, dynamic> authorData =
              authorSnapshot.docs.first.data() as Map<String, dynamic>;
          print("aca 1");
          print(authorData);
          publicationData['authorInfo'] = authorData;
          combinedData.add(publicationData);
          print("combinancion");
          print(combinedData);
        }
      }
      print("aca bro");
      print(combinedData);
      setState(() {
        _data = combinedData;
        print("data");
        print(_data);
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 455.h * _data.length,
      width: double.infinity,
      child: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: _data.map((publication) {
                var author = publication['authorInfo'];
                List<String> images = List<String>.from(publication['images']);
                List<String> topics = List<String>.from(publication['topics']);
                return SocialCard(
                  name: author['name'],
                  ocupation: author['occupation'],
                  content: publication['content'],
                  imageProfile: author['mainImage'],
                  imagesUrl: images,
                  topics: topics,
                );
              }).toList(),
            ),
    );
  }
}
