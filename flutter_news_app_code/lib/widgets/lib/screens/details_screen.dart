import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article.dart';
import '../utils/constants.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatelessWidget {
  final Article article;

  const DetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Header Image with Hero Animation
          Hero(
            tag: article.urlToImage + article.publishedAt,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: AppColors.darkGrey),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.darkGrey,
                  child: const Icon(Icons.broken_image, color: Colors.white, size: 50),
                ),
              ),
            ),
          ),
          
          // Gradient overlay for back button visibility
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Back Button
          Positioned(
            top: 42,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.40),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: AppTypography.detailTitle,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              article.sourceName.toUpperCase(),
                              style: AppTypography.detailSource,
                            ),
                          ),
                          Text(
                            _formatDate(article.publishedAt),
                            style: AppTypography.detailDate,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (article.description != null && article.description!.isNotEmpty) ...[
                        Text(
                          article.description!,
                          style: AppTypography.detailSubtitle,
                        ),
                        const SizedBox(height: 20),
                      ],
                      if (article.content != null && article.content!.isNotEmpty)
                        Text(
                          article.content!.split('[+').first, // Clean up NewsAPI content suffix
                          style: AppTypography.detailContent,
                        ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      DateTime dt = DateTime.parse(dateStr);
      return DateFormat('yyyy-MM-dd').format(dt);
    } catch (e) {
      return dateStr;
    }
  }
}
