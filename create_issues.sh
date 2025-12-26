#!/usr/bin/env bash
set -euo pipefail

REPO="wlahiru84-hub/termux-horror-adventure"

# Check gh CLI
if ! command -v gh >/dev/null 2>&1; then
  echo "Error: gh CLI not found. Install and authenticate (gh auth login) before running."
  exit 1
fi

# Check auth
if ! gh auth status >/dev/null 2>&1; then
  echo "Error: gh CLI not authenticated. Run 'gh auth login' first."
  exit 1
fi

echo "This script will create multiple issues in repo: $REPO"
read -p "Proceed? (y/N): " confirm
if [[ "${confirm,,}" != "y" ]]; then
  echo "Aborted."
  exit 0
fi

create_issue() {
  tmp="$(mktemp)"
  cat > "$tmp"
  title="$(head -n1 "$tmp" | sed 's/^Title: //')"
  # Body starts after the blank line following the Title line. If there is no blank, start at line 2.
  # Remove Title line and the following blank line if present.
  second_line="$(sed -n '2p' "$tmp")"
  if [[ -z "$second_line" ]]; then
    tail -n +3 "$tmp" > "${tmp}.body"
  else
    tail -n +2 "$tmp" > "${tmp}.body"
  fi
  echo "Creating issue: $title"
  gh issue create --repo "$REPO" --title "$title" --body-file "${tmp}.body"
  rm -f "$tmp" "${tmp}.body"
  sleep 0.2
}

# ----- Begin issues -----

create_issue <<'ISSUE'
Title: Project: repo skeleton & docs
Description:
Create the project repository structure, basic docs and license.
- Directories: /game, /content, /assets, /tools, /tests
- Files: README.md, INSTALL.md (Termux install steps), CONTRIBUTING.md, LICENSE, .gitignore
- Add a simple run script play.sh that prints a placeholder message.

Acceptance criteria:
- Repo contains required directories and files.
- INSTALL.md documents Termux prerequisites and the install command.
- play.sh runs and prints a placeholder message.

Story points: 1
ISSUE

create_issue <<'ISSUE'
Title: Install script & sandbox creation
Description:
Implement a safe installer (install.sh) that can run via curl|bash or manual invocation and creates a sandbox under $HOME/.termux-horror. The installer must:
- Confirm install path with the user and request consent before writing.
- Detect Python 3 and print clear install instructions if missing.
- List the files and directories it will create.

Acceptance criteria:
- install.sh creates $HOME/.termux-horror with correct permissions when confirmed.
- Installer exits gracefully and prints instructions if Python 3 is missing.
- Installer prints a list of files it will create before writing.

Story points: 1
ISSUE

create_issue <<'ISSUE'
Title: Core CLI runner & entrypoint
Description:
Implement the main Python entrypoint (e.g., play.py / package module) to bootstrap the game, load config, and handle signals (Ctrl+C) gracefully. Provide a thin wrapper script play.sh that launches Python.

Required flags:
- --debug (produce logs)
- --no-typing (disable typing animation)
- --offline-mode (force single-player)

Acceptance criteria:
- ./play.sh launches the Python entrypoint and displays an ANSI title screen.
- Flags work and are documented in README.

Story points: 1
ISSUE

create_issue <<'ISSUE'
Title: Command parser & command set
Description:
Implement a robust command parser to accept shell-like inputs and game-specific commands. Commands to support initially:
- ls, cd, cat/read/open, stat/ls -l, ls -a
- inspect, examine, use, edit (simulated), save, load, help, hint, listen, host, join, leave, status

Parser must handle malformed input without crashing and provide helpful error messages.

Acceptance criteria:
- Unit tests cover parser handling of valid/invalid inputs.
- help command lists available commands and usage.
- Command stubs return predictable placeholder outputs.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Virtual filesystem & content loader
Description:
Implement an in-game virtual filesystem under the sandbox. Content is authored in /content (YAML/JSON + files) and loaded into the virtual FS. Features:
- Hidden files (dotfiles)
- Simulated file metadata (timestamps, permissions)
- Safe simulated editing confined to sandbox; no writes outside $HOME/.termux-horror
- stat/ls shows metadata; ls -a shows hidden files

Acceptance criteria:
- Player can navigate and view files under the virtual FS.
- Hidden files are discoverable with ls -a; stat-like metadata available.
- All write operations remain inside the sandbox.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Puzzle engine & content schema
Description:
Create a puzzle engine and content schema (YAML or JSON) to describe puzzles, clues, triggers, and dependencies. Engine responsibilities:
- Load puzzle definitions and content from /content/puzzles
- Track puzzle states and transitions
- Expose API for in-game commands to query/modify puzzle state

