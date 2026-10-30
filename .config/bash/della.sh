alias w='cd /scratch/gpfs/EOST/sanghyuk'
alias tg='cd /tigress/sm69'
alias td='cd /tigerdata/EOSTRIKE'
alias pj='cd /projects2/EOSTRIKE/sanghyuk'
alias mm='micromamba'
alias pyathena='micromamba deactivate; micromamba activate pyathena'
alias visit='visit -cli -nowin -s'

export PATH=/home/sm69/node-v22.12.0-linux-x64/bin:$PATH
export PATH=/home/sm69/clangd_23.1.0/bin:$PATH

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/sm69/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/sm69/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
