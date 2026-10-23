export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Each tool switches to its XDG location only after its folder has been moved there.
_xdg_use() { [ -d "${3:-$2}" ] && export "$1=$2"; }

_xdg_use CARGO_HOME            "$XDG_DATA_HOME/cargo"
_xdg_use RUSTUP_HOME           "$XDG_DATA_HOME/rustup"
_xdg_use BUN_INSTALL           "$XDG_DATA_HOME/bun"
_xdg_use BUN_INSTALL_CACHE_DIR "$XDG_CACHE_HOME/bun"
_xdg_use BUNDLE_USER_CONFIG    "$XDG_CONFIG_HOME/bundle/config" "$XDG_CONFIG_HOME/bundle"
_xdg_use BUNDLE_USER_CACHE     "$XDG_CACHE_HOME/bundle"
_xdg_use BUNDLE_USER_PLUGIN    "$XDG_DATA_HOME/bundle"
_xdg_use NPM_CONFIG_CACHE      "$XDG_CACHE_HOME/npm"
_xdg_use PUB_CACHE             "$XDG_CACHE_HOME/pub"
_xdg_use PI_CODING_AGENT_DIR   "$XDG_CONFIG_HOME/pi/agent"
_xdg_use VSCODE_PORTABLE       "$XDG_DATA_HOME/vscode"
unfunction _xdg_use

for _bin in \
  "${CARGO_HOME:-$HOME/.cargo}/bin" \
  "${BUN_INSTALL:-$HOME/.bun}/bin" \
  "${PUB_CACHE:-$HOME/.pub-cache}/bin"; do
  [ -d "$_bin" ] && path=("$_bin" $path)
done
unset _bin
typeset -U path
