. ~/.config/fish/alias.fish

# Tell Vagrant to use libvirt as it's default provider.
set -x VAGRANT_DEFAULT_PROVIDER libvirt

# make nvim the default editor
set -x EDITOR nvim

# make nvim usable with git
set -x GIT_EDITOR nvim

# Silence fish greeting
set -g fish_greeting ''

# enable nerd fonts
set -g theme_nerd_fonts yes

# swap esc and caps
setxkbmap -option caps:swapescape

# start_agent for ssh
setenv SSH_ENV $HOME/.ssh/environment

# set local path (mostly for pip installed apps)
set PATH "$HOME/.local/bin" $PATH

set XDG_DATA_DIRS "/home/user/.local/share/applications:/home/user/.local/share/flatpak/exports/share/:/var/lib/flatpak/exports/share/:/usr/local/share/:/usr/share" $XDG_DATA_DIRS

# persistently add to path
function add_to_path --description 'Persistently prepends paths to your PATH'
  for path in $argv
    if not contains $path $fish_user_paths
      set --universal fish_user_paths $fish_user_paths $argv
    end
  end
end

function start_agent
    if [ -n "$SSH_AGENT_PID" ]
            ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
            if [ $status -eq 0 ]
                test_identities
            end
    else
            if [ -f $SSH_ENV ]
                . $SSH_ENV > /dev/null
            end
        ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
        if [ $status -eq 0 ]
            test_identities
        else
            echo "Initializing new SSH agent ..."
            ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
            echo "succeeded"
        chmod 600 $SSH_ENV
        . $SSH_ENV > /dev/null
            ssh-add
    end
    end
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

function fish_title
    if [ $_ = 'fish' ]
    echo (prompt_pwd)
    else
        echo $_
    end
end

function ef; nvim ~/.config/fish/config.fish; end
function ev; nvim ~/.config/nvim/init.vim; end

# Systemd
if which systemctl >/dev/null ^/dev/null
  function start;   sudo systemctl start $argv; end
  function stop;    sudo systemctl stop $argv; end
  function restart; sudo systemctl restart $argv; end
  function reboot;  sudo systemctl reboot $argv; end
end

# Fisher
#if not functions -q fisher
    #set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    #curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    #fish -c fisher
#end

# fish git prompt
#set __fish_git_prompt_showdirtystate 'yes'
#set __fish_git_prompt_showstashstate 'yes'
#set __fish_git_prompt_showupstream auto,verbose
#set __fish_git_prompt_color_branch yellow
#set __fish_git_prompt_color_dirtystate red

# Status Chars for git status
#set __fish_git_prompt_char_dirtystate '⚡'
#set __fish_git_prompt_char_stagedstate '→'
#set __fish_git_prompt_char_stashstate '↩'
#set __fish_git_prompt_char_upstream_ahead '↑'
#set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
        #set last_status $status
        #set_color $fish_color_cwd
        #printf '%s' (prompt_pwd)
        #set_color normal
        #printf '%s ' (__fish_git_prompt)
        #powerline-shell --shell bare $status
       #set_color normal
end
