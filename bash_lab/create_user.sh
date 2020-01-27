#!/bin/bash

USERNAME="$2"
PASSWORD="$3"

addUser ()
{
  #Add user account with name passed in as first parameter
  sudo useradd -m $USERNAME

  #Check if the length of passsword that was passed in is 0, if so generate random password
  if [ -z $PASSWORD ];
  then
    PASSWORD=$(openssl rand -base64 32)
  fi

  #Set Password for user account that was just created with second parameter, and ONLY send successful message if chpasswd exits successfully
  #You can also use useradd username -p encrypted_password
  echo "$USERNAME:$PASSWORD" | sudo chpasswd && echo "Account for $USERNAME has been created"

  #Write username and password to a file
  touch credentials.txt
  echo "Welcome to our company, here are your login credentials" >> credentials.txt
  echo "Username: $USERNAME" >> credentials.txt
  echo "PASSWORD: $PASSWORD" >> credentials.txt

  #Send email with user credentials to new user and remove credentials.txt file for security reasons
  mail -A credentials.txt -s "Here are your login credentials" "$USERNAME@mastermnd.io" < /dev/null && \
    echo "Mail has been successfully sent" && \
    echo "Deleting credentials file" && \
    rm -rf credentials.txt

  #Copy company rules to new users home directory
  sudo cp company_rules.txt "/home/$USERNAME/"
}

deleteUser ()
{
  sudo userdel $USERNAME && sudo rm -rf /home/$USERNAME && \
    echo "User $USERNAME has been removed from the system"
}  

if [ "$1" == "add" ]
then
  addUser
elif [ "$1" == "delete" ]
then
  deleteUser
else
  echo "You must enter add or delete as first argument"
fi
