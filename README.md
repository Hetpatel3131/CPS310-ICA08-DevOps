# Support Ticket Release Audit

This Python project reads support tickets and produces a summary
report. It counts open tickets and summarizes high-priority work
using a configurable threshold.

## Requirements

- Python 3.12 or newer
- Git
- macOS with Bash for the verification script
- Python dependencies listed in requirements.txt

## Setup on macOS

Clone this repository and enter its folder:

```bash
git clone https://github.com/hetpatel3131/CPS310-ICA08-DevOps.git
```

```bash
cd CPS310-ICA08-DevOps
```

Create a virtual environment:

```bash
python3 -m venv .venv
```

Activate the virtual environment:

```bash
source .venv/bin/activate
```

Install the recorded dependencies:

```bash
python3 -m pip install -r requirements.txt
```

Run all commands below from the repository root with the virtual
environment active. In a new terminal, activate .venv again before
running Python commands.

## Configuration

Project settings are stored in config.json.

- data_file: the ticket data file to load.
- report_title: the title displayed in the report.
- high_priority_threshold: the threshold used to classify
  high-priority tickets.

The supplied configuration uses tickets.txt, the report title
"Support Ticket Summary", and a high-priority threshold of 4.

Edit config.json to change these settings without changing the
program logic.

## Run the program

```bash
python3 release_audit.py
```

## Run the tests

```bash
python3 -m pytest -v
```

The complete test suite must pass before release.

## Run verification

Make the script executable:

```bash
chmod +x verify.sh
```

Run the verification script:

```bash
./verify.sh
```

The script:

- Runs the full pytest suite with verbose output.
- Checks that requirements.txt exists.
- Checks that config.json exists.
- Displays compact Git status.
- Returns a nonzero exit code when a required check fails.

Changed or untracked files are displayed for review. Before the
final push, commit the intended changes and confirm that the
working tree is clean.

## Release readiness

Compared with the starter, this project records dependency
versions, separates settings from program logic, fixes the
open-ticket counting defect, and tests configuration loading.

A single verification script repeats the release checks.
These setup instructions let another developer recreate the
environment, run the program, and verify the project without
depending on undocumented settings on my computer.