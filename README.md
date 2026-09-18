# dotfiles

Portable shell aliases. Clone this repo, run `install.sh`, and `$HOME/.bash_aliases` becomes a symlink back here. The Git copy is the backup; the home path is just a pointer.

## Setup

```bash
git clone git@github.com:sreesreejuks/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
chmod +x install.sh
./install.sh
source ~/.bash_aliases
```

On a machine that already has the clone: `git pull` and open a new shell. Alias files are sourced from the repo through the symlink, so there is nothing else to reinstall.

If a real `~/.bash_aliases` already exists, install moves it to `~/.bash_aliases.bak.<timestamp>` before linking.

## Layout

| Path | Role |
| --- | --- |
| `.bash_aliases` | Loader; sourced from `$HOME` via symlink |
| `bash/aliases/kubernetes.sh` | Kubernetes aliases |
| `bash/aliases/common.sh` | General shell aliases |
| `bash/aliases/navigation.sh` | Directory and listing aliases |
| `bash/aliases/functions.sh` | Navigation functions |
| `install.sh` | Creates the symlink and ensures `.bashrc` sources it |

Add more topics as new files under `bash/aliases/` (for example `git.sh`). They are picked up automatically.

## Validation

Shell files are checked automatically with Bash syntax validation and ShellCheck on pushes and pull requests.

Run the syntax checks locally:

```bash
bash -n install.sh .bash_aliases bash/aliases/*.sh
```

Shell files use Unix LF line endings. The repository enforces this through `.gitattributes`.

## Common aliases

| Alias | Purpose |
| --- | --- |
| `tolower` | Convert text to lowercase |
| `toupper` | Convert text to uppercase |
| `pbcopy` / `pbpaste` | Copy to and paste from the clipboard |
| `ts` | Generate a timestamp |
| `fz` | Search files with `fzf` |
| `h` | List shell history with numbers |

## Navigation aliases

| Alias | Purpose |
| --- | --- |
| `..`, `...`, `....` | Move up one, two, or three directories |
| `c` | Clear the terminal |
| `la` | List all files, including hidden files |
| `ll` | List files in long format |
| `rd` | Remove an empty directory |
| `cpv` | Copy files with progress |
| `mvv` | Move files interactively |

## Navigation functions

| Function | Purpose |
| --- | --- |
| `md <directory>` | Create and enter a directory |
| `recentdir [count]` | Show recently modified directories |
| `recentfiles [count]` | Show recently modified files |

## Kubernetes aliases

| Alias | Command |
| --- | --- |
| `k` | `kubectl` |
| `kg` | `kubectl get` |
| `kd` | `kubectl describe` |
| `kl` | `kubectl logs` |
| `klf` | `kubectl logs -f` |
| `ka` | `kubectl apply` |
| `kdel` | `kubectl delete` |
| `kex` | `kubectl exec -it` |
| `kgp` | `kubectl get pods` |
| `kgs` | `kubectl get svc` |
| `kgd` | `kubectl get deploy` |
| `kgn` | `kubectl get nodes` |
| `kctx` | `kubectl config current-context` |
| `kcontexts` | `kubectl config get-contexts` |
| `kuse` | `kubectl config use-context` |
| `kns` | `kubectl config set-context --current --namespace` |
