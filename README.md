≪ °❈° ≫ B L I N D   D O G ≪ °❈° ≫

um registro pessoal contínuo de estado mental, hábitos e streak.

❝No. This is somewhere to be. This is all you have, but it's still something. Streets and sodium lights. The sky, the world. You're still alive.❞

O nome representa instinto ao invés de controle, continuidade mesmo
sem clareza, e persistência imperfeita.


── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ── STACK ── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ──

    ┈ Flutter (stable) + Material 3 (useMaterial3: true)
    ┈ SQLite local via sqflite + path_provider
    ┈ State management simples (setState)
    ┈ 100% local-first — sem backend externo


── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ── MODELO DE DADOS ── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ──

daily_entries
uma entrada por dia · date em YYYY-MM-DD · único

```
  coluna        tipo          descrição
  ─────────     ──────────    ──────────────────────────
  id            INTEGER PK    autoincrement
  date          TEXT UNIQUE   data do registro (YYYY-MM-DD)
  mood          INTEGER       humor
  energy        INTEGER       energia
  focus         INTEGER       foco
```

streak_state
registro único · id = 1

```
  coluna          tipo          descrição
  ─────────       ──────────    ──────────────────────────
  id              INTEGER PK    sempre 1
  lastRelapse     TEXT          data da última recaída
  currentStreak   INTEGER       streak atual
  bestStreak      INTEGER       melhor streak
```

a linha de streak_state é semeada na criação do banco
(currentStreak = 0, bestStreak = 0), então a leitura nunca vem vazia.


── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ── ARQUITETURA ── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ──

```
lib/
 │
 ├── main.dart
 │
 ├── db/
 │    ├── database.dart      # singleton + criação das tabelas
 │    ├── daily_dao.dart
 │    └── streak_dao.dart
 │
 ├── models/
 │    ├── daily_entry.dart
 │    └── streak_state.dart
 │
 ├── screens/
 │    ├── home_screen.dart   # Blind State
 │    ├── entry_screen.dart
 │    └── history_screen.dart
 │
 └── widgets/
```

── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ── RODANDO ── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ──

```bash
flutter pub get
flutter run
```
