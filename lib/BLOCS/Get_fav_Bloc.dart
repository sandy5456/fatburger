

import 'package:kyankafe/JSON_DATA/repository/repositories.dart';
import 'package:kyankafe/MODEL/get_fav_Model.dart';
import 'package:rxdart/rxdart.dart';

class GetFavBloc {
  final _repository = Repository();
  final _favListFetcher = PublishSubject<List<GetFavModel>>();

  Observable<List<GetFavModel>> get allfav => _favListFetcher.stream;

  fetchAllfavList() async {
    List<GetFavModel> categoryModel = await _repository.fetchAllfavList();
    _favListFetcher.sink.add(categoryModel);
  }

  dispose() async {
    await _favListFetcher.drain();
    _favListFetcher.close();
  }
}

final getFavBloc = GetFavBloc();