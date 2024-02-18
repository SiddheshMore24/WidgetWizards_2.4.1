  import 'package:cached_network_image/cached_network_image.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_spinkit/flutter_spinkit.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:widget_wizards/model/newsHeadlineModel.dart';
  import 'package:widget_wizards/view/news_view_model.dart';

  import '../model/project.dart';

  class News extends StatefulWidget {
    const News({Key? key}) : super(key: key);

    @override
    State<News> createState() => _NewsState();
  }

  class _NewsState extends State<News> {
    NewsViewModel newsViewModel = NewsViewModel();

    @override
    Widget build(BuildContext context) {
      final myHeight = MediaQuery.of(context).size.height;
      final myWidth = MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: FutureBuilder<NewsHeadlineModel>(
          future: newsViewModel.fetchHeadline(),
          builder: (BuildContext context, AsyncSnapshot<NewsHeadlineModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError || snapshot.data == null) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data!.articles![index].urlToImage ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: myHeight * 0.3, // Adjust as needed
                                  child: Center(child: spinKit2),
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error_outline, color: Colors.red),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data!.articles![index].title.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20, // Increased font size for headline
                                    fontWeight: FontWeight.bold, // Bold font weight for emphasis
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
          },
        ),
      );
    }
  }

  const spinKit2 = SpinKitFadingCircle(
    color: Colors.amber,
    size: 50,
  );
