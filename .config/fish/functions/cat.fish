function cat
  if type -q bat
    bat $argv
  else # Some wierd stuff on PopOS
    batcat $argv
  end
end