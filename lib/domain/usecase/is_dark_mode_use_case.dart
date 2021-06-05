import '../repository/app_repository.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class IsDarkModeUseCase {
  final AppRepository _appRepository;

  IsDarkModeUseCase(this._appRepository);

  bool call() => _appRepository.isDarkMode;
}