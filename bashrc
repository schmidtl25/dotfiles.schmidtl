#################################################################
# source localhost bashrc #
#################################################################
[ -r "/etc/bashrc" ] && source /etc/bashrc

#################################################################
# Scripts #
#################################################################
for script in ~/.bashrc.d/*; do
  if [ -x "${script}" ]; then
    source ${script}
  fi
done

#################################################################
# Fix PATH (purge duplicates while preserving order) #
#################################################################
if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;         # already there
      *) PATH=$PATH:$x;;    # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi