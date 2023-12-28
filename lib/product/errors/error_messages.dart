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

  final String content;
  final String? extraContent;
  const ErrorMessages(this.content, {this.extraContent});
}
