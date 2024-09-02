import 'package:blocprovider_clean_coding/config/components/internet_exception_widget.dart';
import 'package:blocprovider_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movies_bloc/movie_bloc.dart';
import '../../config/routes/routes_name.dart';
import '../../main.dart';
import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    moviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
        elevation: 20,
        shadowColor: Colors.redAccent[200],
        actions: [
          IconButton(onPressed: () {
            LocalStorage localStorage = LocalStorage();
            localStorage.clearValue('token').then((vlaue) {
              localStorage.clearValue('isLogin').then((value) {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            });
          }, icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (BuildContext context, state) {
            switch(state.moviesList.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.error:
                if(state.moviesList.message =='No Internet Connection') {
                  return InternetExecpetionWidget(
                    onPress: () {
                      moviesBloc.add(MoviesFetched());
                    },
                  );
                }
                return  Center(child:Text(state.moviesList.message.toString()));
              case Status.completed:
                if(state.moviesList.data == null){
                  return Text('No Data Found');
                }
                final movieList = state.moviesList.data!;
                return ListView.builder(
                    itemCount: movieList.tvShow.length,
                    itemBuilder:(context, index){
                      final tvShow = movieList.tvShow[index];
                      return Card(
                        child: ListTile(
                          leading: Image(image: NetworkImage(tvShow.imageThumbnailPath)),
                          title: Text(tvShow.name.toString()),
                          subtitle: Text(tvShow.network.toString()),
                          trailing: Text(tvShow.status.toString()),
                        ),
                      );
                    } );
              default:
                return Column();
            }
          },
        ),
      ),
    );
  }
}
