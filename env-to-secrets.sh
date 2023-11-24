# Read .env.local and ignore comments and empty lines
content=$(cat .env.local | grep "^[A-Z]")