# ================= User configured area ================= 
#

# --------------------- ZSH ---------------------
# Clear history menu using Esc
bindkey -M menuselect -s '^[' '^G^_'
# -----------------------------------------------

# --------- Path ----------
# Personal binaries
export PATH=$HOME/bin${PATH:+:${PATH}}
# CUDA
export CUDA_INSTALL_PATH=/usr/local/cuda
export PATH=$PATH:$CUDA_INSTALL_PATH/bin
#  Substitution: https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/utilities/V3_chap02.html#tag_18_06_02
export LD_LIBRARY_PATH=$CUDA_INSTALL_PATH/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# Python Poetry
export PATH=$PATH:$HOME/.local/bin
# -------------------------

# --------- Environment configurations ----------
# Color man pages: https://www.tecmint.com/view-colored-man-pages-in-linux/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# Terminal colors (for tmux)
#    From: https://github.com/zsh-users/zsh-autosuggestions/issues/229#issuecomment-300675586
export TERM=xterm-256color
# Editor configuration
export EDITOR="nvim"    # Use NeoVim
# -----------------------------------------------

# ---------------- Aliases ---------------- 
# Copy to clipboard
alias cpclip="xclip -i -selection clipboard"
alias pwdclip="pwd | tr -d '\n' | cpclip"
# Open PWD in explorer
alias pwdopen="xdg-open $PWD 2> /dev/null"
# If you want to use neovim (default editor) with crontab
alias crontab="export VISUAL$EDITOR; crontab"
# Use neovim instead of vim
alias vi="nvim"
# TL;DR colors
alias tldr="tldr --theme base16"
# Tmux sessions
alias tmux="tmux -u"
# Mamba aliases
alias mi="mamba-init"    
alias ma="mamba activate"    
alias mima="mamba-init && mamba activate"    
alias mami="mima"
# -----------------------------------------

# -------------------- Functions --------------------
# Open VSCode (and check if a path is passed)
function c() {
    if [[ "$1" ]]; then
        open_dir=$1
    else
        open_dir=$(pwd)
    fi
    code $open_dir
}
# ---------------------------------------------------

# ------ RRC Simulation Servers (IIIT Hyderabad) ------ 
export USER_RRC="avneesh.mishra"
function link-rrc-sys() {
    if [[ "$2" ]]; then
        port_num=$2
    else
        port_num=61000
    fi
    if [[ "$3" ]]; then
        src_port=$3
    else
        src_port=22
    fi
    node_name="$1.rrcx.tk"
    # Remove from list of known hosts (to avoid conflicts)
    rmh_str="ssh-keygen -f $HOME/.ssh/known_hosts -R \"[localhost]:$port_num\""
    echo -ne "\e[0;36m"
    echo $rmh_str
    echo -ne "\e[0m"
    eval $rmh_str
    # Connect through SSH
    ssh_str="ssh -L ${port_num}:localhost:${src_port} -X -t $USER_RRC@$node_name zsh"
    echo -ne "\e[0;36m"
    echo $ssh_str
    echo -ne "\e[0m"
    eval $ssh_str
    ecode=$?
    echo "SSH Connection ended - exit code $ecode"
}
# -----------------------------------------------------

# ------ Ada HPC (IIIT Hyderabad) ------ 
# Username on ada
export USER_ADA="avneesh.mishra"
export USER_RRC="avneesh.mishra"
# Quick ssh into ada
alias ada_ssh="ssh_ada -X $USER_ADA@ada"
# Aliases for tunneling SSH connections to Ada (sync with VSCode config file)
export VSCODE_SSH_CONFIG="$HOME/.ssh/config.vscode"
alias link-ada="ssh -L 51000:localhost:22 $USER_ADA@ada"
function link-gnode() {
    if [[ "$2" ]]; then
        port_num=$2
    else
        port_num=60000
    fi
    if [[ "$3" ]]; then
        src_port=$3
    else
        src_port=22
    fi
    gnode_name="gnode$(printf '%03d' $1)"
    # Remove from list of known hosts (to avoid conflicts)
    rmh_str="ssh-keygen -f $HOME/.ssh/known_hosts -R \"[localhost]:$port_num\""
    echo -ne "\e[0;36m"
    echo $rmh_str
    echo -ne "\e[0m"
    eval $rmh_str
    # Connect through SSH (and open ZSH)
    ssh_str="ssh -L ${port_num}:localhost:${src_port} -X -J $USER_ADA@ada -t $USER_ADA@$gnode_name zsh"
    echo -ne "\e[0;36m"
    echo $ssh_str
    echo -ne "\e[0m"
    eval $ssh_str
    ecode=$?
    echo "SSH Connection ended - exit code $ecode"
}
# Print job ID (for SLURM)                                                                                                                                                                                                                    
if [[ $(hostname) =~ ^gnode ]]; then                                                                                                                                                                                                          
    echo "SLURM Job ID: $SLURM_JOB_ID"                                                                                                                                                                                                        
