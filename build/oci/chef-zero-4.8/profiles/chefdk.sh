#!/usr/bin/env bash
# 
# Used by Begley Brothers Inc. container bootstrap script within Dockerfiles.
# Local modifications will be overridden.
# 
export PATH="/opt/chefdk/bin:/opt/chefdk/embedded/bin:$HOME/.chefdk/gem/ruby/2.5.0/bin:$PATH"
export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.5.0"
export GEM_HOME="$HOME/.chefdk/gem/ruby/2.5.0"
export GEM_PATH="$HOME/.chefdk/gem/ruby/2.5.0:/opt/chefdk/embedded/lib/ruby/gems/2.5.0"
_chef_comp() {
    local COMMANDS="exec env gem generate shell-init install update push push-archive show-policy diff provision export clean-policy-revisions clean-policy-cookbooks delete-policy-group delete-policy undelete describe-cookbook verify"
    COMPREPLY=($(compgen -W "$COMMANDS" -- ${COMP_WORDS[COMP_CWORD]} ))
}
complete -F _chef_comp chef
