part of 'covid_data_cubit.dart';

@immutable
abstract class CovidDataState {}

class CovidDataInitial extends CovidDataState {
  CovidDataInitial();
}

class CovidDataLoading extends CovidDataState {
  CovidDataLoading();
}

class CovidDataLoaded extends CovidDataState {
  CovidDataLoaded({this.network});

  final Networking network;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CovidDataLoaded && o.network == network;
  }

  @override
  int get hashCode => network.hashCode;
}
