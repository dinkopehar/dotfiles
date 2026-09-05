starship init fish | source

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# pnpm
set -gx PNPM_HOME "/home/raziel/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
