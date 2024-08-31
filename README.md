# My Magic Prompt

## Exercise Instructions

- [Link to Exercise Instructions](./shell-scripting.pdf)

## Prerequisites

### OS

A Linux distribution, WSL, or macOS

### Utilities

![curl](https://img.shields.io/badge/curl-07405E?logo=curl&logoColor=white&labelColor=07405E)
![make](https://img.shields.io/badge/make-427819?logo=gnu&logoColor=white&labelColor=427819)
![mailutils](https://img.shields.io/badge/mailutils-DB4437?logo=maildotcom&logoColor=white&labelColor=DB4437)
![vim](https://img.shields.io/badge/vim-019733?logo=vim&logoColor=white&labelColor=019733)

## Usage

### Start the Prompt

```bash
make my-magic-prompt
```

- To access the prompt, you need to provide a specific login and password, or create your own.

### Running Commands

```bash
[COMMAND] [ARGUMENTS] [OPTIONS]
```

## Available Commands

- **passw**: Change the password with a confirmation prompt.
- **profil**: Displays all your personal information (First Name, Last Name, Age, Email).
- **ls**: Lists visible and hidden files and directories.
- **cd**: Navigate to a newly created directory or return to the previous one.
- **pwd**: Displays the current directory.
- **hour**: Shows the current time.
- **rm**: Deletes a file.
- **rmd**, **rmdir**: Deletes a directory.
- **httpget**: Downloads the HTML source code of a web page and saves it to a specified file. You will be prompted to provide the file name.
- **smtp**: Sends an email with a specified address, subject, and message body.
- **open**: Opens a file directly in the Vim editor, even if the file doesn't exist.
- **age**: Asks for your age and indicates whether you are a minor or an adult.
- **quit**, **exit**: Exits the prompt.
- **help**: Displays available commands.
- **about**: Description of the program.
- **version**, **vers**, **--v**: Displays the prompt's version.
