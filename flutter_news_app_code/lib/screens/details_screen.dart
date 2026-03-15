import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article.dart';

class DetailsScreen extends StatelessWidget {

  final Article article;

  const DetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          CachedNetworkImage(
            imageUrl: article.imageUrl,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black54,
          ),

          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  article.title,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),

                SizedBox(height: 10),

                Text(
                  "${article.source} | ${article.date}",
                  style: TextStyle(
                      color: Colors.grey),
                ),

                SizedBox(height: 10),

                Text(
                  article.description,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}