# .bash_aliases

alias \
  python=python3                                                  \
  pyvenv="python -m venv .env && source .env/bin/activate"


alias \
  ?="searchweb -page=duck -config=${SEARCHYAML}"         \
  ord="searchweb -page=ordnet -config=${SEARCHYAML}"     \
  korp="searchweb -page=korpus -config=${SEARCHYAML}"    \
  tysk="searchweb -page=tysk -config=${SEARCHYAML}"      \
  yt="searchweb -page=youtube -config=${SEARCHYAML}"     \
  github="searchweb -page=github -config=${SEARCHYAML}"


alias \
  vrc="vim ~/.vimrc"            \
  brc="vim ~/.bash_profile"


alias \
  repos="cd ${REPOS} && ls -A"


alias \
  k="clear"                      \
  cp="cp -iv"                    \
  mv="mv -iv"                    \
  rm="rm -v"                     \
  mkd="mkdir -pv"

