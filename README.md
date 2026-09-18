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
| `bash/aliases/*.sh` | One file per topic, including shared functions |
| `install.sh` | Creates the symlink and ensures `.bashrc` sources it |

Add more topics as new files under `bash/aliases/` (for example `git.sh`). They are picked up automatically.

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
