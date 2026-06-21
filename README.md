# \# Llama-UI Project Setup

# 

# This project provides a secure, sandboxed environment for interacting with files using a Llama-based LLM. The system is designed to operate within a restricted workspace to ensure security and stability.

# 

# \## 🏗️ System Components

# 

# The environment consists of the following launchers and managers:

# 

# 1\.  \*\*LLM Server Launcher (`Gemma 4 E4B Server.bat`)\*\*: 

# &#x20;   \*   Launches the core `llama-server.exe` engine.

# &#x20;   \*   Provides the raw inference capability required for the LLM to function.

# 

# 2\.  \*\*UI Launcher (`Llama Chat UI.bat`)\*\*: 

# &#x20;   \*   Opens the Llama Chat interface as a dedicated \*\*Chrome App window\*\*.

# &#x20;   \*   Provides the user interface for interacting with the model.

# 

# 3\.  \*\*Workspace Manager (`llama-ui-launcher.vbs`)\*\*: 

# &#x20;   \*   Handles the creation of a \*\*temporary default folder\*\*.

# &#x20;   \*   Ensures that this temporary workspace is automatically \*\*deleted upon closure\*\* to maintain system cleanliness.

# 

# \---

# 

# \## 🚀 Launch Sequence

# 

# To start the environment, follow this order:

# 

# \### \*\*Step 1: Start the LLM Server\*\*

# Run the batch file to initialize the inference engine:

# `Gemma 4 E4B Server.bat`

# 

# \### \*\*Step 2: Launch the UI\*\*

# Run the UI launcher to open the Chrome app window:

# `Llama Chat UI.bat`

# 

# \---

# 

# \## 🛠️ Component Summary

# 

# | Component | File | Purpose |

# | :--- | :--- | :--- |

# | \*\*Inference\*\* | `Gemma 4 E4B Server.bat` | Boots the LLM engine |

# | \*\*Interface\*\* | `Llama Chat UI.bat` | Launches Chrome App window |

# | \*\*Cleanup\*\* | `llama-ui-launcher.vbs` | Manages temp workspace lifecycle |



