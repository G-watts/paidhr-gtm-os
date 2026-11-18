@echo off
rem Project-scoped treg CLI wrapper. Keeps config, login token and telemetry off inside this repo.
rem Usage (from the project root): tools\treg\treg.cmd <command>   e.g. tools\treg\treg.cmd login
setlocal
set "ROOT=%~dp0..\.."
set "TREG_CONFIG=%ROOT%\.treg\config.json"
set "TREG_TELEMETRY=0"
set "DO_NOT_TRACK=1"
if not exist "%ROOT%\.treg\venv\Scripts\treg.exe" (
  echo treg is not installed in this project. See tools\treg\README.md to rebuild .treg\ 1>&2
  exit /b 1
)
"%ROOT%\.treg\venv\Scripts\treg.exe" %*
