WWWROOT=/var/www
EXTJS=/usr/local/src/ext-4.1.1a
SENCHA=/usr/local/SenchaSDKTools-2.0.0-beta3/sencha

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

