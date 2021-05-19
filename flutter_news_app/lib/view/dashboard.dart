import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/healine_model.dart';
import 'package:http/http.dart' as http;

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.5,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: projectWidget()),
    );
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return Container();
      },
      future: getProjectDetails(),
    );
  }

  Future getProjectDetails() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2021-04-19&sortBy=publishedAt&apiKey=48892645353e43b0b692e73c1dc5e730"));
    //  HeadlineModel headlineModel = HeadlineModel.fromJson(response.body);
    return response;
  }
}
