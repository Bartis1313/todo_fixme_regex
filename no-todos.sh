#!/bin/bash

found=0

for i in `find . -type f -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.sh" -o -name "*.py"`;
do
  if [[ $i =~ .*no-todos.sh.* ]]; then
    continue
  fi
  result=(`grep -iozE '(((\/\/|#).*(todo|fixme))|(\/\*[^*]*\*+(?:[^\/*][^*]*\*+)*\/))' "$i" | grep -icE '(todo|fixme)'`)
    if [[ $result -gt 0 ]]; then
      echo "Found todo/fixme comment in $i"
     found=1
    fi
done
exit $found