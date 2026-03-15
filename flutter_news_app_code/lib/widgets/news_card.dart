import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'lib/models/article.dart';
import 'lib/screens/details_screen.dart';
import 'lib/utils/constants.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(article: article),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: AppColors.darkGrey),
                errorWidget: (context, url, error) => Container(color: AppColors.darkGrey, child: const Icon(Icons.error)),
              ),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: AppTypography.cardTitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.sourceName.toUpperCase(),
                        style: AppTypography.cardSubtitle,
                      ),
                      Text(
                        _formatDate(article.publishedAt),
                        style: AppTypography.cardSubtitle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