fi 
# --- For inside Ada ---
# SSH into a gnode                                                                                                                                                                                                                            
function ssh-gnode() {                                                                                                                                                                                                                        
    gnode_name="gnode$(printf '%03d' $1)"                                                                                                                                                                                                     
    ssh_str="ssh -Xt $gnode_name zsh"                                                                                                                                                                                                         
    echo -ne "\e[0;36m"                                                                                                                                                                                                                       
    echo $ssh_str                                                                                                                                                                                                                             
    echo -ne "\e[0m"                                                                                                                                                                                                                          
    eval $ssh_str                                                                                                                                                                                                                             
    ecode=$?                                                                                                                                                                                                                                  
    echo "SSH connection with $gnode_name ended with exit code - $ecode"                                                                                                                                                                      
}
# --------------------------------------

# ------------------------- Anaconda -------------------------
# Disable base on startup: conda config --set auto_activate_base false
function conda-init() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/avneesh/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/avneesh/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/avneesh/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/avneesh/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}
# RRC anaconda installation
function conda-rrc-init() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/home/rrc.env/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/rrc.env/anaconda3/etc/profile.d/conda.sh" ]; then
                . "/home/rrc.env/anaconda3/etc/profile.d/conda.sh"
            else
                export PATH="/home/rrc.env/anaconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
    # conda config --set auto_activate_base false
    # <<< conda initialize
}
# Initialize mamba
function mamba-init() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home2/avneesh.mishra/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home2/avneesh.mishra/mambaforge/etc/profile.d/conda.sh" ]; then
            . "/home2/avneesh.mishra/mambaforge/etc/profile.d/conda.sh"
        else
            export PATH="/home2/avneesh.mishra/mambaforge/bin:$PATH"
        fi
    fi
    unset __conda_setup
    
    if [ -f "/home2/avneesh.mishra/mambaforge/etc/profile.d/mamba.sh" ]; then
        . "/home2/avneesh.mishra/mambaforge/etc/profile.d/mamba.sh"
    fi
    # <<< conda initialize <<<
}
function mamba-scratch-init-old() { # Use the alias with the script
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/scratch/avneesh.mishra/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/scratch/avneesh.mishra/mambaforge/etc/profile.d/conda.sh" ]; then
            . "/scratch/avneesh.mishra/mambaforge/etc/profile.d/conda.sh"
        else
            export PATH="/scratch/avneesh.mishra/mambaforge/bin:$PATH"
        fi
    fi
    unset __conda_setup
    
    if [ -f "/scratch/avneesh.mishra/mambaforge/etc/profile.d/mamba.sh" ]; then
        . "/scratch/avneesh.mishra/mambaforge/etc/profile.d/mamba.sh"
    fi
    # <<< conda initialize <<<
}
alias mamba-scratch-init="source mamba-scratch-init.sh"
# Link library of conda environment
function conda-ld-link() {
    # Can also add to $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
    # This file is run every time there is an environment activated
    if [[ $CONDA_PREFIX ]]; then
        echo "Adding 'lib' for $CONDA_PREFIX environment"
        lib_path=$CONDA_PREFIX/lib
        if [[ $LD_LIBRARY_PATH == *"$lib_path"* ]]; then
            echo "Path $lib_path already in LD_LIBRARY_PATH"
        else
            export LD_LIBRARY_PATH=$lib_path${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
        fi
        echo "LD_LIBRARY_PATH contains:"
        echo "- $LD_LIBRARY_PATH" | sed "s/:/\n- /g"
    else
        echo "No conda environment is active"
    fi
}
# ------------------------------------------------------------

# -------- RubyGems installation ----------
# Paths
#   From: https://jekyllrb.com/docs/installation/ubuntu/
export GEM_HOME="$HOME/gems"
export PATH="$PATH:$HOME/gems/bin"
# NPM
#  Set home
#  From: https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
export NPM_CONFIG_PREFIX=~/.npm-global
export PATH=$PATH:${NPM_CONFIG_PREFIX}/bin
# -----------------------------------------

# -------- AWS CLI ----------
# Autocomplete
#  From: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html#cli-command-completion-linux
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
# ---------------------------

# --------------------- ROS --------------------- 
# Source installation
function ros-init() {
    # Main ROS installation
    source /opt/ros/humble/setup.zsh
}
# -----------------------------------------------

# ---------------- PyEnv ----------------
# Add installation to path
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PATH:$PYENV_ROOT/bin
function pyenv-init() {
    eval "$(pyenv init -)"
}
# ---------------------------------------