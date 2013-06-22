WWWROOT=/var/www
EXTJS=/usr/local/src/ext-4.2.1.883
SENCHA=$SENCHA_CMD_3_0_0/sencha

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