Acceptance criteria:
- Engine loads puzzle definitions and persists puzzle state.
- At least one example puzzle implemented end-to-end using the engine.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Puzzle: steganography in ASCII art (example)
Description:
Implement a puzzle where hidden data is encoded in ASCII art. Player must discover the hidden file and decode steganographic data to get a key.

Acceptance criteria:
- The ASCII art file is present in virtual FS and decodes to a useful clue/key.
- A test script demonstrates end-to-end solution.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Puzzle: log analysis
Description:
Implement a puzzle based on simulated log files. Player must grep/parse logs to find timestamps, IP-like tokens, or pattern clues.

Acceptance criteria:
- Logs include discoverable clues leading to next puzzle step.
- A test script exists showing a valid solution path.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Puzzle: simple crypto (Caesar/XOR)
Description:
Implement a simple crypto puzzle (Caesar or XOR) where player finds or constructs the key from other in-game artifacts.

Acceptance criteria:
- Puzzle integrates with puzzle engine and virtual FS.
- Test shows a player using recovered key to decrypt content.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Puzzle: simulated process output
Description:
Create a puzzle that exposes clues via simulated process output (e.g., a fake daemon log or command output stream). Player should use commands like listen or run to observe.

Acceptance criteria:
- Simulated process output is produced and contains discoverable clues.
- Puzzle engine updates state when player interacts correctly.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Puzzle: editable config triggers state change
Description:
Create a puzzle where editing a configuration file (via simulated edit command) changes game state (enables an endpoint, reveals hidden file, etc.) — ensure edits are sandboxed and safe.

Acceptance criteria:
- Editing the config as intended triggers a state change.
- Invalid edits are handled safely; no host file operations occur.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: Implement remaining puzzles (total 6–8 puzzles)
Description:
Complete the full set of puzzles (6–8 total) covering a variety of mechanics: steganography, logs, crypto, simulated processes, config editing, and one co-op real-time puzzle. Each puzzle should include content, tests, and integration with the engine.

Acceptance criteria:
- All 6–8 puzzles implemented and integrated.
- Each puzzle has a test demonstrating a valid solution path.

Story points: 8
ISSUE

create_issue <<'ISSUE'
Title: Tutorial / onboarding (diegetic)
Description:
Design and implement a diegetic tutorial (first 5–10 minutes) that teaches commands through in-world files and prompts, preserving immersion.

Acceptance criteria:
- First-run triggers the tutorial automatically.
- New players can complete the tutorial without external docs.

Story points: 2
ISSUE

create_issue <<'ISSUE'
Title: Save/load & autosave system
Description:
Implement save/load mechanics with autosaves at milestones and manual saves. Saves stored under $HOME/.termux-horror/saves. Implement save listing and corrupt-save detection.

Acceptance criteria:
- Autosave occurs at key milestones and manual save works.
- Player can list and load saves; corrupt saves detected and handled.

Story points: 2
ISSUE

create_issue <<'ISSUE'
Title: Progression, branching & endings
Description:
Implement branching story logic with at least 3 distinct endings tied to puzzle states and key choices. Ensure endings are surfaced and saved.

Acceptance criteria:
- Playthroughs exist that reach each ending without crashes.
- Ending metadata recorded in save files.

Story points: 3
ISSUE

create_issue <<'ISSUE'
Title: In-game help & hint system
Description:
Provide contextual in-game help (local files) and an optional tiered hint system. Hints are local by default; online hint fetch is opt-in.

Acceptance criteria:
- help command prints local help text.
- hint command provides first hint locally; subsequent hints require confirmation.
- If online hints enabled, user consent is required.

Story points: 2
ISSUE

create_issue <<'ISSUE'
Title: Accessibility options & config
Description:
Add accessibility toggles persisted in config: disable typing animation, adjust text delay, high-contrast theme, disable ANSI colors, disable timed events/jump-scare outputs.

Acceptance criteria:
- Options saved in a config file and applied at runtime.
- Timed puzzles can be made non-timed via config.

Story points: 2
ISSUE

create_issue <<'ISSUE'
Title: Sandbox & security audit
Description:
Perform a security audit to ensure no destructive host operations. Implement filename validation, block arbitrary shell exec from untrusted content, and ensure all writes are sandboxed.

Acceptance criteria:
- Audit checklist added to repo and completed.
- Tests prove no writes outside sandbox under normal and malicious simulated input.

Story points: 2
ISSUE

create_issue <<'ISSUE'
Title: Networking: optional opt‑in features (leaderboards/hints/ARG)
Description:
Implement optional, privacy-first networking features such as leaderboards, remote hints, and ARG hooks. Networking must  disabled by default and opt-in via config with clear consent.

Acceptance criteria:
- Networking disabled by default