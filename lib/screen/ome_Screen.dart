/// Home_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_artical_model.dart';
import 'package:news_app/screen/detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    newsController.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF012B5B),
        title: const Text('Flutter News App'),
      ),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (newsController.errorMessage.value.isNotEmpty) {
          return Center(child: Text(newsController.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: newsController.articles.length,
            itemBuilder: (context, index) {
              NewsArticle article = newsController.articles[index];
              return ListTile(
                title: Text(article.title),
                leading: SizedBox(
                  width: 100,
                  height: 100,
                  child: article.urlToImage.isNotEmpty
                      ? Image.network(
                          article.urlToImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // If image fails to load, show placeholder image
                            return Image.asset(
                              'assets/images/news.jpeg',
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/news.jpeg',
                          fit: BoxFit.cover,
                        ),
                ),
                onTap: () {
                  Get.to(() => DetailedScreen(
                      newsArticle: newsController.articles[index]));
                },
              );
            },
          );
        }
      }),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:news_app/controller/news_controller.dart';
// import 'package:news_app/model/news_artical_model.dart';

// class HomeScreen extends StatelessWidget {
//   final NewsController newsController = Get.put(NewsController());

//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter News App'),
//       ),
//       body: Obx(() {
//         return RefreshIndicator(
//           onRefresh: () => newsController.fetchNews(), // Call fetchNews when refreshing
//           child: _buildNewsListView(),
//         );
//       }),
//     );
//   }

//   Widget _buildNewsListView() {
//     if (newsController.isLoading.value) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (newsController.errorMessage.value.isNotEmpty) {
//       return Center(child: Text(newsController.errorMessage.value));
//     } else {
//       return ListView.builder(
//         itemCount: newsController.articles.length,
//         itemBuilder: (context, index) {
//           NewsArticle article = newsController.articles[index];
//           return ListTile(
//             title: Text(article.title),
//             leading: SizedBox(
//               width: 100,
//               height: 100,
//               child: article.urlToImage.isNotEmpty
//                   ? Image.network(
//                       article.urlToImage,
//                       fit: BoxFit.cover,
//                     )
//                   : Container(
//                       color: Colors.grey, // Placeholder color
//                     ),
//             ),
//             onTap: () {
//               // Navigate to article detail screen
//             },
//           );
//         },
//       );
//     }
//   }
// }
