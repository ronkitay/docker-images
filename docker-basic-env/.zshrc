alias ll='ls -la'
alias tf='tail -f'

if [ -z "${WORKSPACE_NAME}" ]; then
    WORKSPACE_NAME="Workspace #$(date +%s)"
fi

export PS1="[${WORKSPACE_NAME}] > "
