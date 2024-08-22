import 'package:bloc_project/features/cart/ui/cart.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cart()),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Wishlist()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                  title:
                      const Text("Grocery App", style: TextStyle(fontSize: 20)),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.shopping_bag_outlined)),
                  ]),
              body: const Column(
                children: [],
              ),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text("Error")),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}


/* 


 */