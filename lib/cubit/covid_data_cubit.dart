import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:coronavirus_tracker_ph/networking/networking.dart';

part 'covid_data_state.dart';

class CovidDataCubit extends Cubit<CovidDataState> {
  CovidDataCubit() : super(CovidDataInitial());
}
