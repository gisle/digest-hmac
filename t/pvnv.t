use Test::More;

use Digest::HMAC_SHA1;
use Data::Dump;

my $s = 'apejens';

my $first = hmac($s);

my $dump = Data::Dump::dump($s);

my $second = hmac($s);

is($first, $second, "got same answer");

done_testing;

sub hmac {
    my $hmac = Digest::HMAC_SHA1->new(shift);
    $hmac->add("something");

    return $hmac->b64digest;
}

