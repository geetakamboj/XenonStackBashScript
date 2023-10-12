# XenonStackBashScript

Make the Bash Script Executable:
Make the script executable using the chmod command:
```
chmod +x internsctl
```
## Generate Manual Page:
To generate a manual page, you need to create a manual page file (e.g., internsctl.1) and install it. You can use a tool like help2man to help generate the manual page from the --help option. 

To install help2man, use the following command:
```
brew install help2man
```
### Generate a manual page from the --help option
```
help2man -N ./internsctl -o internsctl.1
```

## Install the Manual Page:
To install the manual page, use the man command:
```
sudo cp internsctl.1 /usr/share/man/man1/
sudo mandb
```
## Testing:
You can test your internsctl command by running the following:
```
man internsctl to access the manual page.
internsctl --help to see the help message.
internsctl --version to display the command version.
internsctl cpu getinfo to get CPU information.
internsctl memory getinfo to get memory information.
internsctl user create <username> to create a new user.
internsctl user list to list all regular users.
internsctl user list --sudo-only to list users with sudo permissions.

To get file information with options:

internsctl file getinfo <file-name>
internsctl file getinfo --size <file-name>
internsctl file getinfo --permissions <file-name>
internsctl file getinfo --owner <file-name>
internsctl file getinfo --last-modified <file-name>
```











