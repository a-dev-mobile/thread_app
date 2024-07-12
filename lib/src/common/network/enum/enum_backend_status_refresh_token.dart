// turnGen

enum EnumBackendStatusRefreshToken implements Comparable<EnumBackendStatusRefreshToken> {
  invalidRequestBody('INVALID_REQUEST_BODY'),
  invalidParameters('INVALID_PARAMETERS'),
  validationFailed('VALIDATION_FAILED'),
  userNotFound('USER_NOT_FOUND'),
  emailVerifiedPasswordNotSet('EMAIL_VERIFIED_PASSWORD_NOT_SET'),
  emailAndPasswordVerified('EMAIL_AND_PASSWORD_VERIFIED'),
  invalidCode('INVALID_CODE'),
  updateVerificationStatusFailed('UPDATE_VERIFICATION_STATUS_FAILED'),
  accessTokenGenerationFailed('ACCESS_TOKEN_GENERATION_FAILED'),
  refreshTokenGenerationFailed('REFRESH_TOKEN_GENERATION_FAILED'),
  refreshTokenSavingFailed('REFRESH_TOKEN_SAVING_FAILED'),
  tooManyAttempts('TOO_MANY_ATTEMPTS'),
  verificationSuccessful('VERIFICATION_SUCCESSFUL');

  const EnumBackendStatusRefreshToken(this.name);
  final String name;

// end

//          --TURN_GEN--
//             (enum)
//  *************************************
//         GENERATED CODE
//  *************************************

  static EnumBackendStatusRefreshToken fromName(
    String? name, {
    EnumBackendStatusRefreshToken? fallback,
  }) {
    switch (name) {
      case 'INVALID_REQUEST_BODY':
        return invalidRequestBody;
      case 'INVALID_PARAMETERS':
        return invalidParameters;
      case 'VALIDATION_FAILED':
        return validationFailed;
      case 'USER_NOT_FOUND':
        return userNotFound;
      case 'EMAIL_VERIFIED_PASSWORD_NOT_SET':
        return emailVerifiedPasswordNotSet;
      case 'EMAIL_AND_PASSWORD_VERIFIED':
        return emailAndPasswordVerified;
      case 'INVALID_CODE':
        return invalidCode;
      case 'UPDATE_VERIFICATION_STATUS_FAILED':
        return updateVerificationStatusFailed;
      case 'ACCESS_TOKEN_GENERATION_FAILED':
        return accessTokenGenerationFailed;
      case 'REFRESH_TOKEN_GENERATION_FAILED':
        return refreshTokenGenerationFailed;
      case 'REFRESH_TOKEN_SAVING_FAILED':
        return refreshTokenSavingFailed;
      case 'TOO_MANY_ATTEMPTS':
        return tooManyAttempts;
      case 'VERIFICATION_SUCCESSFUL':
        return verificationSuccessful;
      default:
        return fallback ??
            (throw ArgumentError.value(
              name,
              'name',
              'Value not found in EnumBackendStatusRefreshToken',
            ));
    }
  }

  static EnumBackendStatusRefreshToken? fromNameOrNull(
    String? name,
  ) {
    switch (name) {
      case 'INVALID_REQUEST_BODY':
        return invalidRequestBody;
      case 'INVALID_PARAMETERS':
        return invalidParameters;
      case 'VALIDATION_FAILED':
        return validationFailed;
      case 'USER_NOT_FOUND':
        return userNotFound;
      case 'EMAIL_VERIFIED_PASSWORD_NOT_SET':
        return emailVerifiedPasswordNotSet;
      case 'EMAIL_AND_PASSWORD_VERIFIED':
        return emailAndPasswordVerified;
      case 'INVALID_CODE':
        return invalidCode;
      case 'UPDATE_VERIFICATION_STATUS_FAILED':
        return updateVerificationStatusFailed;
      case 'ACCESS_TOKEN_GENERATION_FAILED':
        return accessTokenGenerationFailed;
      case 'REFRESH_TOKEN_GENERATION_FAILED':
        return refreshTokenGenerationFailed;
      case 'REFRESH_TOKEN_SAVING_FAILED':
        return refreshTokenSavingFailed;
      case 'TOO_MANY_ATTEMPTS':
        return tooManyAttempts;
      case 'VERIFICATION_SUCCESSFUL':
        return verificationSuccessful;
      default:
        return null;
    }
  }

