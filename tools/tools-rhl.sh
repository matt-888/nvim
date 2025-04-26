#! /bin/sh

# lsps =========================================================================

# latest julia eval "julia --project=@LanguageServer -e 'using Pkg; Pkg.add(\"LanguageServer\")'"
latest bash dnf bash-language-server
latest css npm tailwindcss-language-server
latest django uv django-template-lsp
latest python uv basedpyright
latest python uv pyright
latest python uv ruff

# other ========================================================================

latest R eval "curl -fsSL https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh"
latest bash cargo shellharden
latest bash dnf ShellCheck
latest julia eval "julia --project=@runic -e 'using Pkg; Pkg.add(\"Runic\")' ; curl -fsSL -o $BIN/runic https://raw.githubusercontent.com/fredrikekre/Runic.jl/refs/heads/master/bin/runic ; chmod +x $BIN/runic"
