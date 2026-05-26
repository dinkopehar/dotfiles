# Random fish color
# fish_logo (for i in (seq 3); random choice (set_color --print-colors); end)
pfetch # Display information about OS
head -c (tput cols) < /dev/zero | tr '\0' '='
fortune -sn 79 # Display fortune with limit of 79 characters
# Divider, n times '=' width of terminal and color it
head -c (tput cols) < /dev/zero | tr '\0' '='
echo ""

# Say the fortune on OSX :=)
# echo $FORTUNE_OUTPUT | say &