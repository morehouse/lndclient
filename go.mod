module github.com/lightninglabs/lndclient

require (
	github.com/btcsuite/btcd v0.22.0-beta.0.20220207191057-4dc4ff7963b4
	github.com/btcsuite/btcd/btcec/v2 v2.1.0
	github.com/btcsuite/btcd/btcutil v1.1.0
	github.com/btcsuite/btclog v0.0.0-20170628155309-84c8d2346e9f
	github.com/btcsuite/btcwallet/wtxmgr v1.5.0
	github.com/juju/testing v0.0.0-20220203020004-a0ff61f03494 // indirect
	github.com/lightningnetwork/lnd v0.14.2-beta
	github.com/lightningnetwork/lnd/kvdb v1.3.1
	github.com/stretchr/testify v1.7.0
	go.etcd.io/bbolt v1.3.6
	google.golang.org/grpc v1.38.0
	gopkg.in/errgo.v1 v1.0.1 // indirect
	gopkg.in/macaroon-bakery.v2 v2.0.1
	gopkg.in/macaroon.v2 v2.1.0
)

go 1.15

// Note(carla): when I bumped various modules, I ran into a "requires lnd 14.2"
// error. I believe that this may be due to the various submodules in lnd
// (like healthcheck) pointing to 14.2. This replace pointing to the commit
// which bumps all the btcsuite stuff seemed to sort it out.
//
// I do not understand this, I should before we merge. This workaround is just
// here to allow us to use lndclient with the new btcsuite stuff.
replace github.com/lightningnetwork/lnd => github.com/lightningnetwork/lnd v0.14.1-beta.0.20220314094524-95c270d1f880

// Note(carla): copied from https://github.com/lightningnetwork/lnd/pull/6285
//
// The old version of ginko that's used in btcd imports an ancient version of
// gopkg.in/fsnotify.v1 that isn't go mod compatible. We fix that import error
// by replacing ginko (which is only a test library anyway) with a more recent
// version.
replace github.com/onsi/ginkgo => github.com/onsi/ginkgo v1.14.2
