#! /bin/sh

# lsps =========================================================================

latest bash dnf bash-language-server
latest python uv basedpyright
latest python uv pyright
latest python uv ruff

# other ========================================================================

latest R eval "curl -fsSL https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh"
latest bash cargo shellharden
latest bash dnf ShellCheck
latest julia eval "julia --project=@runic -e 'using Pkg; Pkg.add(\"Runic\")' ; curl -fsSL -o $BIN/runic https://raw.githubusercontent.com/fredrikekre/Runic.jl/refs/heads/master/bin/runic ; chmod +x $BIN/runic"
latest julia eval "julia --project=@runic -e 'using Pkg; Pkg.add(\"Runic\")' ; curl -fsSL -o $XDG_BIN_HOME/git-runic https://raw.githubusercontent.com/fredrikekre/Runic.jl/refs/heads/master/bin/git-runic ; chmod +x $XDG_BIN_HOME/git-runic"
