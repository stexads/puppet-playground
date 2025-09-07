# Node definitions
node /\.chello.ie$/ {
}

# Define your node here...
# The following line links the file name manifests/node/stefano.pp
node stefano.chello.ie {
  include "::node::${hostname}"
}
