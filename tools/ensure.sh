#! /bin/sh

BIN="$XDG_BIN_HOME"
SCRIPT_DIR="$(dirname "${0}")"

latest() {
  case "${2}" in
    npm)
      npm install "${3}" -g --prefix "$BIN/.."
      ;;
    uv)
      uv tool install "${3}"@latest
      uv tool upgrade "${3}"
      ;;
    dnf)
      dnf install -y "${3}"
      dnf update "${3}"
      # ln -s /usr/bin/"${3}" "${BIN}/${3}"
      ;;
    apt)
      apt install -y "${3}"
      apt update "${3}"
      ;;
    cargo)
      cargo install "${3}" --root "$BIN/.."
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

if [[ -f /etc/debian_version ]]; then
  source "$SCRIPT_DIR/tools-deb.sh"
elif [[ -f /etc/redhat-release ]] || [[ -f /etc/fedora-release ]]; then
  source "$SCRIPT_DIR/tools-rhl.sh"
else
  echo "neither Debian or RHEL"
fi
