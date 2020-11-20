function _virtualenv_auto_activate() {
    if [[ -f venv/bin/activate ]]; then
        source venv/bin/activate
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi
}

chpwd_functions+=(_virtualenv_auto_activate)
precmd_functions+=(_virtualenv_auto_activate)
