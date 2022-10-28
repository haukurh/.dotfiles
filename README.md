# My personal dotfiles

The aim of this project is to provide minimalistic yet powerful and convenient default configuration files. 

## shell

Configuration files for zsh and bash are available.

Easiest way to implement:

```shell
cd ~
git clone git@github.com:haukurh/.dotfiles.git
# bash
mv .bashrc .bashrc.bak && ln -s .dotfiles/.bashrc .
# zsh
mv .zshrc .zshrc.bak && ln -s .dotfiles/.zshrc .
```

## git config

Some useful git configuration can be included in `~/.gitconfig`

```ini
[user]
name = <YOUR NAME>
email = <YOUR EMAIL>
signingkey = <YOUR GPG KEY ID>

[include]
path = ~/.dotfiles/gitconfig

[includeIf "gitdir:~/src/work/"]
path = ~/.gitconfig-work

[includeIf "gitdir:~/src/projects/"]
path = ~/.gitconfig-personal

[commit]
gpgsign = true

[tag]
gpgsign = true
```

With these includeIf statements we can have custom settings based on folders,
this can be useful if you use have different git email for work vs. personal for example.

This config suggest that you use GPG to sign your commits. If you're not already doing so you
read up on it in the GitHub documentation.

Sources:

- [GitHub Docs: Managing commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification)

## ssh config

Here are some suggested SSH setting the aim of which is to give you an even better experience when working with SSH.

```
Host *
	ServerAliveInterval 90
	ControlPath ~/.ssh/connections/%r@%h:%p
	ControlMaster auto
	ControlPersist 120
	IgnoreUnknown UseKeychain
	UseKeychain yes
```

If we break them down quickly:

- `ServerAliveInterval` will set a timeout on the connection in seconds.
- `ControlPath`, `ControlMaster` and `ControlPersist` is an fantastic mechanism which allows us to reuse an already 
established connection, meaning the following connections will be quicker to establish. After all connections have been 
disconnected the control connection will die after 120 seconds.
- `IgnoreUnknown` allows us to specify options, which aren't available on all platforms, without causing a failure.
- `UseKeychain` is available on macOS and allows you to use the keychain to keep track of passphrases.

In order to make this work you'll have to create the folder which we use to keep track of our multiplexed connections.
Which you can do with this command.

```shell
mkdir -p ~/.ssh/connections
```

I would recommend to read the manual `man ssh_config` for a better explanation on these options.

## macOS terminal

iTerm2 and oh-my-zsh are boring...

Why not simply configure terminal to pretty and familiar?

You can import the Terminal.terminal profile into the macOS terminal

![Screenshot of terminal](assets/terminal.png)

_I mean do you see that pink highlighting_ 👆
