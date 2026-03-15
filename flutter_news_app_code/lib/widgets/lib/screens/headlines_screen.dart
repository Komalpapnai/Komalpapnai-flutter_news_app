import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';
import '../utils/constants.dart';

class HeadlinesScreen extends StatefulWidget {
  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<NewsProvider>().fetchArticles(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'HEADLINES',
          style: AppTypography.headlineTitle,
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.articles.isEmpty) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }

          if (provider.errorMessage != null && provider.articles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error loading news', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => provider.fetchArticles(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: provider.fetchArticles,
            child: ListView.builder(
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                final article = provider.articles[index];
                return NewsCard(article: article);
              },
            ),
          );
        },
      ),
    );
  }
}
