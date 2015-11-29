#!/bin/sh
# Prepare script files for inclusion in tinygettext
for LEVELSET in $(ls src); do
  SCRIPT_FILES=$(find src/$LEVELSET -name "*.nut")
  for SCRIPT_FILE in $SCRIPT_FILES; do
    name=$(basename ${SCRIPT_FILE})
    name=${name/.nut/}
    python ./extract_strings.py ${SCRIPT_FILE} src/$LEVELSET/scripts_${name}.txt
  done
done

for LEVELSET in $(ls src); do
  find src/$LEVELSET "(" -name "*.stl" -or -name "*.stwm" -or -name "*.txt" ")" -print0 | xargs -0 xgettext --keyword='_:1' --language=Lisp --sort-by-file --output translations/$LEVELSET.pot
  rm -f src/$LEVELSET/scripts_*.txt 2> /dev/null
done
