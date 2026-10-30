alias w='cd /scratch/gpfs/sm69/'
alias wc='cd /scratch/gpfs/sm69/cores/mhd'
alias k='cd /scratch/gpfs/sm69/cores/athenak'
alias tg='cd /tigress/sm69'
alias td='cd /tigerdata/EOSTRIKE'
alias pj='cd /projects2/EOSTRIKE/sanghyuk'
alias pyathena='mamba deactivate; mamba activate pyathena'
alias visit='visit -cli -nowin -s'

export PATH=$HOME/node-v22.12.0-linux-x64/bin:$PATH
export PATH=$HOME/clangd_22.1.0/bin:$PATH

turbostart() {
module load turbovnc/2.2.6
    if [ $(vncserver -list | command wc -l) -eq 4 ]; then
        vncserver;
    else
        echo -e "\n***SESSION ALREADY RUNNING***" && vncserver -list;
    fi
}
turbostopall() {
module load turbovnc/2.2.6
    for x in $(vncserver -list);
    do
        if [[ $x =~ ^: ]]; then
            vncserver -kill $x;
        fi;
    done
}
loadvisit() {
module load openmpi/gcc/4.1.0
module load visit/3.1.4
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sm69/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sm69/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/sm69/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sm69/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/sm69/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/sm69/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
. "$HOME/.cargo/env"
