import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/pages/Diary/widgets/caendar.widget.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../../widgets/widgets.dart';

class PublishPartSelect extends StatefulWidget {
  const PublishPartSelect({
    super.key,
  });

  @override
  State<PublishPartSelect> createState() => _PublishPartSelectState();
}

class _PublishPartSelectState extends State<PublishPartSelect> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Map<String, dynamic>> combinedData = [];
    try {
      final userProvider = Provider.of<TriveProvider>(context, listen: false);

      QuerySnapshot publicationSnapshot = await FirebaseFirestore.instance
          .collection("Publications")
          .where('author', isEqualTo: userProvider.personId)
          .get();

      List<QueryDocumentSnapshot> publications = publicationSnapshot.docs;
      for (var publication in publications) {
        Map<String, dynamic> publicationData =
            publication.data() as Map<String, dynamic>;
        String authorId = publicationData['author'];
        // print("id: " + authorId);
        DocumentSnapshot authorSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(authorId)
            .get();

        if (authorSnapshot.exists) {
          print("Author Data: ${authorSnapshot.data()}");
          Map<String, dynamic> authorData =
              authorSnapshot.data() as Map<String, dynamic>;

          publicationData['authorInfo'] = {
            'id': authorSnapshot.id,
            ...authorData,
          };
          print(publicationData);
          combinedData.add(publicationData);
        }
      }
      setState(() {
        _data = combinedData;
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
          ? Center(
              child: _data == null || _data.isEmpty
                  ? Text(
                      'No se encontraron publicaciones',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  : CircularProgressIndicator(),
            )
          : Column(
              children: _data.map((publication) {
                var author = publication['authorInfo'];
                List<String> images = List<String>.from(publication['images']);
                List<String> topics = List<String>.from(publication['topics']);
                return SocialCard(
                  userId: author['id'],
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
