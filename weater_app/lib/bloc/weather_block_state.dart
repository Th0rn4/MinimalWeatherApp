part of 'weather_block_bloc.dart';

sealed class WeatherBlockState extends Equatable {
  const WeatherBlockState();
  
  @override
  List<Object> get props => [];
}

final class WeatherBlockInitial extends WeatherBlockState {}

final class WeatherBlockLoading extends WeatherBlockState {}
final class WeatherBlockFailure extends WeatherBlockState {}
final class WeatherBlockSuccess extends WeatherBlockState {
  final Weather weather;

  const WeatherBlockSuccess(this.weather);

  @override 
  List<Object> get props => [weather];
}

