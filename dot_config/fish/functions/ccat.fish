function ccat
  if type -q bat
    bat --style plain $argv
  else # Some wierd stuff on PopOS
    batcat --style plain $argv
  end
  bat --style plain $argv
end