import 'package:flutter/material.dart';
import 'package:sports_api/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:sports_api/model/leagues.dart';
import 'package:sports_api/model/players.dart';
import 'package:sports_api/view/about.dart';
import 'package:sports_api/view/details.dart';
import 'package:sports_api/view/leagues.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const About());
              },
              icon: const Icon(Icons.info_rounded, size: 30)),
        ],
        title: const Row(
          children: [
            Icon(
              Icons.sports_soccer_outlined,
              size: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Text("FOOTBALL", style: TextStyle(fontSize: 30)),
          ],
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getLeagues();
          await controller.getPlayers();
        },
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: Text("Leagues",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            ),
            Container(
              height: 170,
              margin: const EdgeInsets.all(20),
              child: FutureBuilder(
                future: controller.getLeagues(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Icon(Icons.sports_soccer_rounded, size: 60),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Column(
                        children: [
                          Icon(
                            Icons.signal_wifi_connected_no_internet_4_rounded,
                            size: 60,
                          ),
                          Text("No Internet Connection",
                              style: TextStyle(fontSize: 19)),
                        ],
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return const Column(
                        children: [
                          Icon(
                            Icons.data_array_rounded,
                            size: 60,
                          ),
                          Text("No Data", style: TextStyle(fontSize: 19)),
                        ],
                      );
                    }
                    return PageView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Card(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              Get.to(() => Leagues(),
                                  arguments: fromJsonLeagues(
                                      snapshot.data['response'][i]['league']));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(50),
                              child: ListTile(
                                leading: Image.network(snapshot.data['response']
                                    [i]['league']['logo']),
                                title: Text(
                                    snapshot.data['response'][i]['league']
                                        ['name'],
                                    style: const TextStyle(fontSize: 20)),
                                subtitle: Text(snapshot.data['response'][i]
                                    ['league']['type']),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Text("");
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Text("Players",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            ),
            FutureBuilder(
              future: controller.getPlayers(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Icon(Icons.sports_soccer_rounded, size: 60),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Column(
                      children: [
                        Icon(
                          Icons.signal_wifi_connected_no_internet_4_rounded,
                          size: 60,
                        ),
                        Text("No Internet Connection",
                            style: TextStyle(fontSize: 19)),
                      ],
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return const Column(
                      children: [
                        Icon(
                          Icons.data_array_rounded,
                          size: 60,
                        ),
                        Text("No Data", style: TextStyle(fontSize: 19)),
                      ],
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          onTap: () {
                            Get.to(() => Details(),
                                arguments: fromJson(
                                    snapshot.data['response'][i]['player']),
                                transition: Transition.zoom,
                                duration: const Duration(milliseconds: 300));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          leading: Image.network(
                              snapshot.data['response'][i]['player']['photo']),
                          title: Text(
                            snapshot.data['response'][i]['player']['name'],
                            style: const TextStyle(fontSize: 25),
                          ),
                          subtitle: Text(
                              "Player Age:${snapshot.data['response'][i]['player']['age'].toString()}",
                              style: const TextStyle(fontSize: 17)),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.blue),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
