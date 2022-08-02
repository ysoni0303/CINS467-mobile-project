import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/models/users.dart';
// import 'package:video_app/views/screens/profile_screen.dart';
import 'package:video_app/controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final SearchController _searchController = Get.put(SearchController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            controller: searchController,
            decoration: const InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onFieldSubmitted: (value) => _searchController.searchUser(value),
          ),
        ),
        body: _searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text(
                  'Search for users!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Obx(() {
                return ListView.builder(
                  itemCount: _searchController.searchedUsers.length,
                  itemBuilder: (context, index) {
                    final searchData = _searchController.searchedUsers[index];
                    print("searchData");
                    print(searchData.profilePhoto);
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          searchData.profilePhoto,
                        ),
                      ),
                      title: Text(
                        searchData.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );
              }),
      );
    });
  }
}
