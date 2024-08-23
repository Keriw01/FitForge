enum AuthResponseMessage {
  none,
  userAlreadyExist,
  badAuthorization,
  defaultError,
  userAlreadyLogIn,
  invalidEmailFormat,
  googleLoginCanceled,
  gitHubLoginCanceled,
  networkRequestFailed
}

/// Setting the type of editable field for displaying the loading indicator for specific row
enum ProfileCurrenRow {
  none,
  userName,
  gender,
  birthDate,
  currentWorkoutLevel,
  topGoal,
  unitSystem,
  defaultReps,
  defaultSets,
  connectWithGoogleFit,
}

enum FirestoreResponseMessage {
  none,
  documentIdNotExist,
  firestoreException,
  defaultError,
}