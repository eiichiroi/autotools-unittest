#!/bin/sh

old_package_name='autotools-unittest'

usage()
{
  echo "Usage: `basename $0` [options] [--] <new package name>"
  echo 'Options:'
  echo "\t-o\told package name. (default: $old_package_name)"
  return 0
}

confirm_with_default()
{
  default=$1
  message=$2
  if [ $default -eq 0 ]; then
    question='[yes/NO]'
  else
    question='[YES/no]'
  fi
  echo -n "$message $question: "
  while read line
  do
    answer=`echo "$line" | tr "[:upper:]" "[:lower:]"`
    if [ -z $answer ]; then
      return $default
    elif [ $answer = 'y' -o $answer = 'yes' ]; then
      return 1
    elif [ $answer = 'n' -o $answer = 'no' ]; then
      return 0
    else
      echo -n "Please answer yes or no. $question: "
    fi
  done
  return $default
}

confirm_with_default_yes()
{
  confirm_with_default 1 "$*"
  return $?
}

confirm_with_default_no()
{
  confirm_with_default 0 "$*"
  return $?
}

canonicalize()
{
  echo -n $1 | tr --complement "[:alnum:]@" "_"
}

upcase()
{
  echo -n $1 | tr "[:lower:]" "[:upper:]"
}

while getopts o: opts
do
  case $opts in
    o)
      old_package_name=$OPTARG
      ;;
  esac
done
shift `expr $OPTIND - 1`

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

new_package_name=$1

canonicalized_old_package_name=`canonicalize $old_package_name`
canonicalized_new_package_name=`canonicalize $new_package_name`

upcased_old_package_name=`upcase $canonicalized_old_package_name`
upcased_new_package_name=`upcase $canonicalized_new_package_name`

confirm_with_default_no "Changing package name from '$old_package_name' to '$new_package_name' ... Are you sure?"
if [ $? -eq 0 ]; then
  echo 'Changing package name is canceled.'
  exit 1
fi

# change directory names
directories=`find . -type d -name "$old_package_name"`
if [ -n "$directories" ]; then
  echo '==========================================================================='
  echo ''
  echo "$directories" | while read directory
  do
    echo "* $directory"
  done
  echo ''

  confirm_with_default_no 'These directory names listed above will be changed. Are you sure?'
  if [ $? -eq 0 ]; then
    echo 'Not changed.'
  else
    echo ''
    echo "$directories" | while read directory
    do
      echo -n "* $directory ... "
      mv "$directory" "`echo $directory | sed -e \"s/$old_package_name/$new_package_name/g\"`"
      if [ $? -eq 0 ]; then
        echo 'done.'
      else
        echo 'failed.'
      fi
    done
  fi
  echo ''
fi

# change file contents
files=`find . -type f -name 'configure.ac' -o -name 'Makefile.am*' -o -name '*.cc' -o -name '*.cpp' -o -name "*.h" | xargs grep -E -l "($old_package_name|$canonicalized_old_package_name|$upcased_old_package_name)"`
if [ -n "$files" ]; then
  echo '==========================================================================='
  echo ''
  echo "$files" | while read file
  do
    echo "* $file"
  done
  echo ''

  confirm_with_default_no 'These contents of files listed above will be changed. Are you sure?'
  if [ $? -eq 0 ]; then
    echo 'Not changed.'
  else
    echo ''
    echo "$files" | while read file
    do
      echo -n "* $file ... "
      sed -i -e "s/$old_package_name/$new_package_name/g" "$file"
      sed -i -e "s/$canonicalized_old_package_name/$canonicalized_new_package_name/g" "$file"
      sed -i -e "s/$upcased_old_package_name/$upcased_new_package_name/g" "$file"
      if [ $? -eq 0 ]; then
        echo 'done.'
      else
        echo 'failed.'
      fi
    done
  fi
  echo ''
fi
