#!/bin/bash

# Define the command version
VERSION="v0.1.0"

# Function to display the help message
display_help() {
    echo "Usage: internsctl [OPTIONS]"
    echo "Custom Linux Command for Interns Operations"
    echo "Options:"
    echo "  --help                Display this help message"
    echo "  --version             Display the command version"
    echo "  cpu getinfo           Get CPU information (similar to 'lscpu')"
    echo "  memory getinfo        Get memory information (similar to 'free')"
    echo "  user create <username> Create a new user with a home directory"
    echo "  user list             List all regular users"
    echo "  user list --sudo-only List users with sudo permissions"
    echo "  file getinfo <file>   Get file information"
    echo "  file getinfo [OPTIONS] <file>   Get specific file information"
    echo "Options for 'file getinfo':"
    echo "  --size, -s            Print file size"
    echo "  --permissions, -p      Print file permissions"
    echo "  --owner, -o            Print file owner"
    echo "  --last-modified, -m    Print last modified time"
}

# Function to create a new user
create_user() {
    if [ -z "$2" ]; then
        echo "Error: Please provide a username."
    else
        sudo useradd -m "$2"
        echo "User $2 created with a home directory."
    fi
}

# Function to list users
list_users() {
    if [ "$2" == "--sudo-only" ]; then
        getent passwd | cut -d: -f1,3,4 | awk -F: '$2 > 999 {print $1}' | tr '\n' ' '
        echo
    else
        getent passwd | cut -d: -f1 | tr '\n' ' '
        echo
    fi
}

# Function to get file information
get_file_info() {
    if [ -z "$2" ]; then
        echo "Error: Please provide a filename."
        return
    fi

    local file="$2"

    if [ "$3" == "--size" ] || [ "$3" == "-s" ]; then
        stat -c "%s" "$file"
    elif [ "$3" == "--permissions" ] || [ "$3" == "-p" ]; then
        stat -c "%A" "$file"
    elif [ "$3" == "--owner" ] || [ "$3" == "-o" ]; then
        stat -c "%U" "$file"
    elif [ "$3" == "--last-modified" ] || [ "$3" == "-m" ]; then
        stat -c "%y" "$file"
    else
        echo "File: $file"
        stat --format="Access: %A%nSize(B): %s%nOwner: %U%nModify: %y" "$file"
    fi
}

# Check for command-line options and execute commands
if [ "$1" == "--help" ]; then
    display_help
    exit 0
elif [ "$1" == "--version" ]; then
    echo "internsctl $VERSION"
    exit 0
elif [ "$1" == "cpu" ] && [ "$2" == "getinfo" ]; then
    # (Previous CPU info functionality)
    exit 0
elif [ "$1" == "memory" ] && [ "$2" == "getinfo" ]; then
    # (Previous Memory info functionality)
    exit 0
elif [ "$1" == "user" ] && [ "$2" == "create" ]; then
    create_user "$@"
    exit 0
elif [ "$1" == "user" ] && [ "$2" == "list" ]; then
    list_users "$@"
    exit 0
elif [ "$1" == "file" ] && [ "$2" == "getinfo" ]; then
    get_file_info "$@"
    exit 0
fi

# Display an error message if the command is not recognized
echo "Error: Invalid command or option. Use 'internsctl --help' for usage."
exit 1
