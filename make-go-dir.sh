#!/bin/bash

if [ -z $1 ] && [ -z $2 ]; then
    echo "You need to provide two arguments for this script to work."
    echo "Usage: make-go-dir <root directory name> <identifier name>"
    exit 1
fi


echo "About to create directory structure $1."
read -p "Are you sure you want to continue? [yes/no] " ans


if [ $ans == "yes" ]; then
   echo "Creating directory structure..."
   mkdir "$HOME/$1"
   mkdir  "$HOME/$1/cmd" "$HOME/$1/internals" "$HOME/$1/migrations" "$HOME/$1/remote" "$HOME/$1>
   touch "$HOME/$1/cmd/api/main.go"
   echo '// File: cmd/api/main.go

   package main
   import "fmt"
   func main() {
   fmt.Println("Hello world!")
   } ' >> "$HOME/$1/cmd/api/main.go"

   cd $HOME/$1
   go mod init "$1.$2"
   echo "I have created a *main.go* file for you to test the directory structure."
   echo "Type *go run ./cmd/api* at the root directory to test your project."
   echo "Thank you."

   elif [ $ans == "no" ]; then
   echo "Abort."
   exit 0
else 
   echo "You need to provide two arguments for this script to work."
    echo "Usage: make-go-dir <root directory name> <identifier name>"
    exit 1
fi
