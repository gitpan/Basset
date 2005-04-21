package Basset::Container::Hash;

#Basset::Container::Hash, copyright and (c) 2005 James A Thomason III
#Basset::Container::Hash is distributed under the terms of the Perl Artistic License.

$VERSION = '1.00';

=pod

Basset::Container::Hash implements a layered hash. The easiest way to explain is with an example:

 my %x = ('a' => 'b');
 
 tie my %y, 'Basset::Container::Hash', \%x;	#<- %x is the parent of 'y'.
 
 print $x{'a'};	#prints b
 print $y{'a'}; #prints b (inherited from x)
 $y{'a'} = 'foo';
 $y{'z'} = 'bar';
 print $x{'a'};	#prints b
 print $y{'a'}; #prints foo (overriden in y)
 print $x{'z'};	#prints undef (not defined in x
 print $y{'z'}; #prints bar (overridden from x)
 delete $y{'a'};
 print $x{'a'};	#prints b
 print $y{'a'}; #prints b (inherited from x)
 $x{'b'} = 'c';
 print $x{'b'};	#prints c
 print $y{'b'}; #prints c (inherited from x)

=cut

use strict;
use warnings;

# we're going to use an array underneath and bypass Basset::Object & accessor, for speed reasons.
# since we only talk to it via the tie interface, we can get away with it.
our $internal_hash	= 0;
our $parent			= 1;
our $gotoparent		= 2;

sub TIEHASH {

	my $class	= shift;
	my $parent	= shift;
	
	return bless [
		{},
		$parent,
		0
	], $class;
}

sub STORE {
	my $self = shift;
	my $key = shift;
	my $value = shift;
	
	$self->[$internal_hash]->{$key} = $value;
}

sub FETCH {
	my $self	= shift;
	my $key		= shift;
	
	my $internal = $self->[$internal_hash];
	
	if (exists $internal->{$key}) {
		return $internal->{$key};
	}
	elsif (my $parent = $self->[$parent]) {
		return $parent->{$key};
	}
	else {
		return;
	}
}

sub EXISTS {
	my $self	= shift;
	my $key 	= shift;
	
	my $internal = $self->[$internal_hash];
	
	if (exists $internal->{$key}) {
		return exists $internal->{$key};
	}
	elsif (my $parent = $self->[$parent]) {
		return exists $parent->{$key};
	}
	else {
		return;
	}
}

sub DELETE {
	my $self = shift;
	my $key = shift;
	
	delete $self->[$internal_hash]->{$key};
}

sub CLEAR {
	shift->[$internal_hash] = {};
}

sub FIRSTKEY {
	my $self = shift;
	
	$self->[$gotoparent] = 0;
	
	my $internal = $self->[$internal_hash];
	my $c = keys %$internal;
	
	my ($k, $v) = each %$internal;
	
	return $k;
}

sub NEXTKEY {
	my $self = shift;
	
	my $internal = $self->[$internal_hash];
	
	unless ($self->[$gotoparent]) {
		my ($k, $v) = each %$internal;
		if (defined $k) {
			return $k;
		}
	}
	
	if (my $parent = $self->[$parent]) {
		$self->[$gotoparent] = 1;
		while (my ($k, $v) = each %$parent) {
			return $k unless exists $internal->{$k};
		}
		$self->[$gotoparent] = 0;
	}
	
	return;
}

sub SCALAR {
	my $self = shift;
	
	my $internal = $self->[$internal_hash];
	
	my %flat = ();
	@flat{keys %$internal} = values %$internal;
	
	return scalar %flat;
	
}

1;
