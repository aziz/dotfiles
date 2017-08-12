#!/usr/bin/env bash

# Notes: ---------------------------------------------------------------------------
#
#   When you start an interactive shell (log in, open terminal or iTerm in OS X,
#   create a new tab in iTerm) the following files are read and run, in this order:
#     * profile
#     * bashrc
#     * .bash_profile
#     * .bashrc (only because this file is run (sourced) in .bash_profile)
#
#   When an interactive shell, that is not a login shell, is started
#   (when you run "bash" from inside a shell, or when you start a shell in
#   xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
#   in this order:
#     * bashrc
#     * .bashrc
#
# ----------------------------------------------------------------------------------

source ~/.bash_profile

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash ] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash