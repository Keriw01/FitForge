/// Setting the type of editable field for displaying the loading indicator for specific row
enum ProfileCurrenRow {
  none,
  userName,
  gender,
  birthDate,
  currentWorkoutLevel,
}

enum ProfileResponseMessage {
  none,
  documentIdNotExist,
  firestoreException,
  defaultError,
}
