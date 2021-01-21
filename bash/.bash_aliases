# .bash_aliases

alias \
  python=python3                                                  \
  pyvenv="python -m venv .env && source .env/bin/activate"


alias \
  ?="searchweb -page=duck -config=${PAGES} "         \
  ord="searchweb -page=ordnet -config=${PAGES} "     \
  korp="searchweb -page=korpus -config=${PAGES} "    \
  tysk="searchweb -page=tysk -config=${PAGES} "      \
  yt="searchweb -page=youtube -config=${PAGES} "     \
  github="searchweb -page=github -config=${PAGES} "  \
  twitch="searchweb -page=twitch -config=${PAGES} "


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

