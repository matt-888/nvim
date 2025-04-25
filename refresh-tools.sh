# put all binaries in XDG_BIN_HOME

latest() {
  case "${2}" in
    npm)
      npm install "${3}" -g --prefix "$XDG_BIN_HOME/.."
      ;;
    uv)
      uv tool install "${3}"@latest
      uv tool upgrade "${3}"
      ;;
    dnf)
      dnf install -y "${3}"
      ;;
    cargo)
      cargo install "${3}" --root "$XDG_BIN_HOME/.."
      ;;
    eval)
      eval "${3}"
      ;;
    *)
      echo "unknown package manager: ${2}"
      ;;
  esac
}

juliaup update

# lsps =========================================================================

latest bash dnf bash-language-server

latest python uv pyright

latest python uv basedpyright

# other ========================================================================

latest bash dnf ShellCheck # static analysis tool for shell scripts

latest bash cargo shellharden # formatting / linting for shell scripts

latest julia eval "julia --project=@runic -e 'using Pkg; Pkg.add(\"Runic\")' && \
                    curl -fsSL -o $XDG_BIN_HOME/runic \
                    https://raw.githubusercontent.com/fredrikekre/Runic.jl/refs/heads/master/bin/runic && \
                    chmod +x $XDG_BIN_HOME/runic && \
                    curl -fsSL -o $XDG_BIN_HOME/git-runic \
                    https://raw.githubusercontent.com/fredrikekre/Runic.jl/refs/heads/master/bin/git-runic && \
                    chmod +x $XDG_BIN_HOME/git-runic"

latest python uv ruff # formatting / linting for python

latest R eval "curl -fsSL https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh" # formatting for R
