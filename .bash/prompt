#!/usr/bin/env bash
# Defines bash prompt

# returns system date in nanoseconds
function timestamp {
    date +%s%N
}

# sets $cmd_timer if not set
function timer_start {
    cmd_timer=${cmd_timer:-$(timestamp)}
}

# DEBUG trap is executed just before a command
# i.e. start the timer before executing a command
trap timer_start DEBUG

# returns formatted timer
function timer_segment {
    # delta microseconds
    local delta_us=$(( ($(timestamp) - $cmd_timer) / (1000) ))

    # extract time for each unit
    local h=$(( (delta_us / (1000 * 1000 * 60 * 60))        ))
    local m=$(( (delta_us / (1000 * 1000 * 60)     ) % 60   ))
    local s=$(( (delta_us / (1000 * 1000)          ) % 60   ))
    local ms=$(( delta_us /  1000                    % 1000 ))
    local us=$(( delta_us                            % 1000 ))

    # create formatted timer segment
    local ts # timer string

    if (( h > 0 )); then
        ts="${h}h $(printf '%02d' ${m})m"
    elif (( m > 0 )); then
        ts="${m}m $(printf '%02d' ${s})s"
    elif (( s > 0 )); then
        ts="${s}.$(printf '%01d' $(( ${ms} / 100 )))s"
    elif (( ms >= 100 )); then
        ts="${ms}ms"
    elif (( ms > 0 )); then
        ts="${ms}.$(printf '%01d' $(( ${us} / 100 )))ms"
    else
        ts="${us}µs"
    fi

    echo "${ts}"
}

# returns exit code icon
function exit_segment {
    local exit_code="$?"

    # create formatted exit code segment
    local ec # exit code color
    local es # exit code string

    if [[ $exit_code == 0 ]]; then
        ec=${ANSI_GREEN}
        es='\342\234\223' # check mark
    else
        ec=${ANSI_RED}
        es='\342\234\227' # x cross
    fi

    echo ${ec}${es}${ANSI_DEFAULT}
}

# returns padded command history number
function history_segment {
    echo '$(printf "%03d" "\!")'
}

# returns git branch
function git_segment {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# returns python venv environment
function env_segment {
    local env

    if [[ -n $VIRTUAL_ENV ]]; then
        env=$(basename $VIRTUAL_ENV)
    fi

    echo ${env}
}

function prompt_symbol {
    local prompt

    if [[ $USER != 'root' ]]; then
        #prompt="\342\256\241" # arrow prompt
        prompt="$"
    else
        prompt="#"
    fi

    echo ${prompt}
}

# sets $PS1 and resets the timer
function set_prompt {
    # build header segments
    local exit=$(exit_segment) # this must be first
    local timer=$(timer_segment)
    local git=$(git_segment)
    local env=$(env_segment)
    local history=$(history_segment)
    local symbol=$(prompt_symbol)

    # assemble left and right parts of the header and the prompt
    local left right prompt
    left+="${ANSI_BLUE}${history}"                  # history number
    left+="${ANSI_WHITE}${ANSI_BOLD} is "
    left+="${ANSI_MAGENTA}\u"                       # user
    left+="${ANSI_WHITE} at "
    left+="${ANSI_LIGHT_GREEN}\h"                   # hostname
    left+="${ANSI_WHITE} in "
    left+="${ANSI_LIGHT_CYAN}\w"                    # working directory
    if [[ -n ${git} ]]; then
        left+="${ANSI_WHITE} on "
        left+="${ANSI_RED}${git}"                   # git branch
    fi
    if [[ -n ${env} ]]; then
        left+="${ANSI_WHITE} as "
        left+="${ANSI_YELLOW}${env}"                # chroot/venv
    fi
    left+="${ANSI_RESET}"

    right+="${ANSI_LIGHT_GRAY}${timer}"             # command execution time
    right+="${ANSI_DEFAULT}"
    right+=" ${exit}"                               # exit code

    prompt+="${ANSI_WHITE}${ANSI_BOLD}${symbol} "   # prompt symbol
    prompt+="${ANSI_DEFAULT}${ANSI_RESET}"

    # assemble header with filler space between left and right parts and prompt
    # https://superuser.com/a/517110
    local right_offset=51 # this is to compensate for escape sequences
    PS1=$(printf "%*s\r%s\n${prompt}" "$(( $(tput cols) + right_offset ))" "${right}" "${left}")

    # reset the timer
    unset cmd_timer # this must be last
}

# PROMPT_COMMAND is executed just before Bash prints the primary prompt
PROMPT_COMMAND=set_prompt


# ANSI formatting control sequences
ANSI_RESET="\[\e[0m\]"

ANSI_BOLD="\[\e[1m\]"
ANSI_DIM="\[\e[2m\]"
ANSI_UNDERLINED="\[\e[4m\]"
ANSI_BLINK="\[\e[5m\]"
ANSI_INVERT="\[\e[7m\]"
ANSI_HIDDEN="\[\e[8m\]"

# ANSI 8/16 colors control sequences
ANSI_DEFAULT="\[\e[39m\]"

ANSI_BLACK="\[\e[30m\]"
ANSI_WHITE="\[\e[97m\]"

ANSI_LIGHT_GRAY="\[\e[37m\]"
ANSI_DARK_GRAY="\[\e[90m\]"

ANSI_RED="\[\e[31m\]"
ANSI_LIGHT_RED="\[\e[91m\]"

ANSI_YELLOW="\[\e[33m\]"
ANSI_LIGHT_YELLOW="\[\e[93m\]"

ANSI_GREEN="\[\e[32m\]"
ANSI_LIGHT_GREEN="\[\e[92m\]"

ANSI_CYAN="\[\e[36m\]"
ANSI_LIGHT_CYAN="\[\e[96m\]"

ANSI_BLUE="\[\e[34m\]"
ANSI_LIGHT_BLUE="\[\e[94m\]"

ANSI_MAGENTA="\[\e[35m\]"
ANSI_LIGHT_MAGENTA="\[\e[95m\]"
