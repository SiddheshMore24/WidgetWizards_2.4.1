import 'package:flutter/material.dart';
import 'package:widget_wizards/view/payment.dart';

// Define a class to represent a calamity
class Calamity {
  final String name;
  final String description;

  Calamity({required this.name, required this.description});
}

// Dummy data for calamities
List<Calamity> calamities = [
  Calamity(
    name: 'Earthquake in XYZ region',
    description: 'This calamity is about the recent earthquake...',
  ),
  Calamity(
    name: 'Floods in ABC province',
    description: 'Heavy rains have caused severe flooding in...',
  ),
  Calamity(
    name: 'Hurricane in Coastal Region',
    description: 'A powerful hurricane has made landfall in the coastal region, causing widespread destruction and flooding. Many homes and infrastructure have been severely damaged, and thousands of people are in need of immediate assistance.',
  ),
  Calamity(
    name: 'Wildfire in Mountainous Area',
    description: 'A large wildfire has broken out in the mountainous area, spreading rapidly due to dry conditions and strong winds. The fire has engulfed acres of forestland, threatening wildlife and nearby communities. Firefighters are working tirelessly to contain the blaze.',
  ),
  Calamity(
    name: 'Tornado Strike in Suburban Town',
    description: 'A destructive tornado has struck a suburban town, leaving a trail of devastation in its wake. Homes have been torn apart, vehicles overturned, and trees uprooted. Emergency services are scrambling to rescue survivors and provide medical aid.',
  ),
  Calamity(
    name: 'Drought in Agricultural Region',
    description: 'An ongoing drought has gripped an agricultural region, leading to crop failures, water shortages, and economic hardship for farmers. Livestock are suffering from lack of food and water, and communities are facing food insecurity. Relief efforts are underway to provide assistance to affected areas.',
  ),
  Calamity(
    name: 'Volcanic Eruption on Island',
    description: 'A volcanic eruption has occurred on a remote island, spewing ash and lava into the air. Nearby settlements are at risk of pyroclastic flows and ashfall, forcing residents to evacuate to safer areas. Authorities are monitoring the situation closely and coordinating evacuation and relief efforts.',
  ),
];

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content & Donation'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:ListView.builder(
        itemCount: calamities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: InkWell(
              onTap: () {
                // Navigate to the detail page when a calamity is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalamityDetailPage(calamity: calamities[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    calamities[index].name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Change the color as per your design
                    ),
                  ),
                  subtitle: Text(
                    calamities[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  leading: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 36.0,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}

class CalamityDetailPage extends StatelessWidget {
  final Calamity calamity;

  CalamityDetailPage({required this.calamity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calamity Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      calamity.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      calamity.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'Donate',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
