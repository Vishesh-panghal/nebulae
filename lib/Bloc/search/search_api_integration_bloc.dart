import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_api_integration_event.dart';
part 'search_api_integration_state.dart';

class SearchApiIntegrationBloc
    extends Bloc<SearchApiIntegrationEvent, SearchApiIntegrationState> {
  SearchApiIntegrationBloc() : super(SearchApiIntegrationInitial()) {
    on<SearchApiIntegrationEvent>((event, emit) {});
  }
}
