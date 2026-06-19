≪ °❈° ≫ B L I N D   D O G ≪ °❈° ≫

um registro pessoal contínuo de estado mental, hábitos e streak
— com foco em autoconsciência, não em performance.

Blind Dog não é um tracker de produtividade. É um sistema íntimo de
acompanhamento de continuidade pessoal em dias não-lineares.

❝ como eu continuo existindo ao longo dos dias,
  mesmo quando minha percepção de mim mesmo está falha ❞

O nome representa instinto ao invés de controle, continuidade mesmo
sem clareza, e persistência imperfeita. O streak não mede desempenho —
ele só diz que o cachorro ainda está andando.


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


── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ── PROGRESSO ── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ──

  ✦  Setup Flutter + dependências (sqflite, path_provider, path)
  ✦  Database singleton + criação das tabelas + seed do streak_state
  ✦  Models (daily_entry, streak_state)
  ✦  DAOs (daily / streak)
  ◇  Home screen
  ◇  Daily entry screen
  ◇  Streak logic
  ◇  History screen
  ◇  UI polish

  ✦ concluído   ◇ pendente


── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ── RODANDO ── ⋅ ⋅ ── ✩ ── ⋅ ⋅ ──

```bash
flutter pub get
flutter run
```
