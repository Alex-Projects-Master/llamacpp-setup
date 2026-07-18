# Llama.cpp Local Server Setup

Local LLM server running Gemma 4 E4B with chat UI and built-in tool calling.

## System Components

| Component | File | Purpose |
|-----------|------|---------|
| Servers | `Gemma 4 E4B Server.bat` & `Qwen 3.5 9B Server.bat` | Launches llama-server.exe with model, tools, and UI config |
| Chat UI | `my_files/Llama Chat UI.bat` | Opens Chrome app window for chat interface |
| Launcher | `my_files/llama-ui-launcher.vbs` | Silent wrapper that launches UI bat file |
| Config | `ui-config.json` | System prompt for Windows command defaults |

## Launch Sequence

### Step 1: Start the Server

Run either `Gemma 4 E4B Server.bat` or `Qwen 3.5 9B Server.bat` to start the inference engine.

Server binds to `192.168.1.70:1234` with tools enabled and reasoning disabled.

### Step 2: Launch the UI

Run `my_files/Llama Chat UI.bat` (or `llama-ui-launcher.vbs` for silent launch) to open the Chrome chat window.

The Chrome profile is temporary and auto-deletes on close.

## Configuration

### Workspace Folder

The server working directory is set to `C:\Workspace` in the bat file. Tool calls (read_file, write_file, etc.) operate relative to this directory.

To change, edit the `cd /d` line in either `(model) Server.bat`:

```bat
cd /d "C:\Your\Custom\Path"
```

### System Prompt (ui-config.json)

The `ui-config.json` file contains a system message that tells the model to use Windows commands instead of Linux commands when calling `exec_shell_command`.

Edit the `systemMessage` field to customize model behavior:

```json
{
  "systemMessage": "Your custom instructions here."
}
```

## Server Arguments

| Argument | Value | Description |
|----------|-------|-------------|
| `-m` | `gemma-4-E4B-it-Q4_K_M.gguf` | Model file |
| `-c` | `32768` | Context size |
| `-t` | `6` | CPU threads |
| `--host` | `192.168.1.70` | Bind address |
| `--port` | `1234` | Bind port |
| `-np` | `2` | Parallel slots |
| `--embedding` | | Enable embeddings |
| `--reasoning` | `off` | Disable reasoning |
| `--tools` | `all` | Enable all built-in tools |
| `--ui-config-file` | `ui-config.json` | System prompt config |

## Available Tools

When `--tools all` is enabled, the model can use:

- `read_file` — Read file contents
- `write_file` — Write to files
- `edit_file` — Edit existing files
- `apply_diff` — Apply diff patches
- `exec_shell_command` — Execute shell commands (uses `cmd /c` on Windows)
- `grep_search` — Search file contents
- `file_glob_search` — Search files by pattern
- `get_datetime` — Get current date/time

## Files

```
C:\llamacpp-setup\
├── Gemma 4 E4B Server.bat       # Server launcher
├── Qwen 3.5 9B Server.bat       # Server launcher
├── ui-config.json                # System prompt config
├── llama-server.exe              # llama.cpp server binary
├── gemma-4-E4B-it-Q4_K_M.gguf  # Gemma 4 E4B model
├── Qwen3.5-9B-Q4_K_M.gguf      # Qwen 3.5 9B model
├── my_files/
│   ├── Shortcut Icons           # Custom model icons for server batch files / UI  
│   ├── Llama Chat UI.bat        # Chrome UI launcher
│   └── llama-ui-launcher.vbs    # Silent VBS wrapper
└── *.dll                         # Runtime libraries
```
