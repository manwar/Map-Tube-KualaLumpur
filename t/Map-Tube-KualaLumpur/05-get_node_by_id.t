# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use Map::Tube::KualaLumpur;
use Test::More tests => 4;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::KualaLumpur->new;
my $ret = $map->get_node_by_id('foo');
is($ret, undef, 'Get node for bad node id.');

# Test.
eval {
	$map->get_node_by_id;
};
like($EVAL_ERROR, qr{^Map::Tube::get_node_by_id\(\): ERROR: Missing station id. \(status: 102\)},
	'Missing station id.');

# Test.
$ret = $map->get_node_by_id('KA03');
is($ret->name, 'Bank Negara', 'Get node for node id.');
