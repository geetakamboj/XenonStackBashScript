# XenonStackBashScript

Make the Bash Script Executable:
Make the script executable using the chmod command:

chmod +x internsctl

Generate Manual Page:
To generate a manual page, you need to create a manual page file (e.g., internsctl.1) and install it. You can use a tool like help2man to help generate the manual page from the --help option. You might need to install help2man if it's not already installed.

# Generate a manual page from the --help option
help2man -N ./internsctl -o internsctl.1
Install the Manual Page:
To install the manual page, you can use the man command:

sudo cp internsctl.1 /usr/share/man/man1/
sudo mandb

Testing:
You can test your internsctl command by running the following:

internsctl --help to see the help message.
internsctl --version to display the command version.
man internsctl to access the manual page for your custom command.