  T map<T>({
    required T Function() invalidRequestBody,
    required T Function() invalidParameters,
    required T Function() validationFailed,
    required T Function() userNotFound,
    required T Function() emailVerifiedPasswordNotSet,
    required T Function() emailAndPasswordVerified,
    required T Function() invalidCode,
    required T Function() updateVerificationStatusFailed,
    required T Function() accessTokenGenerationFailed,
    required T Function() refreshTokenGenerationFailed,
    required T Function() refreshTokenSavingFailed,
    required T Function() tooManyAttempts,
    required T Function() verificationSuccessful,
  }) {
    switch (this) {
      case EnumBackendStatusRefreshToken.invalidRequestBody:
        return invalidRequestBody();
      case EnumBackendStatusRefreshToken.invalidParameters:
        return invalidParameters();
      case EnumBackendStatusRefreshToken.validationFailed:
        return validationFailed();
      case EnumBackendStatusRefreshToken.userNotFound:
        return userNotFound();
      case EnumBackendStatusRefreshToken.emailVerifiedPasswordNotSet:
        return emailVerifiedPasswordNotSet();
      case EnumBackendStatusRefreshToken.emailAndPasswordVerified:
        return emailAndPasswordVerified();
      case EnumBackendStatusRefreshToken.invalidCode:
        return invalidCode();
      case EnumBackendStatusRefreshToken.updateVerificationStatusFailed:
        return updateVerificationStatusFailed();
      case EnumBackendStatusRefreshToken.accessTokenGenerationFailed:
        return accessTokenGenerationFailed();
      case EnumBackendStatusRefreshToken.refreshTokenGenerationFailed:
        return refreshTokenGenerationFailed();
      case EnumBackendStatusRefreshToken.refreshTokenSavingFailed:
        return refreshTokenSavingFailed();
      case EnumBackendStatusRefreshToken.tooManyAttempts:
        return tooManyAttempts();
      case EnumBackendStatusRefreshToken.verificationSuccessful:
        return verificationSuccessful();
    }
  }

  T mapValue<T>({
    required T invalidRequestBody,
    required T invalidParameters,
    required T validationFailed,
    required T userNotFound,
    required T emailVerifiedPasswordNotSet,
    required T emailAndPasswordVerified,
    required T invalidCode,
    required T updateVerificationStatusFailed,
    required T accessTokenGenerationFailed,
    required T refreshTokenGenerationFailed,
    required T refreshTokenSavingFailed,
    required T tooManyAttempts,
    required T verificationSuccessful,
  }) {
    switch (this) {
      case EnumBackendStatusRefreshToken.invalidRequestBody:
        return invalidRequestBody;
      case EnumBackendStatusRefreshToken.invalidParameters:
        return invalidParameters;
      case EnumBackendStatusRefreshToken.validationFailed:
        return validationFailed;
      case EnumBackendStatusRefreshToken.userNotFound:
        return userNotFound;
      case EnumBackendStatusRefreshToken.emailVerifiedPasswordNotSet:
        return emailVerifiedPasswordNotSet;
      case EnumBackendStatusRefreshToken.emailAndPasswordVerified:
        return emailAndPasswordVerified;
      case EnumBackendStatusRefreshToken.invalidCode:
        return invalidCode;
      case EnumBackendStatusRefreshToken.updateVerificationStatusFailed:
        return updateVerificationStatusFailed;
      case EnumBackendStatusRefreshToken.accessTokenGenerationFailed:
        return accessTokenGenerationFailed;
      case EnumBackendStatusRefreshToken.refreshTokenGenerationFailed:
        return refreshTokenGenerationFailed;
      case EnumBackendStatusRefreshToken.refreshTokenSavingFailed:
        return refreshTokenSavingFailed;
      case EnumBackendStatusRefreshToken.tooManyAttempts:
        return tooManyAttempts;
      case EnumBackendStatusRefreshToken.verificationSuccessful:
        return verificationSuccessful;
    }
  }

