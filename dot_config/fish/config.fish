starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/raziel/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end