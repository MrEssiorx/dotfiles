set fish_greeting

set PATH ~/.cargo/bin:$PATH

alias vim nvim

# Fish Shell Configuration File (~/.config/fish/config.fish)
#
# This configuration preloads the LaTeX matrix parsing function (lmat)
# into any interactive Python 3 session using PYTHONSTARTUP.

# --- Customizable Settings ---
# NOTE: Replace "/Users/YourUser/PythonTools" with the actual directory
# where you saved 'latex_matrix_parser.py' and 'python_startup.py'.
set PYTHONTOOLS_DIR "/home/hatf1sh/coding/python_tools"

# --- Environment Variable Setup ---

# 1. Add the tools directory to the PYTHONPATH list variable.
# The '-gx' flags set the variable globally and export it to child processes (like python3).
# This ensures that 'python_startup.py' can successfully import 'latex_matrix_parser'.
set -gx PYTHONPATH $PYTHONPATH $PYTHONTOOLS_DIR

# 2. Set the PYTHONSTARTUP variable.
# This points the Python interpreter to the script that runs at launch.
set -gx PYTHONSTARTUP "$PYTHONTOOLS_DIR/python_startup.py"

# --- End of Configuration ---


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/hatf1sh/miniforge3/bin/conda
    eval /home/hatf1sh/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/hatf1sh/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/hatf1sh/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/hatf1sh/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

