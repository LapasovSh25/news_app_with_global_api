import 'package:flutter/material.dart';
import 'package:news_app_with_global_api/core/constants/project_urls.dart';
import 'package:news_app_with_global_api/data/model/news_model.dart';
import 'package:news_app_with_global_api/data/service/news_service.dart';

class TeslaNewsWidget extends StatelessWidget {
  const TeslaNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: GetNewsService.getNews(url: ProjectUrls.teslaUrl),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          NewsModel data = snapshot.data as NewsModel;
          return ListView.builder(
            itemCount: data.articles!.length,
            itemBuilder: (context, index) {
             return Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.height * 0.02),
                child: Column(
                  children: [
                    Image.network(data.articles![index].urlToImage.toString(),),
                
                    Card(
                      child: ListTile(
                        title: Text(
                          data.articles![index].title.toString(),
                        ),
                        subtitle:
                            Text(data.articles![index].description.toString()),
                      ),
                    ),

                    Divider(color: Colors.grey, height: size.height * 0.05,)
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}