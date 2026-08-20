# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

source /ptmp/mpa/wuze/miniconda3/bin/activate
test -s ~/.alias && . ~/.alias || true
export PTMP="/freya/ptmp/mpa/wuze"
cd $PTMP
alias wkdir='cd $PTMP'


# >>> Aliases >>>
# programs
alias 'np'='nohup python3'  # run stuff in the background

alias 'python'='python3'
alias 'python312'='/ptmp/mpa/wuze/miniconda3/envs/base/bin/python'  # runs everything else
alias 'python309'='/ptmp/mpa/wuze/miniconda3/envs/lensing/bin/python'  # runs gigalens
alias activate-lensing='conda activate lensing'
alias activate-base='conda activate base'

alias 'pip'='pip3'
# jupyter notebook
alias 'nbstart'='jupyter notebook --config=/Users/jasonwu/.jupyter/nbconfig/notebook.json --NotebookApp.max_buffer_size=8589934592'
alias 'labstart'='jupyter lab' #--config=/Users/jasonwu/.jupyter/jupyter_notebook_config.py'
alias 'labtunnel'='jupyter lab --no-browser --port=9998 --ip=0.0.0.0'
# ldmx
alias ldmx-env='source <full-path>/ldmx-env.sh; unalias ldmx-env'
# other commands
alias l="ls -alrt"
alias git-log="git log -10 --pretty=format:'%h'"





# >>> Commands >>>
# echo "bash initiated"
# cd /freya/ptmp/mpa/wuze

# screen
alias scs='screen -S'
alias scl='screen -ls'
alias scr='screen -r'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/freya/ptmp/mpa/wuze/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/freya/ptmp/mpa/wuze/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/freya/ptmp/mpa/wuze/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/freya/ptmp/mpa/wuze/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> PATH setups >>>
export PATH="$PATH:/freya/ptmp/mpa/wuze/miniconda3/bin/python3"
export PYTHONPATH="$PYTHONPATH:/freya/ptmp/mpa/wuze/multiphase_turb/codes"
export PYTHONPATH="$PYTHONPATH:/freya/ptmp/mpa/wuze/miniconda3/bin/python3"
# mpi paths
export PATH="/mpcdf/soft/SLE_15/sub/intel_19_1_2/modules/mpi/impi/2019.8/bin:$PATH"
export LD_LIBRARY_PATH="/mpcdf/soft/SLE_15/sub/intel_19_1_2/modules/mpi/impi/2019.8/lib:$LD_LIBRARY_PATH"
# cuda paths
export CUDA_HOME="/mpcdf/soft/SLE_15/packages/x86_64/cuda/11.6.2:$CUDA_HOME"
export CUDA_ROOT="/mpcdf/soft/SLE_15/packages/x86_64/cuda/11.6.2:$CUDA_ROOT"
export PATH="/mpcdf/soft/SLE_15/packages/x86_64/cuda/11.6.2/bin:$PATH"
export LD_LIBRARY_PATH="/mpcdf/soft/SLE_15/packages/x86_64/cuda/11.6.2/lib64:$LD_LIBRARY_PATH"
export MODULEPATH="/mpcdf/soft/SLE_15/sub/cuda_11_6/modules/ml:$MODULEPATH"
export CUDNN_HOME="/mpcdf/soft/SLE_15/packages/skylake/cudnn/cuda_11.6-11.6.2/8.8.1.3:$CUDNN_HOME"
export LD_LIBRARY_PATH="/mpcdf/soft/SLE_15/packages/skylake/cudnn/cuda_11.6-11.6.2/8.8.1.3/lib64:$LD_LIBRARY_PATH"
# athena path, turbulent box version used instead
export ATHENA_DIR='/freya/ptmp/mpa/wuze/athena'
# fftw path
# export FFTW_HOME='/mpcdf/soft/SLE_15/sub/intel_19_1_2/sub/impi_2019_8/modules/libs/fftw-mpi/3.3.8'
# hdf5 path
# export HDF5_HOME='/mpcdf/soft/SLE_15/sub/intel_19_1_2/sub/impi_2019_8/modules/libs/hdf5-mpi/1.12.0'

# MANPATH
export MANPATH="/freya/ptmp/mpa/wuze/latex/texmf-dist/doc/man"
export INFOPATH="/freya/ptmp/mpa/wuze/latex/texmf-dist/doc/info"
export PATH="/freya/ptmp/mpa/wuze/latex/bin/x86_64-linux:$PATH"

# DATA DIRECTORIES
export DP="/freya/ptmp/mpa/wuze/multiphase_turb/data"

# nuke jobs
alias jm=$'squeue --me'
alias jn=$'squeue -u wuze | awk \'{ print $1 }\' | tail -n+2'
alias jobs_nuke=$'jn | xargs scancel'

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/u/wuze/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='easy'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"