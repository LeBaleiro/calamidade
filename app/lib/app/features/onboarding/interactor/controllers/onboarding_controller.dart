import 'package:coopartilhar/app/features/onboarding/interactor/interface/i_onboarding_repository.dart';
import 'package:coopartilhar/app/features/onboarding/interactor/state/onboarding_state.dart';
import 'package:core_module/core_module.dart';

class OnboardingController<OnboardingState> extends BaseController<BaseState> {
  final IOnboardingRepository _onboardingRepository;
  OnboardingController(
    this._onboardingRepository,
  ) : super(OnboardingInitialState());

  Future<void> getOnboardingData() async {
    update(OnboardingLoadingState());
    final result = await _onboardingRepository.getOnboardingData();
    result.fold(
      (left) => update(OnboardingErrorState(left)),
      (right) => update(OnboardingSuccessState(data: right)),
    );
  }
}
