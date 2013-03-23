WWWROOT=/var/www
EXTJS=/usr/local/src/ext-4.2.0.663
SENCHA=/usr/local/Sencha/Cmd/3.0.2.288/sencha

function create_dir {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
  fi
}

function link_extjs {
  if [ ! -h "$1" ]; then
    ln -s $EXTJS "$1"
  fi
}

