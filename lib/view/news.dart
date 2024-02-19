import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsState();
}

class News {
  final String headline;
  final String description;
  final String imageUrl;

  News({required this.headline, required this.description, required this.imageUrl});
}

class _NewsState extends State<NewsPage> {
  final List<News> newsList = [
    // Your list of news items here
    News(
      headline: 'Natural disasters caused 2.5 million internal displacements in India in 2022, report says',
      description: 'The report also said South Asia collectively witnessed 12.5 million internal displacements due to disasters in 2022, with Pakistan, India and Bangladesh being the most affected. South Asia witnessed 12.5 million internal displacements due to disasters in 2022, with floods triggering 90% of the movements in the region. “All countries recorded flood displacement, but Pakistan, India and Bangladesh were the most affected. Most movements occurred during the southwest monsoon between June and September,” the report said.',
      imageUrl: 'https://img.etimg.com/thumb/width-1600,height-900,imgsize-281528,resizemode-75,msid-100322316/news/india/natural-disasters-caused-2-5-million-internal-displacements-in-india-in-2022-report-says.jpg',
    ),
    News(
      headline: 'Covid 19 update: Two fresh corona deaths reported in country',
      description: 'India has witnessed three waves of COVID-19 in the past with the peak incidence of daily new cases and deaths being reported during the Delta wave in April-June 2021. India has logged 166 new cases of Covid, While the number of active cases of the infection has declined to 859, according to the Union Health Ministry data updated on Friday. Two new deaths--one each from Haryana and Maharashtra -- have been reported in a span of 24 hours, the data updated at 8 am stated.',
      imageUrl: 'https://static.toiimg.com/thumb/msid-106426374,width-1280,height-720,resizemode-4,imgsize-31028/106426374.jpg',
    ),
    News(
      headline: 'Shallow fog covers north India; IMD predicts light rainfall in Delhi',
      description: 'A layer of shallow fog was witnessed in several parts of northern India on Sunday morning, with the Indian Meteorological Department predicting light to moderate rain at several places over the next two days in Delhi, Haryana, and Chandigarh.The minimum temperature in Delhi today is likely to hover around 9 degrees Celsius, while the maximum temperature at 27 degrees Celsius today, said IMD, adding a partly cloudy weather for the day. Visuals showed light fog at Kartavya Path in the National Capital.',
      imageUrl: 'https://m.economictimes.com/thumb/msid-107790040,width-1200,height-900,resizemode-4,imgsize-6350/shallow-fog-covers-north-india-imd-predicts-light-rainfall-in-delhi.jpg',
    ),
    News(
      headline: 'Unseasonal rain, hailstorms hit crops in Maharashtra\'s Vidarbha region',
      description: 'Maharashtra\'s Vidarbha region has received unseasonal rainfall along with hailstorms, affecting various crops including cotton, an official said on Sunday. Nagpur, Yavatmal, Wardha and Amaravati districts in the Vidarbha region reported heavy spells of showers followed by gusty winds and hailstorms on Saturday. The India Meteorological Department (IMD) had issued a forecast of unseasonal rains in the area on Saturday.he MeT department has issued a \'yellow alert\' for most parts of Vidarbha on Sunday also, saying thunderstorms and rainfall are very likely at isolated places in the region.',
      imageUrl: 'https://resize.indiatvnews.com/en/resize/newbucket/400_-/2024/02/crop-1707634207.jpg',
    ),
    News(
      headline: 'Hyderabad Authorities developing early warning system for flood with the help of IIT',
      description: 'Hyderabad Municipal Corporation\'s Enforcement Vigilance & Disaster Management (EVDM) wing, in collaboration with IIT-Hyderabad, is working on the development of an urban flood early warning system. This system aims to prevent loss of lives and facilitate early evacuation during heavy rainfall in Hyderabad, a TOI report stated. Through the use of rainfall data from the past two decades, the flood warning system will identify areas that are vulnerable to flooding. Currently, there are 2 ..',
      imageUrl: 'https://img.etimg.com/thumb/width-1200,height-900,imgsize-189642,resizemode-75,msid-106180648/news/india/hyderabad-authorities-developing-early-warning-system-for-flood-with-the-help-of-iit.jpg',
    ),
    News(
      headline: 'Drone Visuals: Heavy rainfall causes severe waterlogging in Thoothukudi, Tamil Nadu',
      description: 'Heavy rainfall has caused severe flooding in numerous regions of southern Tamil Nadu, including Tirunelveli and Thoothukudi. Floodwater has inundated villages, towns, roads, and highways, flooding houses and leaving people stranded. The water level has risen over four feet in Thoothukudi and Tirunelveli, and the bus terminals in both cities now look like large swimming pools. Floodwater has cut off access to villages such as Oothu.',
      imageUrl: 'https://economictimes.indiatimes.com/thumb/msid-106126304,width-1600,height-900,resizemode-4/news/india/drone-visuals-heavy-rainfall-causes-severe-waterlogging-in-thoothukudi-tamil-nadu.jpg',
    ),
    News(
      headline: 'Earthquake of magnitude 5 shakes Mexico\'s resort town of Acapulco',
      description: 'A magnitude 5.0 earthquake hit near the Mexican resort town of Acapulco on the Pacific coast on Saturday afternoon, according to the country\'s national seismological service. In capital Mexico City, the earthquake alarm caused residents to evacuate but no damages were reported, Mayor Marti Batres said on social media X.',
      imageUrl: 'https://static.independent.co.uk/2023/10/25/21/SEI177419598.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('News Data'),
      ),
      body: Theme(
        data: ThemeData.light(),
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsCard(news: newsList[index]);
          },
        ),
      ),
    );
  }
}


class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.all(12.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.headline,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  news.description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

