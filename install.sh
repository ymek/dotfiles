#!/bin/sh

# Super quick-and-dirty for systems without ruby/rake
# This is incompatible with Bash < 4.0

function link_file() {
  if [ $# -lt 1 ]; then
    echo "No file specified."
    return
  fi

  file=$1
  symlink="${HOME}/.${file}"

  echo "${PWD}/${file} -> ${symlink}"
  ln -s ${PWD}/${file} ${symlink}
}

function remove_file() {
  if [ $# -lt 1 ]; then
    echo "No file specified."
    return
  fi

  echo "${1} to be removed!"
  rm -rf $1
}

# if zsh exists and we're not using it, change over
function change_shell() {
  zsh_path=$(which zsh)

  if ! [[ "${SHELL}" =~ zsh$ ]]; then
    if which zsh > /dev/null ; then
      echo "Changing ${SHELL} to ${zsh_path}"
      chsh -s $zsh_path
    fi
  else
    echo "${zsh_path} in use. Skipping!"
  fi
}

# Link dotfiles
function link_files() {
  exclude_files="(README|Rakefile|install|License)"

  for file in $(ls | grep -vP "${exclude_files}"); do
    symlink="${HOME}/.${file}"

    if ! [ -z ${symlink} ]; then
      # Symlink exists - check if identical
      if cmp -s ${file} ${symlink} ; then
        echo "${symlink} is identical. Skipping!"
      else
        read -p "${symlink} exists and is not identical. Replace? (Y/n) " confirm

        if [[ "${confirm,,}" =~ ^(yes|y) ]] || [ -z ${confirm} ]; then
          remove_file ${symlink}
          link_file ${file}

          continue
        fi

        echo "${symlink} skipped!"
      fi
    else
      link_file ${file}
    fi
  done
}

change_shell
link_files
