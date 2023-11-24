# Read .env.local and ignore comments and empty lines
content=$(cat .env.local | grep "^[A-Z]")

while read line; do
  # Split line by '='
  IFS='='

  # Read line into array
  read -ra parts <<<"$line"

  # Create secret

  if [ -z "${parts[1]}" ]; then
    echo "${parts[0]} is empty"
    exit 0
  fi

  printf ${parts[1]} | docker secret create ${parts[0]} -
done <<<"$content"
