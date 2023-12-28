class ErrorMessages {
  factory ErrorMessages.somethingWentWrong() => const ErrorMessages('Something went wrong!');
  factory ErrorMessages.noInternetConnection() => const ErrorMessages(
        'No Internet Connection!',
        extraContent: 'Please check your internet connection.',
      );
  factory ErrorMessages.badInternetConnection() => const ErrorMessages(
        'Something went wrong!',
        extraContent: 'Please check your internet connection.',
      );
  factory ErrorMessages.unableToGetCachedData() => const ErrorMessages('Unable to Get Cached Data!');
  factory ErrorMessages.unableToRemoveDataFromCache() => const ErrorMessages('Unable to Remove Data From Cache!');
  factory ErrorMessages.unableToCacheData() => const ErrorMessages('Unable to Cache Data!');

  final String content;
  final String? extraContent;
  const ErrorMessages(this.content, {this.extraContent});
}
