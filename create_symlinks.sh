find ~/scripts -type f -name "*.sh" | while read script
do
  sudo ln -s "$script" "/usr/local/bin/$(basename "$script")"
done
