
#
# Change to the directory of the specified Go package name.
#
gg() {
	paths=($(g "$@"))
	path_index=0

	if [ ${#paths[@]} -gt 1 ]; then
		c=1
		for path in "${paths[@]}"; do
			echo [$c]: cd ${GOPATH}/${path}
			c=$((c+1))
		done
		echo -n "Go to which path: "
		read path_index

		path_index=$(($path_index-1))
	fi

	path=${paths[$path_index]}
	cd $GOPATH/src/$path
}

#
# Print the directories of the specified Go package name.
#
g() {
	local pkg_candidates="$((cd $GOPATH/src && find . -mindepth 1 -maxdepth 5 -type d \( -path "*/$1" -or -path "*/$1.git" \) -print) | sed 's/^\.\///g')"
	echo "$pkg_candidates"
}

#
# Bash autocomplete for g and gg functions.
#
_g_complete()
{
    COMPREPLY=()

    local cur
    local prev

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    COMPREPLY=( $(compgen -W "$(for f in $(find "$GOPATH/src" -mindepth 1 -maxdepth 5 -type d -name "${cur}*" ! -name '.*' ! -path '*/.git/*' ! -path '*/test/*' ! -path '*/Godeps/*' ! -path '*/examples/*'); do echo "${f##*/}"; done)" --  "$cur") )
    return 0
}

complete -F _g_complete g
complete -F _g_complete gg
