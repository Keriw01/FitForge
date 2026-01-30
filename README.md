# FitForge - osobisty asystent treningu siłowego

## Spis treści
1. [O projekcie](#o-projekcie)
2. [Technologie i biblioteki](#technologie-i-biblioteki)
3. [Architektura i wzorce projektowe](#architektura-i-wzorce-projektowe)
4. [Funkcjonalności](#funkcjonalności)
5. [Model danych](#model-danych)
6. [Prezentacja wizualna](#prezentacja-wizualna)
7. [Wyzwania inżynieryjne](#wyzwania-inżynieryjne)

## O projekcie
FitForge to nowoczesna aplikacja mobilna stworzona we frameworku Flutter, która łączy zaawansowane planowanie treningowe z analityką postępów w czasie rzeczywistym. System rozwiązuje kluczowy problem braku wiedzy technicznej początkujących sportowców poprzez moduł skanowania kodów QR (umieszczonych bezpośrednio przy sprzęcie na siłowni), zapewniający natychmiastowy dostęp do instruktaży wideo. Od strony technicznej projekt opiera się na architekturze BLoC/Cubit oraz chmurowej bazie Firebase, co gwarantuje płynną synchronizację danych i wysoką wydajność podczas rejestrowania serii oraz monitorowania parametrów ciała. Dzięki zastosowaniu wzorca Repository i modularnej strukturze, aplikacja stanowi skalowalne rozwiązanie biznesowe, gotowe na dalszą rozbudowę o funkcje społecznościowe czy integrację z urządzeniami wearable.

## Technologie i biblioteki
### **Core**
* **Flutter:** Wykorzystany do budowy wieloplatformowej aplikacji (iOS/Android) z jednego kodu źródłowego. Wykorzystanie silnika graficznego **Skia** pozwoliło na uzyskanie płynnych animacji i spójnego wyglądu na różnych urządzeniach.
* **Dart:** Zastosowanie asynchroniczności (`Future`, `Stream`) do płynnej komunikacji z bazą danych bez blokowania głównego wątku UI. Wykorzystanie kompilacji **JIT** (podczas developmentu - Hot Reload) oraz **AOT** (w wersji produkcyjnej).

### **Backend / Storage**
* **Firebase Authentication:** Obsługa bezpiecznego logowania przez E-mail oraz integracja z zewnętrznymi dostawcami: **Google** i **GitHub**.
* **Cloud Firestore:** Chmurowa baza danych zaimplementowana w modelu dokumentowym. Wykorzystana ze względu na:
    * automatyczną synchronizację danych w czasie rzeczywistym;
    * wsparcie dla **trybu offline** (lokalna kopia danych), co jest istotne w warunkach siłowni (słaby zasięg).

### **State Management / Architecture**
* **BLoC / Cubit:** Wykorzystany do zarządzania stanem aplikacji. Pozwoliło to na całkowite oddzielenie logiki biznesowej od warstwy prezentacji, ułatwiając testowanie i utrzymanie kodu.
* **Formz:** Biblioteka wspomagająca walidację formularzy (logowanie/rejestracja) w sposób reaktywny.

### **Kluczowe biblioteki**
* **Intl:** Pełne wsparcie dla internacjonalizacji - obsługa języka polskiego i angielskiego oraz formatowania dat/liczb.
* **App Router:** Deklaratywny system nawigacji umożliwiający centralne zarządzanie trasami i głębokie linkowanie.
* **QR Code Scanner:** Moduł do odczytu dwuwymiarowych kodów kreskowych w celu automatycznego pobierania instrukcji do ćwiczeń.

### **Narzędzia wspierające**
* **Visual Studio Code:** Główne IDE z wykorzystaniem narzędzi diagnostycznych (Widget Inspector, DevTools).
* **GitHub:** Kontrola wersji z wykorzystaniem modelu pracy opartego na gałęziach (main, develop, feature branches).
* **Adobe XD:** Narzędzie wykorzystane do zaprojektowania pełnego User Flow oraz interaktywnego prototypu przed etapem implementacji.

## Architektura i wzorce projektowe
Aplikacja została zaprojektowana zgodnie z zasadami **Clean Architecture** oraz modularności, co zapewnia separację warstw logicznych i ułatwia wprowadzanie nowych funkcjonalności.

### **State Management: BLoC / Cubit**
* **Separacja:** Całkowite oddzielenie interfejsu użytkownika od logiki biznesowej.
* **Przewidywalność:** Zarządzanie stanem odbywa się poprzez emisję niezmiennych stanów, co sprawia, że zachowanie aplikacji jest łatwe do śledzenia i debugowania.
* **Zastosowanie:** Wykorzystany m.in. w module autoryzacji (`AuthCubit`), zarządzaniu planami (`WorkoutsCubit`) oraz aktywnej sesji (`WorkoutSessionCubit`).

### **Wzorce projektowe**
* **Repository Pattern:** Zastosowany, aby odizolować źródła danych (Firestore) od logiki biznesowej. Repozytoria (np. `FirestoreExercisesRepository`) tworzą warstwę abstrakcji, co pozwala na łatwą zmianę źródła danych (np. z chmury na lokalną bazę SQLite) bez modyfikacji warstwy UI.
* **Singleton Pattern:** Wykorzystany w miejscach wymagających współdzielenia jednej instancji klasy w całej aplikacji, np. w menedżerze konfiguracji czy serwisach uwierzytelniania, co zapobiega nadmiarowemu zużyciu zasobów.
* **App Router:** Centralny wzorzec zarządzania nawigacją. Zamiast rozproszonej logiki przechodzenia między ekranami, trasy są zdefiniowane w jednym miejscu, co ułatwia zarządzanie przepływem użytkownika.

### **Struktura projektu**
W celu wsparcia skalowalności w aplikacji zastosowano przejrzysty, modularny podział katalogów:
```text
lib/
├── consts/       # Stałe i enumeracje (np. poziomy zaawansowania użytkownika)
├── models/       # Modele danych
├── repositories/ # Klasy dostępu do danych
├── routes/       # Definicje tras i konfiguracja nawigacji
├── styles/       # Style UI, motywy (Light/Dark mode), kolory
├── widgets/      # Współdzielone komponenty UI
├── utils/        # Funkcje pomocnicze i integracja z biblioteką Intl
└── pages/        # Ekrany aplikacji podzielone na moduły (np. auth, home)
```

Dzięki implementacji biblioteki **Intl**, aplikacja jest przygotowana do obsługi wielu języków. Wszystkie stringi są odseparowane od kodu źródłowego, co pozwala na łatwe dodawanie nowych wersji językowych (wspierane PL i EN).

## Funkcjonalności
### **1. Inteligentne zarządzanie planami treningowymi**
* **Personalizacja:** Możliwość tworzenia autorskich planów treningowych z określeniem celu (np. budowa masy, redukcja), poziomu trudności oraz liczby dni treningowych.
* **Dynamiczna edycja:** Użytkownik może swobodnie dodawać, usuwać i modyfikować ćwiczenia w ramach konkretnych dni planu.
* **Zarządzanie stanem:** Wykorzystanie `WorkoutsCubit` zapewnia natychmiastową aktualizację interfejsu po każdej zmianie w strukturze planu.

### **2. Moduł aktywnej sesji treningowej**
* **Monitoring w czasie rzeczywistym:** Rejestrowanie czasu trwania sesji za pomocą interaktywnego timera.
* **Logowanie serii:** Intuicyjny interfejs do wprowadzania obciążenia i liczby powtórzeń dla każdej serii.
* **Płynność działania:** System zapobiega dodawaniu pustych serii i pozwala na podgląd historii poprzednich wyników bezpośrednio podczas wykonywania ćwiczenia.
* **Podsumowanie sesji:** Po zakończeniu treningu aplikacja generuje raport z łączną objętością treningową i czasem trwania.

### **3. System edukacji**
* **Szybki dostęp:** Skanowanie kodów QR umieszczonych na sprzęcie siłowni natychmiast przenosi użytkownika do szczegółowej karty ćwiczenia.
* **Instruktaże wideo:** Każde ćwiczenie zawiera film demonstracyjny oraz szczegółowy opis techniki wykonania.
* **Integracja:** Z poziomu zeskanowanego ćwiczenia użytkownik może od razu dodać je do swojego aktualnego planu.

### **4. Analityka i monitorowanie postępów**
* **Historia treningów:** Pełny wgląd w archiwalne sesje wraz ze szczegółowymi statystykami każdej wykonanej serii.
* **Wizualizacja danych:** Generowanie miesięcznych wykresów sumy podniesionego ciężaru, pozwala na wizualne śledzenie progresji siłowej.
* **Statystyki ciała:** Moduł do śledzenia parametrów takich jak waga, wzrost oraz BMI.

### **5. Personalizacja i UI/UX**
* **Adaptacyjność:** Pełne wsparcie dla trybu jasnego i ciemnego.
* **Multi-language:** System dwujęzyczny (PL/EN).
* **Elastyczność jednostek:** Możliwość wyboru między systemem metrycznym (kg/cm) a imperialnym (lbs/in).

### **6. Bezpieczna autoryzacja**
* **Autoryzacja:** Obsługa logowania tradycyjnego (e-mail/hasło) oraz społecznościowego (Google, GitHub) za pośrednictwem Firebase Authentication.
* **Zarządzanie sesją:** Automatyczne przekierowywanie użytkownika w zależności od stanu autoryzacji.

## Model danych
### **Struktura kolekcji**
#### **1. Users**
Kolekcja przechowująca profile użytkowników i ich globalne preferencje.
* **Dokument:** Unikalne ID użytkownika z Firebase Auth.
* **Pola:** `email`, `userName`, `birthDate`.
* **Preferencje treningowe:** `currentWorkoutLevel` (poziom zaawansowania), `topGoal` (cel), `unitSystem` (kg/cm lub lbs/in).
* **Domyślne wartości:** `defaultReps`, `defaultSets` (przyspieszają tworzenie nowych planów).

#### **2. Exercises**
Globalna biblioteka ćwiczeń dostępna dla wszystkich użytkowników.
* **Obsługa Multi-language:** Pola `title`, `description`, `equipment` oraz `mainBodyParts` są przechowywane jako obiekty typu `Map[String, String]`, pozwala to na przełączanie między polską a angielską wersją językową.
* **Multimedia:** Linki do miniatur (`thumbnailUrl`) oraz instruktaży wideo (`videoUrl`).
* **Integracja QR:** Unikalne pole `qrCode` łączące fizyczny kod na siłowni z konkretnym dokumentem ćwiczenia.

#### **3. UserTrainingPlans**
Kolekcja zawierająca spersonalizowane plany treningowe użytkowników.
* **Hierarchia:** `Kolekcja Główna` -> `Podkolekcja Plans` -> `Podkolekcja Days` -> `Podkolekcja PlanExercises`.
* **Pola:** `planName`, `difficultyLevel`, `numberOfDays`.
* **Logika:** Ćwiczenia wewnątrz planów nie są kopiowane, a przechowują jedynie `exerciseRefId`, co zapewnia spójność danych przy aktualizacji globalnej bazy ćwiczeń.

#### **4. UserTrainingSessions**
Rejestr historycznych i aktywnych sesji treningowych.
* **Hierarchia:** `Kolekcja Główna` -> `Podkolekcja Sessions` -> `Podkolekcja SessionExercises` -> `Podkolekcja ExercisesSets`.
* **Pola:** Każda sesja przechowuje zagregowane dane: `totalDuration` (czas trwania), `totalWeightLifted` (łączny tonaż), `totalExercises` (liczba wykonanych ćwiczeń). Każda seria `ExercisesSets` zawiera dane o wykonanych powtórzeniach `reps` i użytym ciężarze `weight`.

## Prezentacja wizualna
### **1. Diagram przypadków użycia i model logiczny danych**
Diagram ilustruje interakcje między użytkownikiem a systemem, definiując granice funkcjonalne aplikacji.

![Diagram Przypadków Użycia](/docs/images/diagram_usecase.jpg)

Model logiczny danych odzwierciedla strukturę subkolekcji w Firestore (np. `User` -> `UserTrainingPlans` -> `Days`).

![Model Logiczny Danych](/docs/images/data_architecture.jpg)

---

### **2. Interfejs użytkownika**
#### **Autoryzacja**
![Ekran Logowania i Rejestracji](/docs/images/authorization.jpg)
* Integracja z Firebase Auth umożliwia logowanie tradycyjne oraz OAuth (Google, GitHub). Interfejs został zaprojektowany z myślą o czytelności i obsłudze błędów walidacji w czasie rzeczywistym (pakiet `Formz`).

---

#### **Zarządzanie planami treningowymi**
![Zakładka Moje plany i Bieżący](/docs/images/my_plans_and_actual.jpg)
* Moduł pozwala na pełny proces CRUD (Create, Read, Update, Delete) planów. Wykorzystanie wzorca `Cubit` zapewnia natychmiastowe odświeżenie UI po zmianie aktywnego planu lub edycji dnia treningowego.

---

#### **Aktywna sesja treningowa**
![Aktywna Sesja Treningowa](/docs/images/active_session.jpg)
* Sercem aplikacji jest moduł logowania treningu. Zawiera timer pracujący w tle, dynamiczne dodawanie serii oraz walidację wprowadzanych ciężarów. Zielony pasek statusu informuje użytkownika o trwającej sesji nawet podczas nawigowania do innych sekcji.

---

#### **Moduł QR i ćwiczenia**
![Lista Ćwiczeń](/docs/images/exercises_list.jpg)
![Skanowanie Kodu QR i Szczegóły Ćwiczenia](/docs/images/qr_view.jpg)
* Skaner QR łączy fizyczny sprzęt na siłowni z bazą wiedzy na temat ćwiczenia, wyświetlając instruktaże wideo i umożliwiając natychmiastowe dodanie ćwiczenia do planu.

---

#### **Statystyki i personalizacja**
![Historia](/docs/images/history_view.jpg)
![Ustawienia](/docs/images/settings_view.jpg)
* Wizualizacja postępów za pomocą wykresów miesięcznych oraz ustawienia profilu (zmiana motywu Light/Dark, wybór systemu miar, języka PL/EN).

---

## Wyzwania inżynieryjne
Podczas realizacji projektu napotkałem kilka kluczowych wyzwań technicznych, których rozwiązanie wymagało głębszego zrozumienia reaktywnego programowania oraz architektury baz danych.

### **1. Reaktywne zarządzanie stanem autoryzacji**
Wyzwaniem było zapewnienie płynnego i bezpiecznego przejścia między ekranem logowania a interfejsem użytkownika w czasie rzeczywistym, bez konieczności manualnego odświeżania stanu aplikacji (np. po wygaśnięciu sesji lub wylogowaniu).

**Rozwiązanie:** 
Zaimplementowałem dedykowany widżet `AuthenticationFlowScreen`, który wykorzystuje wzorzec **StreamBuilder** nasłuchujący na strumieniu `authStateChanges()` z Firebase Authentication. 
* **Mechanizm:** Aplikacja w sposób reaktywny reaguje na każdą zmianę stanu sesji. Jeśli token użytkownika wygaśnie, strumień natychmiast emituje zdarzenie, które automatycznie przekierowuje użytkownika do `LoginPage`.
* **Rezultat:** Wyeliminowałem błędy niespójności danych i zapewniłem że aplikacja wyświetla poprawny ekran w danej chwili.

### **2. Synchronizacja stanów między niezależnymi komponentami**
Tutaj problemem była synchronizacja danych między `WorkoutsCubit` (zarządzającym listą wszystkich planów) a `DayCubit` (zarządzającym konkretnym dniem wewnątrz planu). Zmiana dokonana w szczegółach dnia (np. dodanie ćwiczenia) musiała być natychmiast widoczna na liście głównej (ograniczając operację zapisu do bazy Firestore).

**Rozwiązanie:** 
Zastosowałem architekturę opartą na minimalistycznych aktualizacjach stanów i logice wzajemnego powiadamiania Cubitów. 
* **Mechanizm:** Zamiast przeładowywać cały model danych z chmury po każdej edycji, zaimplementowałem mechanizm lokalnej aktualizacji stanu w `DayCubit`, który następnie przesyła informację o zmianie do `WorkoutsCubit`. Operacja zapisu do Firebase została zoptymalizowana tak, aby odbywała się tylko wtedy, gdy jest to niezbędne.
* **Rezultat:** 
    * UI reaguje natychmiastowo, bez "migotania".
    * Znaczna redukcja liczby operacji zapisu/odczytu w Firestore.