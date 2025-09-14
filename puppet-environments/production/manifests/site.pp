# Node definitions
node /\.0x3e.(lan|net)$/ {
  include "nodes::${hostname}"
}

# Define your node here...
# The following line links the file name manifests/node/stefano.pp
#node stefano.0x3e.lan {
#  include "::nodes::${hostname}"
#}
