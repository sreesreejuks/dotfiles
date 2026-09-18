#!/usr/bin/env bash
# Kubernetes — add more files next to this one as the toolkit grows.

alias k='kubectl'

alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ka='kubectl apply'
alias kdel='kubectl delete'
alias kex='kubectl exec -it'

alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kgn='kubectl get nodes'

alias kctx='kubectl config current-context'
alias kcontexts='kubectl config get-contexts'
alias kuse='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
