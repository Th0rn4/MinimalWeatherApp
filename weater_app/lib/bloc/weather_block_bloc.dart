import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weater_app/data/my_data.dart';
import 'package:weather/weather.dart';

part 'weather_block_event.dart';
part 'weather_block_state.dart';

class WeatherBlockBloc extends Bloc<WeatherBlockEvent, WeatherBlockState> {
  WeatherBlockBloc() : super(WeatherBlockInitial()) {
    on<FetchWeather>((event, emit) async {
       emit (WeatherBlockLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_Key,language: Language.ENGLISH);
        
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, 
          event.position.longitude);
         emit (WeatherBlockSuccess(weather));
      } catch (e) {
        emit (WeatherBlockFailure());
      }
    });
  }
}
