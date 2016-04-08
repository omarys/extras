. ~/.config/fish/alias.fish

# Tell Vagrant to use libvirt as it's default provider.
set -x VAGRANT_DEFAULT_PROVIDER libvirt

# Silence fish greeting
set -g fish_greeting ''

# start_agent for ssh
setenv SSH_ENV $HOME/.ssh/environment

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

function ef; vim ~/.config/fish/config.fish; end
function ev; vim ~/.vimrc; end

# Systemd
if which systemctl >/dev/null ^/dev/null
  function start;   sudo systemctl start $argv; end
  function stop;    sudo systemctl stop $argv; end
  function restart; sudo systemctl restart $argv; end
  function reboot;  sudo systemctl reboot $argv; end
end

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream auto,verbose
set __fish_git_prompt_color green
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate red

# Status Chars for git status
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
        set last_status $status
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end
