# do not edit path. must be first /usr/local/bin
# PATH="/usr/local/bin:${PATH}:/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin"

export PDSH_SSH_ARGS_APPEND='-o StrictHostKeyChecking=no'

# DO NOT REMOVE
unset XTERM_VERSION
# DO NOT REMOVE

# Read first /etc/inputrc if the variable is not defined, and after
# the /etc/inputrc include the ~/.inputrc
[ -z $INPUTRC ] && export INPUTRC=/etc/inputrc

# # print current directory
# PS1="\!% [\u@\h \W]$ "
# export PS1

# User specific aliases and functions
alias w='cd /appsdata/t625a01'

unset LESS

pyathena() {
    module load miniforge/26.1.1-3 || return
    unset CONDARC
    mamba deactivate; mamba activate pyathena
}

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/apps/common/miniforge/26.1.1-3/aarch64/bin/mamba';
export MAMBA_ROOT_PREFIX="$HOME/.conda.aarch64";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
