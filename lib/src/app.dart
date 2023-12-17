import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/impl/interactor/sorting_interactor_impl.dart';
import 'package:sorting_algorithms_visualization/src/application/impl/interactor/values_interactor_impl.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_cubit.dart';
import 'package:sorting_algorithms_visualization/src/presentation/screen/sorting_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SortingCubit(
              sortingInteractor: SortingInteractorImpl(),
              valuesInteractor: ValuesInteractorImpl(),
            ),
          ),
        ],
        child: const SortingScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
