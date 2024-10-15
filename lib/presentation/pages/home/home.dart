part of'home_import.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PhotosBloc>(context).add(FetchPhotos());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {

        if(state is AuthAuthenticated){
          Utils().toastMessage('Authenticated as ${state.email}');
        }
        else if(state is AuthFailure){
          Utils().toastMessage('Auth Failed: ${state.error}');
        }
      },
      child: BlocBuilder<AuthBloc,AuthState>(
        buildWhen: (previous, current) => previous != current,
        builder:  (context, state) {
          if(state is AuthLoading){
            SpinKitSquareCircle(size: 40,color: Colors.black,);
          }
          return Scaffold(
            appBar:buildAppBar("DashBoard", Colors.grey, Colors.black, () {
              BlocProvider.of<AuthBloc>(context).add(AuthLogOutRequested());

            }),
            body: BlocBuilder<PhotosBloc,PhotosState>(
              builder: (context, state) {
                if(state is PhotosLoading){
                  return const Center(child:SpinKitSquareCircle(size: 40,color: Colors.black,));
                }
                else if(state is PhotosLoaded){
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                      primary: true,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final photo = state.photos[index];
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  photo.url.toString()
                                ),
                              ),
                              title: Text(photo.id.toString()),
                              subtitle: Text(photo.title.toString()),
                            ),
                          ),
                        );
                      },
                  );
                }
                else if(state is PhotosError){
                  return Center(child: Text(state.message),);
                }
                return SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}