  T maybeMap<T>({
    required T Function() orElse,
    T Function()? invalidRequestBody,
    T Function()? invalidParameters,
    T Function()? validationFailed,
    T Function()? userNotFound,
    T Function()? emailVerifiedPasswordNotSet,
    T Function()? emailAndPasswordVerified,
    T Function()? invalidCode,
    T Function()? updateVerificationStatusFailed,
    T Function()? accessTokenGenerationFailed,
    T Function()? refreshTokenGenerationFailed,
    T Function()? refreshTokenSavingFailed,
    T Function()? tooManyAttempts,
    T Function()? verificationSuccessful,
  }) =>
      map<T>(
        invalidRequestBody: invalidRequestBody ?? orElse,
        invalidParameters: invalidParameters ?? orElse,
        validationFailed: validationFailed ?? orElse,
        userNotFound: userNotFound ?? orElse,
        emailVerifiedPasswordNotSet: emailVerifiedPasswordNotSet ?? orElse,
        emailAndPasswordVerified: emailAndPasswordVerified ?? orElse,
        invalidCode: invalidCode ?? orElse,
        updateVerificationStatusFailed: updateVerificationStatusFailed ?? orElse,
        accessTokenGenerationFailed: accessTokenGenerationFailed ?? orElse,
        refreshTokenGenerationFailed: refreshTokenGenerationFailed ?? orElse,
        refreshTokenSavingFailed: refreshTokenSavingFailed ?? orElse,
        tooManyAttempts: tooManyAttempts ?? orElse,
        verificationSuccessful: verificationSuccessful ?? orElse,
      );

  T maybeMapValue<T>({
    required T orElse,
    T? invalidRequestBody,
    T? invalidParameters,
    T? validationFailed,
    T? userNotFound,
    T? emailVerifiedPasswordNotSet,
    T? emailAndPasswordVerified,
    T? invalidCode,
    T? updateVerificationStatusFailed,
    T? accessTokenGenerationFailed,
    T? refreshTokenGenerationFailed,
    T? refreshTokenSavingFailed,
    T? tooManyAttempts,
    T? verificationSuccessful,
  }) =>
      mapValue<T>(
        invalidRequestBody: invalidRequestBody ?? orElse,
        invalidParameters: invalidParameters ?? orElse,
        validationFailed: validationFailed ?? orElse,
        userNotFound: userNotFound ?? orElse,
        emailVerifiedPasswordNotSet: emailVerifiedPasswordNotSet ?? orElse,
        emailAndPasswordVerified: emailAndPasswordVerified ?? orElse,
        invalidCode: invalidCode ?? orElse,
        updateVerificationStatusFailed: updateVerificationStatusFailed ?? orElse,
        accessTokenGenerationFailed: accessTokenGenerationFailed ?? orElse,
        refreshTokenGenerationFailed: refreshTokenGenerationFailed ?? orElse,
        refreshTokenSavingFailed: refreshTokenSavingFailed ?? orElse,
        tooManyAttempts: tooManyAttempts ?? orElse,
        verificationSuccessful: verificationSuccessful ?? orElse,
      );

