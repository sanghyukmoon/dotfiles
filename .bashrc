# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export MANPATH="$HOME/.local/share/man:$MANPATH"
export EDITOR="vim"

# User specific aliases and functions
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias s='ssh'
alias gc='cd "$HOME/pyathena_extensions/core_formation"'
alias gp='cd "$HOME/pyathena"'
alias sq='squeue -u "$USER" -o "%.10i %.9P %.30j %.4u %.2t %.8M %.5D %R"'
alias si='sinfo -s'
alias nb='jupyter lab --no-browser --port=20201 --ip=0.0.0.0'
alias tl='tmux list-sessions'
alias tn='tmux -CC new -A -s main'
alias ta='tmux -CC attach -t main'
alias gd='git diff'
alias gdc='git diff --compact-summary'
alias rsync='rsync --archive --progress --partial-dir=.rsync-partial'

export PATH="$HOME/scripts:$PATH"
export PYTHONPATH="$HOME/pyathena:$PYTHONPATH"
export PYTHONPATH="$HOME/pyathena_extensions:$PYTHONPATH"
export PYTHONPATH="$HOME/grid_dendro:$PYTHONPATH"
export PYTHONPATH="$HOME/tesphere:$PYTHONPATH"
export PYTHONPATH="$HOME/imf:$PYTHONPATH"
export PYTHONPATH="$HOME/linmix:$PYTHONPATH"

vim_pack_update() (
    cd "$HOME" || return
    if ! yadm diff --cached --quiet; then
        echo "Error: yadm already has staged changes."
        return 1
    fi

    yadm submodule update --remote --recursive || return 1
    vim -Nu NONE -n -es '+helptags ALL' +qa || return 1

    yadm add .vim/pack/smoon/start .vim/pack/smoon/opt || return 1

    if yadm diff --cached --quiet; then
        echo "No package updates to commit."
        return 0
    fi

    yadm commit -m "Update Vim packages"
)

sa() {
    sacct --units=G --noheader --parsable2 \
        --format=JobID,JobName,State,Elapsed,NNodes,MaxRSS,TRESUsageInMax \
        "$@" |
    awk -F'|' '
    BEGIN {
        printf "%-18s %-14s %-12s %-12s %6s %10s %10s\n",
               "JobID", "JobName", "State", "Elapsed", "Nodes", "HostMem", "GPUMem"
    }
    {
        job = $1
        sub(/\..*/, "", job)
        if (previous != "" && job != previous)
            print "----------------------------------------------------------------------------------------"
        previous = job

        name = $2
        if (length(name) > 14)
            name = substr(name, 1, 13) "+"

        gpu = "-"
        n = split($7, metrics, ",")
        for (i = 1; i <= n; i++) {
            if (metrics[i] ~ /^gres\/gpumem=/) {
                gpu = metrics[i]
                sub(/^gres\/gpumem=/, "", gpu)
            }
        }

        printf "%-18s %-14s %-12s %-12s %6s %10s %10s\n",
               $1, name, $3, $4, ($5 == "" ? "-" : $5),
               ($6 == "" ? "-" : $6), gpu
    }'
}

# Generate clangd's database from the project root without building the application.
gentag() (
    set -o pipefail
    local build_method
    local cache_dir="$PWD/.cache/compdb"

    if [[ -f CMakeLists.txt ]]; then
        build_method=cmake
    elif [[ -f configure.py && -f Makefile.in && -f src/defs.hpp.in ]]; then
        build_method=athena
    else
        echo 'compdb: run from a project root containing CMakeLists.txt or a Makefile.' >&2
        return 2
    fi

    if [[ $build_method == cmake ]]; then
        source ~/projects/shared/build-configs/load-env.sh athenak gpu || return
        cmake -B "$cache_dir"\
          -DKokkos_ENABLE_CUDA=ON\
          -DAthena_ENABLE_MPI=ON\
          -DCMAKE_CXX_COMPILER="$PWD/kokkos/bin/nvcc_wrapper"\
          -DCMAKE_EXPORT_COMPILE_COMMANDS=ON || return
        cp "$cache_dir/compile_commands.json" . || return
        module purge
    elif [[ $build_method == athena ]]; then
        source ~/projects/shared/build-configs/load-env.sh tigris cpu || return
        python3 configure.py\
          --eos=isothermal\
          --grav=mg\
          -b\
          --flux=hlld\
          -mpi\
          -hdf5\
          --include="$MPI_HOME/include"\
          --include="$HDF5_ROOT/include"\
          --lib_path="$HDF5_ROOT/lib64"\
          --cxx='icpx'\
          --mpiccmd='mpicxx' || return
        make -Bn --print-directory CXX=mpic++ |
          compiledb --overwrite || return
        module purge
    fi
)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

case "$(hostname -s)" in
    stellar*)
        source "$HOME/.config/bash/stellar.sh"
        ;;
    della*)
        source "$HOME/.config/bash/della.sh"
        ;;
    glogin*)
        source "$HOME/.config/bash/hangang.sh"
        ;;
esac
