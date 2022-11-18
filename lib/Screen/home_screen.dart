import 'package:api_handling_3/Logic/Cubits/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if(state is PostLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is PostLoadedState){
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  var data = state.posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(data.title.toString()),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(data.body.toString()),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text("An error occured!"),
            );
          },
        ),
      ),
    );
  }
}