  T? maybeMapOrNull<T>({
    T Function()? invalidRequestBody,
    T Function()? invalidParameters,
    T Function()? validationFailed,
    T Function()? userNotFound,
    T Function()? emailVerifiedPasswordNotSet,
    T Function()? emailAndPasswordVerified,
    T Function()? invalidCode,
    T Function()? updateVerificationStatusFailed,
    T Function()? accessTokenGenerationFailed,
    T Function()? refreshTokenGenerationFailed,
    T Function()? refreshTokenSavingFailed,
    T Function()? tooManyAttempts,
    T Function()? verificationSuccessful,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        invalidRequestBody: invalidRequestBody,
        invalidParameters: invalidParameters,
        validationFailed: validationFailed,
        userNotFound: userNotFound,
        emailVerifiedPasswordNotSet: emailVerifiedPasswordNotSet,
        emailAndPasswordVerified: emailAndPasswordVerified,
        invalidCode: invalidCode,
        updateVerificationStatusFailed: updateVerificationStatusFailed,
        accessTokenGenerationFailed: accessTokenGenerationFailed,
        refreshTokenGenerationFailed: refreshTokenGenerationFailed,
        refreshTokenSavingFailed: refreshTokenSavingFailed,
        tooManyAttempts: tooManyAttempts,
        verificationSuccessful: verificationSuccessful,
      );

  T? maybeMapOrNullValue<T>({
    T? invalidRequestBody,
    T? invalidParameters,
    T? validationFailed,
    T? userNotFound,
    T? emailVerifiedPasswordNotSet,
    T? emailAndPasswordVerified,
    T? invalidCode,
    T? updateVerificationStatusFailed,
    T? accessTokenGenerationFailed,
    T? refreshTokenGenerationFailed,
    T? refreshTokenSavingFailed,
    T? tooManyAttempts,
    T? verificationSuccessful,
  }) =>
      maybeMapValue<T?>(
        orElse: null,
        invalidRequestBody: invalidRequestBody,
        invalidParameters: invalidParameters,
        validationFailed: validationFailed,
        userNotFound: userNotFound,
        emailVerifiedPasswordNotSet: emailVerifiedPasswordNotSet,
        emailAndPasswordVerified: emailAndPasswordVerified,
        invalidCode: invalidCode,
        updateVerificationStatusFailed: updateVerificationStatusFailed,
        accessTokenGenerationFailed: accessTokenGenerationFailed,
        refreshTokenGenerationFailed: refreshTokenGenerationFailed,
        refreshTokenSavingFailed: refreshTokenSavingFailed,
        tooManyAttempts: tooManyAttempts,
        verificationSuccessful: verificationSuccessful,
      );

  static List<String> getListName() => EnumBackendStatusRefreshToken.values.map((e) => e.name).toList();

  @override
  int compareTo(EnumBackendStatusRefreshToken other) => index.compareTo(other.index);
}

extension $EnumBackendStatusRefreshToken on EnumBackendStatusRefreshToken {
  bool get isInvalidRequestBody => this == EnumBackendStatusRefreshToken.invalidRequestBody;
  bool get isInvalidParameters => this == EnumBackendStatusRefreshToken.invalidParameters;
  bool get isValidationFailed => this == EnumBackendStatusRefreshToken.validationFailed;
  bool get isUserNotFound => this == EnumBackendStatusRefreshToken.userNotFound;
  bool get isEmailVerifiedPasswordNotSet => this == EnumBackendStatusRefreshToken.emailVerifiedPasswordNotSet;
  bool get isEmailAndPasswordVerified => this == EnumBackendStatusRefreshToken.emailAndPasswordVerified;
  bool get isInvalidCode => this == EnumBackendStatusRefreshToken.invalidCode;
  bool get isUpdateVerificationStatusFailed => this == EnumBackendStatusRefreshToken.updateVerificationStatusFailed;
  bool get isAccessTokenGenerationFailed => this == EnumBackendStatusRefreshToken.accessTokenGenerationFailed;
  bool get isRefreshTokenGenerationFailed => this == EnumBackendStatusRefreshToken.refreshTokenGenerationFailed;
  bool get isRefreshTokenSavingFailed => this == EnumBackendStatusRefreshToken.refreshTokenSavingFailed;
  bool get isTooManyAttempts => this == EnumBackendStatusRefreshToken.tooManyAttempts;
  bool get isVerificationSuccessful => this == EnumBackendStatusRefreshToken.verificationSuccessful;
}
