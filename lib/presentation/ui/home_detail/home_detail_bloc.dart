import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../base/base_bloc.dart';

@Injectable()
class HomeDetailBloc extends BaseBloc {
  final demoData = Stream.value(333).shareReplay(maxSize: 1);

  final demoController = PublishSubject<int>();
}
