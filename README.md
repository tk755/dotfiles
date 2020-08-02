# Managing Dotfiles
I use the [bare git repository](https://www.atlassian.com/git/tutorials/dotfiles) method to manage my dotfiles.

## Creating a Bare Repository

1. Create a bare git repository called `$HOME/.dotfiles` to track the dotfiles you want to save.
```bash
git init --bare $HOME/.dotfiles
```

2. Define an alias called `dotfiles` to interact with this repository and add it to `$HOME/.bash_aliases` so it is available in any terminal session.
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo "alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash_aliases
```

3. Configure the bare repository to not show untracked files.
```bash
dotfiles config --local status.showUntrackedFiles no
```

4. Now you can track your dotfiles in the `$HOME/.dotfiles` repository using the `dotfiles` alias, which is just a glorified `git` command.
```bash
dotfiles add $HOME/.bashrc
dotfiles commit -m 'Add .bashrc'
dotfiles push
```

## Cloning this Repository

1. Clone this repository into a bare repository called `$HOME/.dotfiles`.
```bash
git clone --bare git@github.com:TusharK54/Dotfiles.git $HOME/.dotfiles
```

2. Define an alias called `dotfiles` to interact with this repository. This alias is already defined in the `.bash_aliases` file of the cloned repository, so there is no need to copy it over.
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

3. Configure the bare repository to not show untracked files and to set the upstream repository.
```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles push --set-upstream origin master
```

4. Checkout the dotfiles from the bare repository to your `$HOME` directory. This will fail if you have dotfiles in your `$HOME` directory which will get overwritten by the dotfiles in the bare repository. You will need to delete or move those dotfiles and try again.
```bash
dotfiles checkout
```

5. Now you can track your dotfiles in the `$HOME/.dotfiles` repository using the `dotfiles` alias, which is just a glorified `git` command.
```bash
dotfiles add $HOME/.bashrc
dotfiles commit -m 'Add .bashrc'
dotfiles push
```
