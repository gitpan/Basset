package Basset::Object::Persistent;

#Basset::Object::Persistent Copyright and (c) 2000, 2002, 2003, 2004 James A Thomason III
#Basset::Object::Persistent is distributed under the terms of the Perl Artistic License.

$VERSION = '1.00';

=pod

=head1 NAME

Basset::Object::Persistent - subclass of Basset::Object that allows objects to be easily stored into a relational database.
Presently only supports MySQL, but that may change in the future.

=head1 AUTHOR

Jim Thomason, jim@jimandkoka.com

=head1 SYNOPSIS

(no synopsis, this is an abstract super class that should never be instantiated directly, it should be subclassed for all
persistent objects and used through them)

=head1 DESCRIPTION

Basset::Object is the uber module in my Perl world. All objects should decend from Basset::Object. It handles defining attributes,
error handling, construction, destruction, and generic initialization. It also talks to Basset::Object::Conf to allow conf file use.

But, some objects cannot simply be recreated constantly every time a script runs. Sometimes you need to store the data in an object
between uses so that you can recreate an object in the same form the last time you left it. Storing user information, for instance.

Basset::Object::Persistent allows you to do that transparently and easily. Persistent objects need to define several pieces of additional
information to allow them to commit to the database, including their table definitions. Once these items are defined, you'll have access
to the load and commit methods to allow you to load and store the objects in a database.

It is assumed that an object is stored in the database in a primary table. The primary table
contains a set of columns named the same as object attributes. The attributes are stored in those columns.

 Some::Package->add_attr('foo');
 my $obj = Some::Package->new();
 $obj->foo('bar');
 $obj->commit();

 in the database, the 'foo' column will be set to 'bar'.

=cut

use Scalar::Util qw(weaken isweak);

use Basset::Object;
Basset::Object->inherits(__PACKAGE__, 'object');

use strict;
use warnings;

=pod

=head1 ATTRIBUTES

=over

=item loaded

boolean flag 1/0.

This flag tells you whether or not the objects you are operating on has been loaded from a database or initially created
at this time and not loaded. This flag is set internally, and you should only read it.

=cut

=pod

=begin btest(loaded)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->loaded), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->loaded), 0, 'loaded is 0');
$test->is($o->loaded('abc'), 'abc', 'set loaded to abc');
$test->is($o->loaded(), 'abc', 'read value of loaded - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->loaded($h), $h, 'set loaded to hashref');
$test->is($o->loaded(), $h, 'read value of loaded  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->loaded($a), $a, 'set loaded to arrayref');
$test->is($o->loaded(), $a, 'read value of loaded  - arrayref');

=end btest(loaded)

=cut

__PACKAGE__->add_attr('loaded');

=pod

=item loading

read only boolean flag 1/0.

This flag is usually used internally, it keeps track of whether or not the object is currently in the process of loading
from the database. It will always be zero unless the object is loading. This flag is set internally, and you should only read it.

=cut

=pod

=begin btest(loading)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->loading), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->loading), 0, 'loading is 0');
$test->is($o->loading('abc'), 'abc', 'set loading to abc');
$test->is($o->loading(), 'abc', 'read value of loading - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->loading($h), $h, 'set loading to hashref');
$test->is($o->loading(), $h, 'read value of loading  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->loading($a), $a, 'set loading to arrayref');
$test->is($o->loading(), $a, 'read value of loading  - arrayref');

=end btest(loading)

=cut

__PACKAGE__->add_attr('loading');

=item loaded_from_cache

boolean flag, 1/0.

This flag tells you whether this object was loaded from the object cache. For efficiency's sake, you can specify a path
to an object cache directory and store objects in the cache in addition to committing them to the database. You will then be
able to laod the object from the cache and avoid the over-head of going to the database.

This flag specifies if the object came from the cache. This flag is set internally, and you should only read it.

=cut

=pod

=begin btest(loaded_from_cache)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->loaded_from_cache), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->loaded_from_cache), 0, 'loaded_from_cache is 0');
$test->is($o->loaded_from_cache('abc'), 'abc', 'set loaded_from_cache to abc');
$test->is($o->loaded_from_cache(), 'abc', 'read value of loaded_from_cache - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->loaded_from_cache($h), $h, 'set loaded_from_cache to hashref');
$test->is($o->loaded_from_cache(), $h, 'read value of loaded_from_cache  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->loaded_from_cache($a), $a, 'set loaded_from_cache to arrayref');
$test->is($o->loaded_from_cache(), $a, 'read value of loaded_from_cache  - arrayref');

=end btest(loaded_from_cache)

=cut

__PACKAGE__->add_attr('loaded_from_cache');

=item committing

read only boolean flag 1/0.

This flag is usually used internally, it keeps track of whether or not the object is currently in the process of committing
to the database. It will always be zero unless the object is committing. This flag is set internally, and you should only read it.

=cut

=pod

=begin btest(committing)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->committing), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->committing), 0, 'committing is 0');
$test->is($o->committing('abc'), 'abc', 'set committing to abc');
$test->is($o->committing(), 'abc', 'read value of committing - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->committing($h), $h, 'set committing to hashref');
$test->is($o->committing(), $h, 'read value of committing  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->committing($a), $a, 'set committing to arrayref');
$test->is($o->committing(), $a, 'read value of committing  - arrayref');

=end btest(committing)

=cut

__PACKAGE__->add_attr('committing');

=item committed

Flag, N/0.

This flag tells you whether this object has been committed during this instantiation. It will not keep track of whether an object has
been committed before this instantiation. The value is either 0 (no commits during this instantiation) or N, where N is a positive integer
number containing the number of times that this object has been committed during this instantiation. This flag is set internally, and
you should only read it.

 $object->commit();
 if ($object->committed){
  print "Yay, committed!";
 }
 else {
  print "Could not commit : " . $object->errstring . "\n";
 };

=cut

=pod

=begin btest(committed)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->committed), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->committed), 0, 'committed is 0');
$test->is($o->committed('abc'), 'abc', 'set committed to abc');
$test->is($o->committed(), 'abc', 'read value of committed - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->committed($h), $h, 'set committed to hashref');
$test->is($o->committed(), $h, 'read value of committed  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->committed($a), $a, 'set committed to arrayref');
$test->is($o->committed(), $a, 'read value of committed  - arrayref');

=end btest(committed)

=cut

__PACKAGE__->add_attr('committed');
__PACKAGE__->add_attr('in_db');

=item deleting

read only boolean flag 1/0.

This flag is usually used internally, it keeps track of whether or not the object is currently in the process of being deleted
from the database. It will always be zero unless the object is deleting. This flag is set internally, and you should only read it.

=cut

=pod

=begin btest(deleting)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->deleting), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->deleting), 0, 'deleting is 0');
$test->is($o->deleting('abc'), 'abc', 'set deleting to abc');
$test->is($o->deleting(), 'abc', 'read value of deleting - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->deleting($h), $h, 'set deleting to hashref');
$test->is($o->deleting(), $h, 'read value of deleting  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->deleting($a), $a, 'set deleting to arrayref');
$test->is($o->deleting(), $a, 'read value of deleting  - arrayref');

=end btest(deleting)

=cut

__PACKAGE__->add_attr('deleting');

=pod

=item deleted

Boolean flag, 1/0.

When an object is deleted via the ->delete method, this flag is set to 1. Otherwise, it is 0. This is the only change that is made
to an object when it is deleted, so this is the way to determine if your delete was successful. This flag is set internally, and
you should only read it.

 $object->delete();
 if ($object->deleted){
  print "Yay, deleted!";
 }
 else {
  print "Could not delete : " . $object->errstring . "\n";
 };

=cut

=pod

=begin btest(deleted)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->deleted), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->deleted), 0, 'deleted is 0');
$test->is($o->deleted('abc'), 'abc', 'set deleted to abc');
$test->is($o->deleted(), 'abc', 'read value of deleted - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->deleted($h), $h, 'set deleted to hashref');
$test->is($o->deleted(), $h, 'read value of deleted  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->deleted($a), $a, 'set deleted to arrayref');
$test->is($o->deleted(), $a, 'read value of deleted  - arrayref');

=end btest(deleted)

=cut

__PACKAGE__->add_attr('deleted');

# tables is a class attribute that internally stores the tables associated with this object
__PACKAGE__->add_trickle_class_attr('tables', []);

# grouptables is a class attribute that stores a list of all grouptables used by this object for grouping purposes. Objects may
# be grouped together into groups to associate disparate objects together. This class attribute stores information on group tables.
# This value should be set via the add_grouptable method
__PACKAGE__->add_trickle_class_attr('grouptables');

=pod

=item cache_object

Boolean flag, 1/0.

This is a flag that governs whether object caching is enabled or disabled. Set it to 1 to enable object caching, set it to 0 to
disable object caching.

If this is 0, you must specify a cache_object_dir.

This should be set in your conf file.

=cut

=pod

=begin btest(cache_object)

=end btest(cache_object)

=cut

__PACKAGE__->add_trickle_class_attr('cache_object');

=pod

=item cache_object_dir

This attribute specifies the location where cached objects should be stored. Should be an absolute path ending in a trailing slash.

This should be set in your conf file.

define package Basset::Object::Persistent
cache_object		= 1
cache_object_dir	= /path/to/cached/objects/

=cut

=pod

=begin btest(cache_object_dir)

=end btest(cache_object_dir)

=cut

__PACKAGE__->add_class_attr('cache_object_dir');

=pod

=item arbitrary_selectables

This should be set in the conf file. This is a regular expression that specifies which queries arbitary_sql
should expect to return data. A good value for MySQL is: (show|select|desc|set)

=cut

=pod

=begin btest(arbitrary_selectables)

=end btest(arbitrary_selectables)

=cut

__PACKAGE__->add_class_attr('arbitrary_selectables');

=pod

=item force_insert

Boolean flag. 1/0. Trickles to subclasses.

Your objects may be transactional in nature such that you always want to keep a record of them
no matter how often they've changed. In that case, you can specify the force_insert flag.

Care must be taken with this flag to ensure you never violate primary key constraints. Also, you
may not use auto generated ids, for obvious reasons.

=cut

=pod

=begin btest(force_insert)

=end btest(force_insert)

=cut

__PACKAGE__->add_trickle_class_attr('force_insert');

#=pod
#
#=item iterator
#
#Internally manages the iterator used by load_next
#
#=cut
#
#=pod

=begin btest(iterator)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar($o->iterator), undef, 'iterator is undefined');
$test->is($o->iterator('abc'), 'abc', 'set iterator to abc');
$test->is($o->iterator(), 'abc', 'read value of iterator - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->iterator($h), $h, 'set iterator to hashref');
$test->is($o->iterator(), $h, 'read value of iterator  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->iterator($a), $a, 'set iterator to arrayref');
$test->is($o->iterator(), $a, 'read value of iterator  - arrayref');

=end btest(iterator)

=cut

__PACKAGE__->add_trickle_class_attr('iterator');

=pod

=back

=head1 METHODS

=over

#=item init
#
#Nothing you need to worry about, Basset::Object::Persistent just intercepts init and makes sure that loaded and committed are specified first,
#so that objects may rely upon them being set before the start of the initialization process. Then end up getting re-specified by the
#super method, but that's of no consequence.
#
#=cut

#=pod

=begin btest(init)

my $o = __PACKAGE__->new();
$test->ok($o, "got object for init");

$test->is($o->loading, 0, "loading is 0");
$test->is($o->loaded, 0, "loaded is 0");
$test->is($o->committing, 0, "committing is 0");
$test->is($o->committed, 0, "committed is 0");
$test->is($o->deleting, 0, "deleting is 0");
$test->is($o->deleted, 0, "deleted is 0");
$test->is($o->loaded_from_cache, 0, 'loaded_from_cache is 0');
$test->is(ref($o->instantiated_relationships), 'HASH', 'instantiated_relationships is hashref');
$test->is($o->tied_to_parent, 0, 'tied_to_parent is 0');
$test->is($o->should_be_committed, 0, 'should_be_committed is 0');
$test->is($o->should_be_deleted, 0, 'should_be_committed is 0');
$test->is(ref($o->_deleted_relationships), 'ARRAY', '_deleted_relationships is arrayref');

=end btest(init)

=cut

sub init {
	my $self = shift;

	my %init = @_;

	return $self->SUPER::init(
		'loading'						=> $init{'loading'} || 0,
		'loaded'						=> $init{'loaded'} || 0,
		'committing'					=> $init{'committing'} || 0,
		'committed'						=> $init{'committed'} || 0,
		'loaded_from_cache'				=> 0,
		'deleting'						=> 0,
		'deleted'						=> 0,
		'instantiated_relationships'	=> {},
		'tied_to_parent' 				=> 0,
		'should_be_committed'			=> 0,
		'should_be_deleted'				=> 0,
		'_deleted_relationships'		=> [],
		%init,
	);

};

=pod

=over 

=item _keyed_accessor

This is an accessor designed to be specified with add_attr. For example,

 Basset::User->add_attr(['user_group', '_keyed_accessor'], 'Basset::Group');

That would specify that if you have a user object, you can only specify values to your user_group
attribute that would successfully load into a Basset::Group object.

You can shut off the key validation if you're positive your value is valid

 $user->user_group($group_id);				#validates
 $user->user_group($group_id, 'valid');		#does not validate

Also note that the validation does not occur when the object is loading. It is assumed that if the key made it
into the database, it's valid.

=cut

=pod

=begin btest(_keyed_accessor)

=end btest(_keyed_accessor)

=cut

sub _keyed_accessor {
	my $self	= shift;
	my $prop	= shift;
	my $class	= shift;
	if (@_) {
		my $val = shift;
		my $valid = shift || 0;
		if (defined $val && ! $valid && ! $self->loading) {
			eval "use $class" unless $INC{$self->module_for_class($class)};
			my $obj = $class->exists($val);
			unless ($obj) {
				return $self->error("Cannot store value $val - object does not exist for $class", "BOP-48");
			}
		};
		return $self->$prop($val);
	} else {
		return $self->$prop();
	}
}

=pod

=item add_primarytable

add_primarytable is a class method that takes a hash as an argument, which is used as a constructor
call for a Basset::DB::Table object (or whatever you've specified as your table type object)

 __PACKAGE__->add_primarytable(
 	'name'				=> 'transaction',
 	'primary_column'	=> 'id',
 	'autogenerated'		=> 1,
 	'definition'		=> {
 		'id'				=> 'SQL_INTEGER',
 		'account'			=> 'SQL_INTEGER',
 		'paidby'			=> 'SQL_INTEGER',
 		'category'			=> 'SQL_INTEGER',
 		'day'				=> 'SQL_DATE',
 		'amount'			=> 'SQL_DECIMAL',
 		'description'		=> 'SQL_VARCHAR',
 	}
 );

See Basset::DB::Table for more information. This table is the primary table where the object's data is stored.

B<This method is deprecated. Use add_tables instead.>

=cut

=pod

=begin btest(add_primarytable)

=end btest(add_primarytable)

=cut

sub add_primarytable {
	my $class	= shift;

	my $table;

	my $create_attributes = 0;

	if (@_ == 1) {
		$table = $_[0];
	} else {

		my %init	= @_;

		$table	= $class->factory('type' => 'table', %init) or return;

		$create_attributes = $init{'create_attributes'};
	}

	#$class->primary_table($table);
	$class->tables([]);
	$class->add_tables($table);

	if ($create_attributes) {
		$class->auto_create_attributes;
	};

	return $table;
};

sub auto_create_attributes {
	my $class = shift;

	my $tables = shift || $class->tables
		or return $class->error("Cannot auto-create attributes w/o tables", "BOP-86");

	foreach my $table (@$tables) {
		my @attributes = keys %{$table->definition};
		foreach my $column (@attributes) {
			my $attribute = $table->alias_column($column);
			$class->add_attr($attribute) or return;
		};
	};

	return 1;

};

=pod

=item perl_read_translation

extra_select gives you the ability to select additional information from a table. And the definition gives you the
columns you have in that table. But, that information may not necessarily be in optimal form for your usage. Say, for example,
that your table isn't normalized, and you're embedding an array into a column, 'foo'. In your table, you may have:

 +----------+
 |    foo   |
 +----------+
 | A:B:C:D:E|
 +----------+

Now that delimited string is great for your database, but when you get it back into perl, it'd probably be nice to have
an actual array. That's where perl_read_translation comes into play.

 __PACKAGE__->perl_read_translation(
	{
		"foo" => 'reader_function'
	}
 );

When the object is being loaded, the function read_function will be called as a class method (whatever class of object
you are loading into) and passed 2 arguments - the name of the column being read (which is usually also the name of the
accessor into which the value is placed), and the value being read. In this case,
it would be:

 $class->reader_function('foo', 'A:B:C:D:E');

An example reader_function could be this:

 sub reader_function {
  my $class = shift;
  my $method = shift;
  my $value = shift;

  return [split(/:/, $value)];
 };

Be aware of the fact that you do not yet have an object, so you cannot call any object methods on anything. If you need
to alter an attributes value based upon the value of another attribute, you'll have to do things the old fashioned way
by subclassing load and zipping in there yourself. perl_read_translation is only useful for alterring individual snippets
of data.

The format of the hash is simply "method_name" => coderef.

If no re-write is specified for a given method, then the value that was read from the database will be returned.

It's important to note here that extra_select and db_write_translation are internal to Basset::DB::Table. You don't need
to do anything different in your code to use them. However, perl_read_translation and perl_write_translation are a different
matter. Basset::Object::Persistent respects the methods and uses them, but if you write your own load or commit methods, you'll
need to call either import_from_db or export_to_db, as appropriate.

=cut

=begin btest(perl_read_translation)

my $h = {'foo' => 'bar', 'baz' => 'yee'};
$test->ok($h, 'got hashref');
$test->is($h->{'foo'}, 'bar', 'foo is bar');
$test->is($h->{'baz'}, 'yee', 'baz is yee');
$test->is(__PACKAGE__->perl_read_translation($h), $h, "Set perl_read_translation");
$test->is(__PACKAGE__->perl_read_translation(), $h, 'reset perl_read_translation');

=end btest(perl_read_translation)

=cut

__PACKAGE__->add_trickle_class_attr('perl_read_translation', {});

=pod

=item perl_write_translation

The inverse function for perl_read_translation. Same reasoning - sometimes you need to change the form of your data
before writing it to your table. Using the earlier example, we'll assume you have an attribute 'foo' that contains an arrayref.
Your table is not normalized, so you want to store the value in a single column.

 __PACKAGE__->perl_write_translation(
 	{
 		'method' => {
 			'A' => 'writer_function'
 		}
 	}
 );

During commit, the function specified will be called as an object method, and handed two arguments - the name of the method
and the method's current value.

 $obj->writer_function('foo', [qw(A B C D E)]);

An example writer_function could be this:

 sub writer_fuction {
  my $self = shift;
  my $method = shift;
  my $value = shift;

  return join(":", @$value);
 };

Be aware of the fact that while methods defined in perl_write_translation are called as object methods, methods defined in
perl_read_translation are called as class methods. So it is recommended against using values from multiple attributes to serialize
into one attribute value, unless you really know what you're doing. Otherwise, it could be difficult to read the information
back out.

The format of the hash is simply "method_name" => {"query_type" => coderef}, where "query_type" follows the same rules
as those defined for db_write_translation.

If no re-write is specified for a given method, then the value that is presently contained in the method will be written
to the database.

It's important to note here that extra_select and db_write_translation are internal to Basset::DB::Table. You don't need
to do anything different in your code to use them. However, perl_read_translation and perl_write_translation are a different
matter. Basset::Object::Persistent respects the methods and uses them, but if you write your own load or commit methods, you'll
need to call either import_from_db or export_to_db, as appropriate.

=cut

=begin btest(perl_write_translation)

my $h = {'foo' => 'bar', 'baz' => 'yee'};
$test->ok($h, 'got hashref');
$test->is($h->{'foo'}, 'bar', 'foo is bar');
$test->is($h->{'baz'}, 'yee', 'baz is yee');
$test->is(__PACKAGE__->perl_write_translation($h), $h, "Set perl_write_translation");
$test->is(__PACKAGE__->perl_write_translation(), $h, 'reset perl_write_translation');

=end btest(perl_write_translation)

=cut

__PACKAGE__->add_trickle_class_attr('perl_write_translation', {});


=pod

=item export_to_db

This is a method you usually won't have to care about, unless you're writing your own low-level commit method to
take the place of the uber method in Basset::Object::Persistent.

Takes 3 arguments.

 $obj->export_to_db($method, $value, $type));

 $obj is the object being committed
 $method is the method being called
 $value is the value that is to be written to the databse
 $type is the query type, either 'I', 'U', 'R', 'D', or 'A'

This will return the appropriate value to write to the database. If there is no re-write defined for the
method in perl_write_translation, then the value $value will be returned. If there is a re-write, then that value
will be returned instead, depending upon the output of the re-write method.

Note that $method is not always necessarily a method.

This method uses the re-write values defined by perl_write_translation

=cut

=pod

=begin btest(export_to_db)

package Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1;
our @ISA = qw(__PACKAGE__);

sub perl1 {
	return 'perl1';
}

sub perl2 {
	return 'perl2';
}

sub perl3 {
	my $self = shift;
	my $meth = shift;
	return uc $self->$meth();
};

Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1->add_attr('able');
Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1->add_attr('baker');
Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1->add_attr('charlie');
Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1->add_attr('delta');

package __PACKAGE__;

my $o = __PACKAGE__->new();
$test->ok($o, "Created object");

my $so = Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1->new(
	'able' => 'able_value',
	'baker' => 'baker_value',
	'charlie' => 'charlie_value',
	'delta' => 'delta_value'
);
$test->ok($so, "Created object");

my $def = {
	'able' => 'SQL_INTEGER',
	'baker' => 'SQL_INTEGER',
	'charlie' => 'SQL_INTEGER',
	'delta' => 'SQL_INTEGER'
};

Basset::Test::Testing::__PACKAGE__::export_to_db::Subclass1->add_tables(
	__PACKAGE__->factory(
		'type' => 'table',
		'definition' => $def
	)
);

#$test->is($o->definition($def), $def, "Set definition");
#$test->is($o->definition, $def, "Got definition");

$test->is(scalar($so->export_to_db()), undef, 'Cannot export_to_db w/o type');
$test->is($so->errcode, 'BOP-92', 'proper error code for export_to_db (type)');
$test->is(scalar($so->export_to_db( 'I')), undef, 'Cannot export_to_db w/o method');
$test->is($so->errcode, 'BOP-93', 'proper error code for export_to_db (method)');

$test->is($so->export_to_db('I', 'able'), 'able_value', 'exports able upon insert');
$test->is($so->export_to_db('I', 'baker'), 'baker_value', 'exports baker upon insert');
$test->is($so->export_to_db('I', 'charlie'), 'charlie_value', 'exports charlie upon insert');
$test->is($so->export_to_db('I', 'delta'), 'delta_value', 'exports delta upon insert');

$test->is($so->export_to_db('U', 'able'), 'able_value', 'exports able upon update');
$test->is($so->export_to_db('U', 'baker'), 'baker_value', 'exports baker upon update');
$test->is($so->export_to_db('U', 'charlie'), 'charlie_value', 'exports charlie upon update');
$test->is($so->export_to_db('U', 'delta'), 'delta_value', 'exports delta upon update');

$test->is($so->export_to_db('R', 'able'), 'able_value', 'exports able upon replace');
$test->is($so->export_to_db('R', 'baker'), 'baker_value', 'exports baker upon replace');
$test->is($so->export_to_db('R', 'charlie'), 'charlie_value', 'exports charlie upon replace');
$test->is($so->export_to_db('R', 'delta'), 'delta_value', 'exports delta upon replace');

$test->is($so->export_to_db('D', 'able'), 'able_value', 'exports able upon delete');
$test->is($so->export_to_db('D', 'baker'), 'baker_value', 'exports baker upon delete');
$test->is($so->export_to_db('D', 'charlie'), 'charlie_value', 'exports charlie upon delete');
$test->is($so->export_to_db('D', 'delta'), 'delta_value', 'exports delta upon delete');

$test->is($so->export_to_db('S', 'able'), 'able_value', 'exports able upon select');
$test->is($so->export_to_db('S', 'baker'), 'baker_value', 'exports baker upon select');
$test->is($so->export_to_db('S', 'charlie'), 'charlie_value', 'exports charlie upon select');
$test->is($so->export_to_db('S', 'delta'), 'delta_value', 'exports delta upon select');

$test->is($so->export_to_db('A', 'able'), 'able_value', 'exports able upon all');
$test->is($so->export_to_db('A', 'baker'), 'baker_value', 'exports baker upon all');
$test->is($so->export_to_db('A', 'charlie'), 'charlie_value', 'exports charlie upon all');
$test->is($so->export_to_db('A', 'delta'), 'delta_value', 'exports delta upon all');

my $translator = {
	'able' => {
		'I' => 'perl1',
	},
	'baker' => {
		'U' => 'perl2',
	},
	'charlie' => {
		'R' => 'perl3',
	},
	'delta' => {
		'D' => 'perl1',
	},
};

$test->is($o->perl_write_translation($translator), $translator, 'set translator for perl_write_translation');

$test->is($so->export_to_db('I', 'able'), 'perl1', 'exports able upon insert');
$test->is($so->export_to_db('I', 'baker'), 'baker_value', 'exports baker upon insert');
$test->is($so->export_to_db('I', 'charlie'), 'charlie_value', 'exports charlie upon insert');
$test->is($so->export_to_db('I', 'delta'), 'delta_value', 'exports delta upon insert');

$test->is($so->export_to_db('U', 'able'), 'able_value', 'exports able upon update');
$test->is($so->export_to_db('U', 'baker'), 'perl2', 'exports baker upon update');
$test->is($so->export_to_db('U', 'charlie'), 'charlie_value', 'exports charlie upon update');
$test->is($so->export_to_db('U', 'delta'), 'delta_value', 'exports delta upon update');

$test->is($so->export_to_db('R', 'able'), 'able_value', 'exports able upon replace');
$test->is($so->export_to_db('R', 'baker'), 'baker_value', 'exports baker upon replace');
$test->is($so->export_to_db('R', 'charlie'), 'CHARLIE_VALUE', 'exports charlie upon replace');
$test->is($so->export_to_db('R', 'delta'), 'delta_value', 'exports delta upon replace');

$test->is($so->export_to_db('D', 'able'), 'able_value', 'exports able upon delete');
$test->is($so->export_to_db('D', 'baker'), 'baker_value', 'exports baker upon delete');
$test->is($so->export_to_db('D', 'charlie'), 'charlie_value', 'exports charlie upon delete');
$test->is($so->export_to_db('D', 'delta'), 'perl1', 'exports delta upon delete');

$test->is($so->export_to_db('S', 'able'), 'able_value', 'exports able upon select');
$test->is($so->export_to_db('S', 'baker'), 'baker_value', 'exports baker upon select');
$test->is($so->export_to_db('S', 'charlie'), 'charlie_value', 'exports charlie upon select');
$test->is($so->export_to_db('S', 'delta'), 'delta_value', 'exports delta upon select');

$test->is($so->export_to_db('A', 'able'), 'able_value', 'exports able upon all');
$test->is($so->export_to_db('A', 'baker'), 'baker_value', 'exports baker upon all');
$test->is($so->export_to_db('A', 'charlie'), 'charlie_value', 'exports charlie upon all');
$test->is($so->export_to_db('A', 'delta'), 'delta_value', 'exports delta upon all');

my $translator2 = 	{
		'able' => {
			'S' => 'perl1',
		},
		'baker' => {
			'A' => 'perl2'
		},
		'charlie' => {
			'I' => 'perl3',
			'A' => 'perl1',
		},
	};

$test->is($o->perl_write_translation($translator2), $translator2, 'set translator for perl_write_translation');

$test->is($so->export_to_db('I', 'able'), 'able_value', 'exports able upon insert');
$test->is($so->export_to_db('I', 'baker'), 'perl2', 'exports baker upon insert');
$test->is($so->export_to_db('I', 'charlie'), 'CHARLIE_VALUE', 'exports charlie upon insert');
$test->is($so->export_to_db('I', 'delta'), 'delta_value', 'exports delta upon insert');

$test->is($so->export_to_db('U', 'able'), 'able_value', 'exports able upon update');
$test->is($so->export_to_db('U', 'baker'), 'perl2', 'exports baker upon update');
$test->is($so->export_to_db('U', 'charlie'), 'perl1', 'exports charlie upon update');
$test->is($so->export_to_db('U', 'delta'), 'delta_value', 'exports delta upon update');

$test->is($so->export_to_db('R', 'able'), 'able_value', 'exports able upon replace');
$test->is($so->export_to_db('R', 'baker'), 'perl2', 'exports baker upon replace');
$test->is($so->export_to_db('R', 'charlie'), 'perl1', 'exports charlie upon replace');
$test->is($so->export_to_db('R', 'delta'), 'delta_value', 'exports delta upon replace');

$test->is($so->export_to_db('D', 'able'), 'able_value', 'exports able upon delete');
$test->is($so->export_to_db('D', 'baker'), 'perl2', 'exports baker upon delete');
$test->is($so->export_to_db('D', 'charlie'), 'perl1', 'exports charlie upon delete');
$test->is($so->export_to_db('D', 'delta'), 'delta_value', 'exports delta upon delete');

$test->is($so->export_to_db('S', 'able'), 'perl1', 'exports able upon select');
$test->is($so->export_to_db('S', 'baker'), 'perl2', 'exports baker upon select');
$test->is($so->export_to_db('S', 'charlie'), 'perl1', 'exports charlie upon select');
$test->is($so->export_to_db('S', 'delta'), 'delta_value', 'exports delta upon select');

$test->is($so->export_to_db('A', 'able'), 'able_value', 'exports able upon all');
$test->is($so->export_to_db('A', 'baker'), 'perl2', 'exports baker upon all');
$test->is($so->export_to_db('A', 'charlie'), 'perl1', 'exports charlie upon all');
$test->is($so->export_to_db('A', 'delta'), 'delta_value', 'exports delta upon all');

=end btest(export_to_db)

=cut

sub export_to_db {
	my $self	= shift;
	my $type	= shift or return $self->error("Cannot export_to_db w/o type", "BOP-92");

	my @methods	= @_ or return $self->error("Cannot export_to_db w/o method", "BOP-93");

	my $perl_write_translation = $self->perl_write_translation;

	$self->wipe_errors;

	foreach my $method (@methods) {

		if (defined $perl_write_translation->{$method}) {

			if (defined $perl_write_translation->{$method}->{$type}){
				my $translator =  $perl_write_translation->{$method}->{$type};
				$method = $self->$translator($method);
			}
			elsif (defined $perl_write_translation->{$method}->{'A'}){
				my $translator =  $perl_write_translation->{$method}->{'A'};
				$method = $self->$translator($method);
			} else {
				$method = $self->$method();
			}
		} else {
			$method = $self->$method();
		}

		my $errcode = $self->errcode;
		return if defined $errcode && $errcode eq 'BOP-95';	#cannot export - no value for key!
	}

	return wantarray ? @methods : $methods[0];

	#return $value;

};

=item import_from_db

This is a method you usually won't have to care about, unless you're writing your own low-level load method to
take the place of the uber method in Basset::Object::Persistent.

Takes 4 arguments.

 $class->import_from_db($method, $value);

 $class is the class of the object being created
 $method is the method being called
 $value is the value that was read from the databse

This will return the appropriate value to hand into the attribute. If there is no re-write defined for the
method in perl_read_translation, then the value $value will be returned. If there is a re-write, then that value
will be returned instead, depending upon the output of the re-write method.

Note that $method is not always necessarily a method.

This is associated with the values defined in perl_read_translation

=cut

=pod

=begin btest(import_from_db)

my $subclass = 'Basset::Test::Testing::__PACKAGE__::import_from_db::Subclass1';

package Basset::Test::Testing::__PACKAGE__::import_from_db::Subclass1;
our @ISA = qw(__PACKAGE__);

sub perl1 {
	return 'perl1';
}

sub perl2 {
	return 'perl2';
}

sub perl3 {
	return uc $_[2];
};

package __PACKAGE__;

my $o = __PACKAGE__->new();
$test->ok($o, "Created object");

my $def = {
	'able' => 'SQL_INTEGER',
	'baker' => 'SQL_INTEGER',
	'charlie' => 'SQL_INTEGER',
	'delta' => 'SQL_INTEGER'
};

$subclass->add_tables(
	__PACKAGE__->factory(
		'type' => 'table',
		'definition' => $def
	)
);

#$test->is($o->definition($def), $def, "Set definition");
#$test->is($o->definition, $def, "Got definition");

$test->is(scalar($subclass->import_from_db()), undef, 'Cannot import_from_db w/o class');
$test->is($subclass->errcode, 'BOP-94', 'proper error code for import_from_db (method)');

$test->is($subclass->import_from_db('able', 'able_value'), 'able_value', 'imports able');
$test->is($subclass->import_from_db('baker', 'baker_value'), 'baker_value', 'imports baker');
$test->is($subclass->import_from_db('charlie', 'charlie_value'), 'charlie_value', 'imports charlie');
$test->is($subclass->import_from_db('delta', 'delta_value'), 'delta_value', 'imports delta');

$test->is($subclass->import_from_db('able', undef), undef, 'imports undef value');

my $translator = {
	'able' => 'perl1',
	'baker' => 'perl2',
	'charlie' => 'perl3',
};

$test->is($o->perl_read_translation($translator), $translator, 'set perl_read_translation');

$test->is($subclass->import_from_db('able', 'able_value'), 'perl1', 'imports able');
$test->is($subclass->import_from_db('baker', 'baker_value'), 'perl2', 'imports baker');
$test->is($subclass->import_from_db('charlie', 'charlie_value'), 'CHARLIE_VALUE', 'imports charlie');
$test->is($subclass->import_from_db('delta', 'delta_value'), 'delta_value', 'imports delta');

$test->is($subclass->import_from_db('able', undef), 'perl1', 'imports translated undef value');
$test->is($subclass->import_from_db('delta', undef), undef, 'imports translated undef value');

=end btest(import_from_db)

=cut

sub import_from_db {
	my $class	= shift;
	my $method	= shift or return $class->error("Cannot import_from_db w/o method", "BOP-94");
	my $value	= shift;

	if (my $translator = $class->perl_read_translation->{$method}) {
		return $class->$translator($method, $value);
	}
	else {
		return $value;
	};

};

=pod

=item add_tables

add_tables is a class method that takes a list of tables as its arguments, which are the tables
associated with this object when it is stored to the database.

 __PACKAGE__->add_primarytable(
 	__PACKAGE__->factory(
 		'type'			=> 'table',
		'name'				=> 'transaction',
		'primary_column'	=> 'id',
		'autogenerated'		=> 1,
		'definition'		=> {
			'id'				=> 'SQL_INTEGER',
			'account'			=> 'SQL_INTEGER',
			'paidby'			=> 'SQL_INTEGER',
			'category'			=> 'SQL_INTEGER',
			'day'				=> 'SQL_DATE',
			'amount'			=> 'SQL_DECIMAL',
			'description'		=> 'SQL_VARCHAR',
		}
	)
 );

See Basset::DB::Table for more information.

=cut

sub add_tables {
	my $class = shift;

	return $class->error("Cannot add table w/o tables", "BOP-85") unless @_;

	my @tables = @{$class->tables};

	while (my $table = shift @_) {
		push @tables, $table;
	}

	$class->tables(\@tables);

	return 1;
}


=pod

=begin btest(add_tables)

=end btest(add_tables)

=cut

=pod

=item primary_table

Returns the first table associated with the given object.

=cut

sub primary_table {
	return shift->tables->[0];
};

=pod

=begin btest(primary_table)

=end btest(primary_table)

=cut

=pod

=item relationships

This is a class attribute that internally stores the relationships used by this class. Specify new relationships with has_a
or has_many.

=cut

=begin btest(relationships)

=end btest(relationships)

=cut

__PACKAGE__->add_trickle_class_attr('relationships', {});

=pod

=item should_be_deleted

This is used to flag an object that has been auto-vivified and is tied to a parent object.  You should rarely need
to set, access, or worry about this flag directly. 

=cut

=pod

=begin btest(should_be_deleted)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->should_be_deleted), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->should_be_deleted), 0, 'should_be_deleted is 0');
$test->is($o->should_be_deleted('abc'), 'abc', 'set should_be_deleted to abc');
$test->is($o->should_be_deleted(), 'abc', 'read value of should_be_deleted - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->should_be_deleted($h), $h, 'set should_be_deleted to hashref');
$test->is($o->should_be_deleted(), $h, 'read value of should_be_deleted  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->should_be_deleted($a), $a, 'set should_be_deleted to arrayref');
$test->is($o->should_be_deleted(), $a, 'read value of should_be_deleted  - arrayref');

=end btest(should_be_deleted)

=cut

__PACKAGE__->add_attr('should_be_deleted');

=pod

=item should_be_committed

This is used to flag an object that has been auto-vivified and is tied to a parent object.  You should rarely need
to set, access, or worry about this flag directly. 

=cut

=pod

=begin btest(should_be_committed)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->should_be_committed), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(scalar($o->should_be_committed), 0, 'should_be_committed is zero');
$test->is($o->should_be_committed('abc'), 'abc', 'set should_be_committed to abc');
$test->is($o->should_be_committed(), 'abc', 'read value of should_be_committed - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->should_be_committed($h), $h, 'set should_be_committed to hashref');
$test->is($o->should_be_committed(), $h, 'read value of should_be_committed  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->should_be_committed($a), $a, 'set should_be_committed to arrayref');
$test->is($o->should_be_committed(), $a, 'read value of should_be_committed  - arrayref');

=end btest(should_be_committed)

=cut

__PACKAGE__->add_attr('should_be_committed');

__PACKAGE__->add_attr('tied_to_parent');

=pod

=item instantiated_relationships

Internal hash that keeps track of which relationships for a given object have been instantiated. Check for instantiation via the
is_instantiated method instead.

=cut

=pod

=begin btest(instantiated_relationships)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->instantiated_relationships), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(ref(scalar($o->instantiated_relationships)), 'HASH', 'instantiated_relationships is hashref');
$test->is($o->instantiated_relationships('abc'), 'abc', 'set instantiated_relationships to abc');
$test->is($o->instantiated_relationships(), 'abc', 'read value of instantiated_relationships - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->instantiated_relationships($h), $h, 'set instantiated_relationships to hashref');
$test->is($o->instantiated_relationships(), $h, 'read value of instantiated_relationships  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->instantiated_relationships($a), $a, 'set instantiated_relationships to arrayref');
$test->is($o->instantiated_relationships(), $a, 'read value of instantiated_relationships  - arrayref');

=end btest(instantiated_relationships)

=cut

__PACKAGE__->add_attr('instantiated_relationships');

=pod

=item cental_load_cache

if the use_central_load_cache parameter is set in the conf file, then objects will use a centralized loading cache, stored here.
This is internal only.

=cut

=pod

=begin btest(cental_load_cache)

=end btest(cental_load_cache)

=cut

__PACKAGE__->add_class_attr('central_load_cache', {});

=pod

=item _deleted_relationships

Internal method. Keeps track of instantiated associated objects that were subsequently deleted. No looky, no touchy.

=cut

=pod

=begin btest(_deleted_relationships)

my $o = __PACKAGE__->new();
$test->ok($o, "Got object");
$test->is(scalar(__PACKAGE__->_deleted_relationships), undef, "could not call object method as class method");
$test->is(__PACKAGE__->errcode, "BO-08", "proper error code");
$test->is(ref(scalar($o->_deleted_relationships)), 'ARRAY', '_deleted_relationships is arrayref');
$test->is($o->_deleted_relationships('abc'), 'abc', 'set _deleted_relationships to abc');
$test->is($o->_deleted_relationships(), 'abc', 'read value of _deleted_relationships - abc');
my $h = {};
$test->ok($h, 'got hashref');
$test->is($o->_deleted_relationships($h), $h, 'set _deleted_relationships to hashref');
$test->is($o->_deleted_relationships(), $h, 'read value of _deleted_relationships  - hashref');
my $a = [];
$test->ok($a, 'got arrayref');
$test->is($o->_deleted_relationships($a), $a, 'set _deleted_relationships to arrayref');
$test->is($o->_deleted_relationships(), $a, 'read value of _deleted_relationships  - arrayref');

=end btest(_deleted_relationships)

=cut

__PACKAGE__->add_attr('_deleted_relationships');

=pod

=item is_instantiated

Boolean operator. Given an attribute, returns true if it is an associated attribute and has been instantiated, false if it has not been.

=cut

=pod

=begin btest(is_instantiated)

=end btest(is_instantiated)

=cut

sub is_instantiated {
	my $self = shift;
	my $prop = shift or return $self->error("Cannot determine if is instantiated w/o prop", "BOP-71");

	$prop = $self->deprivatize($prop);

	return $self->instantiated_relationships->{$prop} || 0;


	my $val = $self->$prop();

	if (ref $val eq 'HASH') {
		return keys %$val;
	} elsif (ref $val eq 'ARRAY') {
		return @$val;
	} else {
		return ref $val;
	};	
}

=pod

=item instantiate

In the abstract, this is simple. Takes an attribute and an optional set of clauses, then instantiates that object.

 $obj->instantiate('foo');

Now $obj->foo will contain whatever the instantiated list of information is, as defined when it was set up with the has_a or
has_many call. Alternatively, you can pass in a set of clauses to restrict the objects loaded.

 $obj->instantiate('foo', {
 	'where' => 'status_id = 1'
 });

Will instantiate the 'foo' attribute only with the objects that have a status_id of 1, anything else will simply not be loaded.

Note that you should only instantiate an attribute that is defined has having an instantiating parameter of 'manual' (as opposed 
to 'lazy' ) and this is due to encapsulation reasons.

Lazy objects are not instantiated until the attribute holding them is accessed, but then they are instantiated automatically.

Manual objects are the ones that you want to worry about. In those cases, the instantiate method is basically a shortcut to insulate you
from needing to take extra steps and know the class involved.

Say that a user has_many classes. You could do this:

 use Some::Class;
 use Some::User;

 my $user = Some::User->load(1);
 my $classes = Some::Class->load_where('user_id' => $user->id);

or this

 use Some::User;

 my $user = Some::User->load(1);
 my $classes = $user->instantiate('classes');

=cut

=pod

=begin btest(instantiate)

=end btest(instantiate)

=cut

sub instantiate {

	my $self					= shift;
	my $prop					= shift or return $self->error("Cannot instantiate w/o attribute", "BOP-72");
	my $clauses					= shift || {};
	my @values					= @_;

	if ($self->is_instantiated($prop)) {
		$self->notify("warnings", "object already instantiated");
	#	return $self->$prop();
	};

	my $relationships = $self->relationships;

	my $relationship_data = $relationships->{$prop}
		or return $self->error("Cannot instantiate $prop : not relationship", "BOP-73");

	my $table = $relationship_data->{'table'};
	my $fclass = $relationship_data->{'class'};
	
	{
		local $@ = undef;
		eval "use $fclass" unless $INC{$self->module_for_class($fclass)};
		return $self->error("Cannot have many : cannot load class $fclass : $@", "BOP-79") if $@;
	};

	my (@foreign_cols, @referencing_cols);


	{
		my @tmp = $self->relationship_columns($prop) or return;
		@referencing_cols = @{$tmp[0]};
		@foreign_cols = @{$tmp[1]};
	}

	return $self->error("Cannot instantiate - parent and child tables do not reference each other", "BOP-91")
		unless @foreign_cols && @referencing_cols;

	foreach my $col (@referencing_cols) {
		my $attr = $table->alias_column($col);
		if (defined $relationships->{$attr} && $relationships->{$attr}->{'instantiating'} eq 'lazy') {
			$attr = $self->privatize($attr);
		};
		push @values, $self->$attr();
	}

	my $where = join(' AND ', map {"$_ = ?"} @foreign_cols);

	if ($clauses->{'where'}) {
		$clauses->{'where'} .= " AND ($where)";
	} else {
		$clauses->{'where'} = $where;
	}

	my $instantiated = $clauses->{'value'} || $relationship_data->{'class'}->load_all(
		{
			%$clauses,
			'singleton' => $relationship_data->{'singleton'},
			'key'		=> $relationship_data->{'key'},
		},
		@values
	) or return $self->error($relationship_data->{'class'}->errvals);

	$self->$prop($instantiated, 'breaker');

	$self->instantiated_relationships->{$prop}++;

	# Now the fun begins. If it's a singleton, then after one object has has this attribute
	# instantiated, we re-wire the class so they all access it through this new method.	
	if ($relationship_data->{'singleton'}) {

		no strict 'refs';
		no warnings;

		foreach my $method (@referencing_cols) {

			#we are the class
			my $class = $self->pkg;
	
			my @parents = reverse @{$class->isa_path};

			# however, there's an edge case - if we're a subclass trying to instantiate. Then everything
			# needs to happen in the parent.
			foreach my $parent (@parents) {
				if (*{$parent . "::$method"}{'CODE'}) {
					$class = $parent;
					last;
				}
			}

			my $private = $class->privatize("private_$method");

			unless ($class->can($private)) {

				if (*{$class . "::$method"}{'CODE'}) {
					*{$class . "::$private"} = *{$class . "::$method"}{'CODE'};
				} else {
					$class->add_attr($private);
				}

				my $referenced = $table->nonqualified_name($table->referenced_column($method));

				*{$class . "::$method"} = sub {
					my $self	= shift;

					if (@_) {
						#$self->uninstantiate($prop);
						my $ret = $self->$private(@_);
						$self->$prop(undef);
						$self->instantiate($prop) if $self->is_instantiated($prop);
						return $ret;
					} else {
						if ($self->is_instantiated($prop)) {
							my $object = $self->$prop();

							if (! defined $object || $object->deleted) {
								return;
							} else {
								my $return = $object->$referenced();
								return defined $return
									? $return
									: $self->error("No key for object (->$prop) (object method $referenced)", "BOP-95");
							}
						} else {
							return $self->$private(@_);
						};
					}
				}
			}

		}
	} #end if singleton

	return $instantiated;

};


=pod

=item uninstantiate

=cut


sub uninstantiate {
	my $self = shift;
	my $prop = shift or return $self->error("Cannot uninstantiate w/o prop", "BOP-96");

	delete $self->instantiated_relationships->{$prop};	

	$self->$prop(undef);

	return 1;
}

=pod

=begin btest(uninstantiate)

=end btest(uninstantiate)

=cut



=pod

=item has_a

has_a defines relationship between objects. "An object 'has_a' different object". The has_a method is simply a wrapper around
has_many, passing in a key of undef and setting the singleton flag to 1.

=cut

=pod

=begin btest(has_a)

=end btest(has_a)

=cut

sub has_a {
	my $class 		= shift;
	my $attribute	= shift or return $class->error("Cannot have many w/o attribute", "BOP-75");
	my $fclass		= shift or return $class->error("Cannot have many w/o class", "BOP-76");

	my $init		= shift || {};

	return $class->has_many(
		$attribute => $fclass,
		{
			%$init,
			'key'		=> undef,
			'singleton' => 1,
		}
	);
};

=pod

=item _instantiating_accessor

If a relationship is defined in has_many with instantiating -> lazy, then the associated objects will be populated automagically, but not
until the attribute is accessed. _instantiating_accessor internally handles all of that.

=cut

=pod

=begin btest(_instantiating_accessor)

=end btest(_instantiating_accessor)

=cut

sub _instantiating_accessor {
	my $self = shift;
	my $prop = shift;
	my $instantiating_method = shift;

	return $self->error("Not a class attribute", "BO-08") unless ref $self;

	#upon mutation, we just return what we set it to.
	if (@_) {
		my $new_val = shift;
		my $breaker = shift || 0;
		my $relationship_data = $self->relationships->{$instantiating_method};

		if ($breaker || ! $relationship_data->{'singleton'}) {
			$self->$prop($new_val) || return;
		} else {
			$self->instantiate(
				$instantiating_method,
				{
					'value' => $new_val
				}
			) || return;
		}

		return $new_val;
	}
	elsif ($self->is_instantiated($prop)) {
		return $self->$prop();
	} else {
		my $relationship_data = $self->relationships->{$instantiating_method};
		my $clauses = {
			'tied_to_parent' => $relationship_data->{'accessibility'} eq 'private'
				? 1
				: 0,
		};

		return $self->instantiate($instantiating_method, $clauses);
	}

};

sub _verifying_instantiating_accessor {
	my $self = shift;
	my $prop = shift;
	my $instantiating_method = shift;

	if (@_) {
		my $new_val = shift;
		my $breaker = shift || 0;
		if ($breaker) {
			$self->$prop($new_val) || return;
		} else {
			$self->instantiate(
				$instantiating_method,
				{
					'value' => $new_val,
				}
			) || return;
		}
		return $new_val;
	} elsif ($self->is_instantiated($prop)) {
		return $self->$prop(@_);
	} else {
		return $self->error("Cannot access $instantiating_method : not yet instantiated", "BOP-97");
	};
}

=pod

=item has_many

All right, now we finally get to define relationships. The has_many parameter needs two values, the attribute and its class.

 Some::Class->has_many(
  'wibbles' => 'Some::Other::Class'
 );

That will create an accessor for 'wibbles' and associate it with "Some::Other::Class". You could then instantiate it from an object:

 $someObject->instantiate('wibbles');

And populate all of your wibbles data.

has_many takes an optional (but recommended!) 3rd argument, the options hash. Several options are supported.

=over 8

=item key

If loading up multiple associated objects (a cat "has_many" paws), then they will by default appear in an arbitrarily ordered arrayref
containing all of the data. But, there are times when you want to load up all of the data and quickly associate objects associated with
particular attributes. In that case, pass in the key parameter.

 Some::Class->has_many(
  'wibbles' => 'Some::Other::Class',
  {
  	'key' => 'foo'
  }
 );

Then your data will be populated into a hashref, with the associated objects' "foo" attributes serving as their keys.

=item instantiating

This item should be one of 2 values - 'manual' or 'lazy'

 Some::Class->has_many(
  'wibbles' => 'Some::Other::Class',
  {
  	'instantiating' => 'manual'
  }
 );

=over 12

=item lazy

lazily instantiated objects will automatically come into being when the associated attribute of the owning object is accessed for
the first time. This is the default.

=item manual

manually instantiated objects will never automatically come into being. you will have to explicitly call 'instantiate' yourself.

=back

=item singleton

If the singleton flag is set, then it is known that this attribute is associated with a single other object, and consequently will
just hold a reference to that object itself (not in an arrayref or hashref)

 Some::Class->has_many(
  'wibbles' => 'Some::Other::Class',
  {
  	'singleton' => 1
  }
 );

=item clauses

the clauses hashref is the same sort of clauses hashref to be handed into the loader. in fact, it is handed into the loader when
the associated objects are instantiated.

 Some::Class->has_many(
  'wibbles' => 'Some::Other::Class',
  {
  	'clauses' => {
  		'where' => 'status_id = 1'
  	}
  }
 );

=item accessibility

This governs encapsulation. Associating objects with other objects is good, but you don't always want the user of the class to know
that other objects are involved. You should set the accessibility flag to 'private' if the associated object will never be accessed outside
of the class that defines it. These classes should probably be inlined (or at least privatedly declared inside another package)

 Some::Class->has_many(
  'wibbles' => 'Some::Other::Class',
  {
  	'accessibility' => 'private'
  }
 );

Default value is 'public';

Making an associated object private shuts off its ability to commit or delete itself. its changes only go in when its parent object
is committed or deleted.

=item relationship_key

Sometimes, you may have an object that references two objects in a different table. You may know
that every Car has a primary_driver and a secondary_driver. So you define your relationship:

 Car->primary_table->references(
 	{
 		'primary_driver' => 'driver.id',
 		'secondary_driver' => 'driver.id'
 	}
 );

But you wouldn't be able to establith relationships for those items, since instantiate would
try to load an object using both of those values.

 Car->has_a(
 	'primary_driver' => 'Driver'
 );

Would try to load where driver.id = car.primary_driver_id and driver.id = car.secondary_driver_id.
So it would only work in the edge case when they're the same driver, which is not your intent.

The solution is to explicitly define which key you'd like to join on.

 Car->has_a(
 	'primary_driver' => 'Driver',
 	{
 		'relationship_key' => 'primary_driver'
 	}
 );

  Car->has_a(
 	'secondary_driver' => 'Driver',
 	{
 		'relationship_key' => 'secondary_driver'
 	}
 );

=item transform

See the 'transform' flag in the load_all method for info.

=item foreign_has_a

If you have a has_many relationship, then presumably your foreign class has a has_a relationship
with you. You can declare that relationship here. This has two advantages.

1) It allows you to autmatically populate the foreign object's has_a property with yourself
upon setting the has_many.

2) If the foreign class references you with multiple columns (say, obj_id_1 and obj_id_2), then
the foreign has_a has defined the relationship key to use. Specifying the foreign_has_a here
uses those same relationship keys.

=back

=cut

=pod

=begin btest(has_many)

=end btest(has_many)

=cut

sub has_many {
	my $class 			= shift;

	my $attribute		= shift or return $class->error("Cannot have many w/o attribute", "BOP-77");
	my $fclass			= shift or return $class->error("Cannot have many w/o class", "BOP-78");

	my $init			= shift;

	my $key				= $init->{'key'};
	my $instantiating	= $init->{'instantiating'} || 'lazy';
	my $singleton		= $init->{'singleton'} || 0;
	my $clauses			= $init->{'clauses'} || {};
	my $accessibility	= $init->{'accessibility'} || 'public';
	my $table			= $init->{'table'} || $class->primary_table;
	my $relationship_key= $init->{'relationship_key'};
	my $transform		= $init->{'transform'};
	my $foreign_has_a	= $init->{'foreign_has_a'};

	#{
	#	local $@ = undef;
	#	eval "use $fclass" unless $INC{$class->module_for_class($fclass)};
	#	return $class->error("Cannot have many : cannot load class $fclass : $@", "BOP-79") if $@;
	#};

	if ($instantiating eq 'lazy') {
		$class->add_attr([$attribute, '_instantiating_accessor'], $attribute);
	} else {
		 $class->add_attr([$attribute, '_verifying_instantiating_accessor'], $attribute);
		#$class->add_attr($attribute);	
	}

	#need to copy out and reset so that it gets properly trickled.
	my %many = %{$class->relationships};

	$many{$attribute} = {
		'class'				=> $fclass,
		'key'				=> $key,
		'singleton'			=> $singleton,
		'instantiating'		=> $instantiating,
		'clauses'			=> $clauses,
		'accessibility'		=> $accessibility,
		'table'				=> $table,
		'relationship_key'	=> $relationship_key,
		'transform'			=> $transform,
		'foreign_has_a'		=> $foreign_has_a,
	};

	$class->relationships(\%many);


	unless ($singleton) {
		$class->create_add_to_method($attribute) or return;
	};

	return 1;
}

=pod

=item create_add_to_method

Mainly used internally when setting up has_many relationships. When you create a has_many relationship,
you automatically get an add_to* method.

 Some::Store->has_many(
 	'bagels' => 'Some::Bagel::Class'
 );

 my $store->add_to_bagels(
 	'type' => 'chocolate chip',
 	'id' => '17738'
 );

Is equivalent to:

 my $bagel = Some::Bagel::Class->new(
 	'type' => 'chocolate chip',
 	'id' => 

=cut

sub create_add_to_method {
	my $self = shift;
	my $attribute = shift or return $self->error("Cannot create add_to_* method w/o attribute", "BOP-87");

	my $relationship_data = $self->relationships->{$attribute}
		or return $self->error("Cannot create_add_to_method for $attribute : not relationship", "BOP-88");

	no strict 'refs';

	my $class = $self->pkg;

	*{$class . "::add_to_$attribute"} = sub {
		my $self = shift;

		my $obj;

		if (@_ == 1) {
			$obj = shift;
		} else {
			my %init = @_;

			my $table = $relationship_data->{'table'};

			my @tmp = $self->relationship_columns($attribute) or return;
			my @referencing_cols = @{$tmp[0]};
			my @foreign_cols = @{$tmp[1]};

			foreach my $col (@referencing_cols) {
				my $foreign = $table->nonqualified_name(shift @foreign_cols);
				my $attr = $table->alias_column($col);
				$init{$foreign} = $self->$attr();
			}

			$obj = $relationship_data->{'class'}->new(%init) or 
				return $self->error($relationship_data->{'class'}->errvals);
		}

		if (my $key = $relationship_data->{'key'}) {
			return $self->error("Cannot add new object, missing value for $key", "BOP-90")
				unless defined $obj->$key();
			$self->$attribute()->{$obj->$key()} = $obj;
		} else {
			push @{$self->$attribute()}, $obj
		}

		if (my $foreign_method = $relationship_data->{'foreign_has_a'}) {
			$obj->$foreign_method($self) || return $self->error($obj->errvals);
		}

		return $obj;
	};

};

=pod

=begin btest(create_add_to_method)

=end btest(create_add_to_method)

=cut


=pod

=item commit_relationships

Used internally to commit all associated objects for a given object, only used for private objects

 $obj->commit_relationships

=cut

=pod

=begin btest(commit_relationships)

=end btest(commit_relationships)

=cut

sub commit_relationships {
	my $self = shift;
	my $singletons = $_[0] eq 'singletons' ? 1 : 0;

	#$self->begin() or return;

	my $instantiated = $self->instantiated_relationships;

	return 1 unless keys %$instantiated;

	my $seen = {};

	my $deleted_relationships = $self->_deleted_relationships;

	foreach my $deleted_obj (@$deleted_relationships) {
		$deleted_obj->should_be_deleted(2);
		$deleted_obj->delete or return $self->error($deleted_obj->errvals);
	}

	$self->_deleted_relationships([]) if @$deleted_relationships;

	my $relationships = $self->relationships;

	foreach my $rel (keys %$instantiated) {

		next if $seen->{$rel}++;
		my $relationship_data = $relationships->{$rel};

		next if $relationship_data->{'accessibility'} ne 'private'
			|| $relationship_data->{'singleton'} != $singletons;

		my @relationships = ();
		if ($relationship_data->{'singleton'}) {
			@relationships = ($self->$rel());
		} else {
			if ($relationship_data->{'key'}) {
				@relationships = values %{$self->$rel};
			} else {
				@relationships = @{$self->$rel};
			}
		}

		foreach my $obj (@relationships) {

			my $table = $relationship_data->{'table'};

			my @tmp = $self->relationship_columns($rel) or return;
			my @referencing_cols = @{$tmp[0]};
			my @foreign_cols = @{$tmp[1]};

			foreach my $col (@referencing_cols) {
				my $foreign = $table->nonqualified_name(shift @foreign_cols);
				my $attr = $table->alias_column($col);
				$obj->$foreign($self->$attr());
			}

			$obj->should_be_committed(1);

			if ($obj->commit) {
				$obj->should_be_committed(0);
			} else {
				$obj->should_be_committed(0);
				return $self->error($obj->errvals);
			};

		}	#end foreach @relationships
	}	#end foreach instantiated

	#$self->end() or return;

	return 1;
}

=pod

=item delete_relationships

Used internally to delete all associated objects for a given object.

 $obj->delete_relationships

only used for private objects

=cut

=pod

=begin btest(delete_relationships)

=end btest(delete_relationships)

=cut

sub delete_relationships {
	my $self = shift;

	#$self->begin() or return;

	my $instantiated = $self->instantiated_relationships;

	my $deleted_relationships = $self->_deleted_relationships;

	foreach my $deleted_obj (@$deleted_relationships) {
		$deleted_obj->should_be_deleted(2);
		$deleted_obj->delete or return $self->error($deleted_obj->errvals);
	}

	my $seen = {};

	my $relationships = $self->relationships;

	foreach my $relationship (keys %$relationships) {

		my $relationship_data = $relationships->{$relationship};

		next unless $relationship_data->{'accessibility'} eq 'private';

		$self->instantiate($relationship);

		my @relationships = ();	

		if ($relationship_data->{'singleton'}) {
			@relationships = ($self->$relationship());
		} elsif ($relationship_data->{'key'}) {
			@relationships = values %{$self->$relationship()};
		} else {
			@relationships = @{$self->$relationship()};
		}

		foreach my $obj (@relationships) {
			$obj->should_be_deleted(1);
			if ($obj->delete) {
				$obj->should_be_deleted(0);
			} else {
				$obj->should_be_deleted(0);
				return $self->error($obj->errvals);
			}
		}
	}

	return 1;


	foreach my $rel (keys %$instantiated) {
		next if $seen->{$rel}++;
		my $relationship_data = $relationships->{$rel};

		next unless $relationship_data->{'accessibility'} eq 'private';

		my @relationships = ();
		if ($relationship_data->{'singleton'}) {
			@relationships = ($self->$rel());
		} else {
			if ($relationship_data->{'key'}) {
				@relationships = values %{$self->$rel()};
			} else {
				@relationships = @{$self->$rel()};
			}
		}

		foreach my $obj (@relationships) {

			$obj->should_be_deleted(1);
			if ($obj->delete) {
				$obj->should_be_deleted(0);
			} else {
				$obj->should_be_deleted(0);
				return $self->error($obj->errvals);
			};

		}	#end foreach @relationships
	}	#end foreach instantiated

	#$self->end() or return;

	return 1;
}

=pod

=item is_relationship

Given an attribute, returns true if it is a relationship, false if not.

 if ($obj->is_relationship("some_attribute")) {
 	#do interesting thing
 }

=cut

=pod

=begin btest(is_relationship)

=end btest(is_relationship)

=cut

sub is_relationship {
	my $self = shift;
	my $attribute = shift or return $self->error("Cannot determine is_relationship w/o attribute", "BOP-82");

	return $self->relationships->{$attribute} ? 1 : 0;
};

=pod

=item relationship_columns

Takes a relationship as an argument, returns a list of two arrayrefs - the referencing columns (yours)
and the foreign columns (columns in the foreign table)

 my ($referencing, $foreign) = $self->relationship_columns($relationship);

I can't think of a reason you'd ever want to call this directly.

=cut

sub relationship_columns {
	my $self = shift;
	my $prop = shift or return $self->error("Cannot get relationship_columns w/o relationship", "BOP-98");

	my $relationships = $self->relationships;

	my $relationship_data = $relationships->{$prop}
		or return $self->error("Cannot get relationship_columns for $prop : not relationship", "BOP-99");

	my $table = $relationship_data->{'table'};
	my $ftable = $relationship_data->{'class'}->primary_table;

	if (ref $table eq 'ARRAY') {
		($table, $ftable) = @$table;
	};

	my (@foreign_cols, @referencing_cols);

	if ($relationship_data->{'foreign_has_a'}) {
		my $fclass = $relationship_data->{'class'};
		my $foreign_relationship_method = $relationship_data->{'foreign_has_a'};
		my $foreign_relationship = $fclass->relationships->{$foreign_relationship_method}
			or return $self->error($fclass->errvals);

		#we flip the columns! their foreign are our referencing and vice-versa.
		my ($foreign_cols, $referencing_cols) = $fclass->relationship_columns($foreign_relationship_method)
			or return $self->error($fclass->errvals);

		@foreign_cols = @$foreign_cols;
		@referencing_cols = @$referencing_cols;
	}
	elsif ($relationship_data->{'relationship_key'}) {
		@referencing_cols = ref $relationship_data->{'relationship_key'} eq 'ARRAY'
			? @{$relationship_data->{'relationship_key'}}
			: $relationship_data->{'relationship_key'};
		if (ref $referencing_cols[0] eq 'ARRAY') {
			@foreign_cols = @{$referencing_cols[1]};
			@referencing_cols = @{$referencing_cols[0]};
		} else {
			@foreign_cols = map {$table->referenced_column($_)} @referencing_cols;		
		}
	}
	elsif ($relationship_data->{'singleton'}) {
		@referencing_cols = $table->foreign_cols($ftable);
		@foreign_cols = map {$table->referenced_column($_)} @referencing_cols;
	} else {
		@foreign_cols = $ftable->foreign_cols($table);
		@referencing_cols = map {$table->nonqualified_name($ftable->referenced_column($_))} @foreign_cols;
		@foreign_cols = map {$ftable->qualified_name($_)} @foreign_cols;
	}

	return (\@referencing_cols, \@foreign_cols);

}

=pod

=begin btest(relationship_columns)

=end btest(relationship_columns)

=cut


=pod

=item primary_identifier

Returns the single, unique primary identifier of the object.

 my $id = $obj->primary_identifier;

If an object as composite keys, this method will return an error by default. You can pass the 'want composite' flag to get back
an arrayref of all primary keys.

 my $idref = $obj->primary_identifier('all');

=cut

=pod

=begin btest(primary_identifier)

=end btest(primary_identifier)

=cut

sub primary_identifier {
	my $self = shift;
	my $want_array_ref = shift || 0;

	my $table = $self->primary_table;

	my @primary_cols = map {$self->$_()} $table->primary_cols;

	if (@primary_cols > 1 && ! $want_array_ref) {
		return $self->error("Object has no unique identifier - composite key (@primary_cols)", "BOP-80");
	} elsif ($self->deleted) {
		return;
	} else {
		return $want_array_ref ? \@primary_cols : $primary_cols[0];
	};

}

=pod

=item commit

There is a lot of internal magic here which I'll decline to get into at the moment. Suffice to say, that ->commit()
will store your object in the database, and that all of the Right Things will happen during the commit.

 $object->commit();
 if ($object->committed){
  print "Success!\n";
 } else {
  print "Failure : " . $object->errstring . "\n";
 };

=cut

=pod

=begin btest(commit)

=end btest(commit)

=cut

sub commit {

	my $self = shift;

	if ($self->should_be_deleted()) {
		$self->should_be_deleted(1);
		return $self->delete(@_);
	}

	if ($self->tied_to_parent && ! $self->should_be_committed) {
		return $self;
	}

	if ($self->deleted) {
		$self->notify('warnings', "attempted to commit deleted object : $self");
		return $self;
	};

	$self->committed(0);
	$self->committing(1);

	$self->begin() or return;

	$self->cleanup() or return $self->fatalerror($self->errvals);

	#we need to commit our singletons first, since their ids are stored in our table.
	$self->commit_relationships('singletons') or return $self->fatalerror($self->errvals);

	#my $table	= $self->primary_table or return $self->error("Cannot commit with no table", "BOP-01");
	my @tables = @{$self->tables} or return $self->fatalerror("Cannot commit with no table", "BOP-01");

	foreach my $table (@tables) {

		#we're updating, if this object has previously been loaded or committed and if we don't force inserts
		if (! $self->force_insert && $self->in_db) {

			my $update_query = $table->update_query or return $self->fatalerror($table->errvals);

			my $query = $table->attach_to_query(
				$update_query,
				{
					'where' => join(' and ', map {"$_ = ?"} $table->primary_cols)
				}
			) or return $self->fatalerror($table->errvals);

			my @values = $self->export_to_db('U', $table->alias_column($table->update_bindables)) or return $self->fatalerror($self->errvals);

			$self->arbitrary_sql(
				'query' => $query,
				'vars'	=> \@values,
				'table'	=> $table,
				'cols'	=> [$table->update_bindables]
			) or return $self->fatalerror($self->errvals);

		}
		#or we're inserting
		else {

			my $insert_query = $table->insert_query or return $self->fatalerror($table->errvals);

			my @values = $self->export_to_db('I', $table->alias_column($table->insert_bindables)) or return $self->fatalerror($self->errvals);

			$self->arbitrary_sql(
				'query' => $insert_query,
				'vars'  => \@values,
				'table' => $table,
				'cols'	=> [$table->insert_bindables]
			) or return $self->fatalerror($self->errvals);

			if ($table->autogenerated){

				my $driver	= $self->driver or return $self->fatalerror($self->errvals);

				my $id_stmt = $driver->prepare_cached($table->last_insert_query())
					or return $self->fatalerror($driver->errstr, "BOP-05");

				$id_stmt->execute()
					or return $self->fatalerror($id_stmt->errstr, "BOP-04");

				my ($id) = $id_stmt->fetchrow_array;

				$id_stmt->finish()
					or return $self->fatalerror($id_stmt->errstr, "BOP-10");

				my $primary	= $table->primary_column;
				$self->$primary($id);
			};

		};
	}

	#commit our nonsingleton tied relationships
	$self->commit_relationships('nonsingletons') or return $self->fatalerror($self->errvals);

	#we have committed this object
	$self->committed(1);
	#and it's in the database
	$self->in_db(1);

	#cache the object, if so desired
	if ($self->cache_object()){
		$self->commit_cached_object();
	};

	my $primary_identifier = join(',', $self->pkg, map {defined $_ ? $_ : ''} @{$self->primary_identifier('all')});
	my $load_cache = $self->central_load_cache;
	unless (defined $load_cache->{$primary_identifier}) {
		$load_cache->{$primary_identifier} = $self;
		weaken($load_cache->{$primary_identifier});
	}

	$self->end() or return $self->fatalerror($self->errvals);

	$self->committing(0);

	return $self;

};

=pod

=item load_from_db

Sometimes, when using cache_object, you may still wish to load the object from the database instead of from cache.
In those cases, call load_from_db() instead of load().

Internally, this is done by temporarily flipping off caching, loading, then turning it back on (or leaving it off if it was
off previously).

=cut

=pod

=item writable_method

Given a method name, returns true if the value of this method will be written out to disk on the
next commit, and false if it will not be written out.

 my $output = $object->writable_method('id');
 if ($output) {
 	print "object will store id\n";
 } else {
 	print "object will not store id\n";
 }

=cut

=pod

=begin btest(writable_method)

$test->is(scalar(__PACKAGE__->writable_method), undef, "Cannot determine if writable on a class");
$test->is(__PACKAGE__->errcode, "BOP-62", "proper error code");

my $subclass = "Basset::Test::Testing::__PACKAGE__::writable_method::Subclass1";

package Basset::Test::Testing::__PACKAGE__::writable_method::Subclass1;
our @ISA = qw(__PACKAGE__);

$subclass->add_attr('one');
$subclass->add_attr('two');
$subclass->add_attr('three');

package __PACKAGE__;

my $o = $subclass->new();
$test->ok($o, "Got object");

$test->is(scalar($o->writable_method), undef, "Cannot determine if writable w/o method");
$test->is($o->errcode, "BOP-63", "proper error code");

$test->is(scalar($o->writable_method('one')), undef, "Cannot determine if writable w/o primary table");
$test->is($o->errcode, 'BOP-64', "proper error code");

$subclass->add_primarytable(
	'name' => 'test_table',
	'definition' => {
		'one' => 'SQL_INTEGER',
		'two' => 'SQL_INTEGER',
		'three' => 'SQL_INTEGER',
	},
	#'insert_columns' => ['two'],
	#'update_columns' => ['three'],
);

$test->is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is one');
$test->is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on insert, force_insert");

$subclass->add_primarytable(
	'name' => 'test_table',
	'definition' => {
		'one' => 'SQL_INTEGER',
		'two' => 'SQL_INTEGER',
		'three' => 'SQL_INTEGER',
	},
	'insert_columns' => ['two'],
	'update_columns' => ['three'],
);

$test->is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->force_insert(1), 1, 'force_insert is 1');
$test->is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->force_insert(0), 0, 'force_insert is 0');

$test->is($o->writable_method('two'), 1, "method two is writable w/ insert and update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->writable_method('two'), 0, "method two is not writable w/ insert and update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('two'), 0, "method two is not writable w/ insert and update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->force_insert(1), 1, 'force_insert is 1');
$test->is($o->writable_method('two'), 1, "method two is writable w/ insert and update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('two'), 1, "method two is writable w/ insert and update columns on insert, force_insert");
$test->is($o->force_insert(0), 0, 'force_insert is 0');

$test->is($o->writable_method('three'), 0, "method three is not writable w/ insert and update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->writable_method('three'), 1, "method three is writable w/ insert and update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('three'), 1, "method three is writable w/ insert and update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->force_insert(1), 1, 'force_insert is 1');
$test->is($o->writable_method('three'), 0, "method three is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('three'), 0, "method three is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->force_insert(0), 0, 'force_insert is 0');

$subclass->add_primarytable(
	'name' => 'test_table',
	'definition' => {
		'alpha' => 'SQL_INTEGER',
		'beta' => 'SQL_INTEGER',
		'gamma' => 'SQL_INTEGER',
	},
	'insert_columns' => ['beta'],
	'update_columns' => ['gamma'],
	'column_aliases' => {
		'alpha' => 'one',
		'beta' => 'two',
		'gamma' => 'three',
	},
);

$test->is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->force_insert(1), 1, 'force_insert is 1');
$test->is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->force_insert(0), 0, 'force_insert is 0');

$test->is($o->writable_method('two'), 1, "method two (from beta) is writable w/ insert and update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->writable_method('two'), 0, "method two (from beta) is not writable w/ insert and update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('two'), 0, "method two (from beta) is not writable w/ insert and update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->force_insert(1), 1, 'force_insert is 1');
$test->is($o->writable_method('two'), 1, "method two (from beta) is writable w/ insert and update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('two'), 1, "method two (from beta) is writable w/ insert and update columns on insert, force_insert");
$test->is($o->force_insert(0), 0, 'force_insert is 0');

$test->is($o->writable_method('three'), 0, "method three (from gamma) is not writable w/ insert and update columns on insert");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->writable_method('three'), 1, "method three (from gamma) is writable w/ insert and update columns on update, loaded");
$test->is($o->loaded(0), 0, 'loaded is zero');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->writable_method('three'), 1, "method three (from gamma) is writable w/ insert and update columns on update, committed");
$test->is($o->loaded(1), 1, 'loaded is 1');
$test->is($o->committed(1), 1, 'committed is 1');
$test->is($o->force_insert(1), 1, 'force_insert is 1');
$test->is($o->writable_method('three'), 0, "method three (from gamma) is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->loaded(0), 0, 'loaded is 0');
$test->is($o->committed(0), 0, 'committed is 0');
$test->is($o->writable_method('three'), 0, "method three (from gamma) is not writable w/ insert and update columns on insert, force_insert");
$test->is($o->force_insert(0), 0, 'force_insert is 0');

=end btest(writable_method)

=cut

sub writable_method {
	my $self	= shift;

	return $self->error("Cannot determine if writable on a class", "BOP-62") unless ref $self;

	my $method	= shift or return $self->error("Cannot determine if writable w/o method", "BOP-63");

	my $table	= $self->primary_table or return $self->error("Cannot determine if writable with no table", "BOP-64");

	my @bindables;

	#we're updating, if this object has previously been loaded or committed and if we don't force inserts
	if (! $self->force_insert && ($self->loaded || $self->committed)){
		@bindables = $table->update_columns;
	} else {
		@bindables = $table->insert_columns;
	}

	@bindables = map {$table->alias_column($_)} @bindables;

	foreach my $bindable (@bindables) {
		return 1 if $bindable eq $method
	}

	return 0;

}

=pod

=begin btest(load_from_db)

=end btest(load_from_db)

=cut

sub load_from_db {
	my $class = shift;

	my $caching = $class->cache_object();

	$class->cache_object(0);

	my $obj = $class->load(@_);

	$class->cache_object($caching);

	return $obj;
};

=pod

=item load

the load method loads an object from the database (or the cache if cache_object is true). The arguments passed must be the
primary_column specified in your primary table, in that order.

 __PACKAGE__->add_primarytable(
 	.
 	.
 	.
 	'primary_column' => 'id'
 );

 my $obj = Some::Package->load($id);

 __PACKAGE__->add_primarytable(
 	.
 	.
 	.
 	'primary_column' => [qw(foo bar baz)]
 );

 my $obj = Some::Package->load($foo, $bar, $baz);

The arguments passed must be in the same order they were defined.

Returns an error if no object found that matches

=cut

=pod

=begin btest(load)

=end btest(load)

=cut

sub load {
	my $class	= shift;

	my $id 		= shift;

	return $class->error("Cannot load with no ID!", "BOP-09") unless defined $id;

	#if we're allowing caching, try to load from the cache
	if ($class->cache_object()){
		my $obj = $class->load_cached_object($id, @_);
		return $obj if $obj;
	};

	my $table	= $class->primary_table or return $class->error("Cannot load with no table", "BOP-01");

	my $data = undef;

	my $name = $table->name;

	my $where = join(' and ', map {"$name.$_ = ?"} $table->primary_cols);

	# ->load() just calls load_all with the appropriate where clause to restrict just to this object,
	# and it loads a single object.
	return $class->load_all({'where' => $where, 'singleton' => 1}, $id, @_);
};

=pod

=item load_or_new

Does what it sounds like, it tries to load an object, and if it fails, it creates a new B<empty>
object instead. Basically, this allows some lazy object creation for things like stateless
applications (such as cgis) that don't know in advance what they're operating on, and don't really
care. So you can try to load an object if values were passed back to you, and if they weren't
then you create an automatically create a new one for yourself.

=cut

=pod

=begin btest(load_or_new)

=end btest(load_or_new)

=cut

sub load_or_new {
	my $class = shift;

	return $class->load(@_) || $class->new();
};

=pod

=item load_many

Convenience method. If you have a class that only uses one primary column (a unique ID, for instance) and
you want to load certain objects with given IDs, you can use load_many.

 my $objects = $self->load_many(1,2,3,4,5);

=cut

=pod

=begin btest(load_many)

=end btest(load_many)

=cut

sub load_many {

	my $class = shift;
	my @ids = @_;

	return $class->error("Cannot load many w/o ids", "BOP-67") unless @ids;

	my $table = $class->primary_table() or return $class->error("Cannot load many w/o primary table", "BOP-65");

	my @cols = $table->primary_cols();
	if (@cols > 1) {
		return $class->error("Cannot load many w/multiple primary columns", "BOP-66");
	};
	my $primary = $cols[0];

	return $class->load_all(
		{
			'where' => $table->many_clause($primary, @ids),
		},
		@ids
	);

}

=pod

=item load_next

=cut

sub load_next {
	my $class = shift;
	my $clauses = shift || {};

	my $iterator = $class->iterator or return $class->error("Cannot load next w/o iterator", "BOP-83");

	return $class->load_all(
		{
			'iterator' => 1,
			'_loading_next' => 1,
			%$clauses,
		},
		@_
	);
};

=pod

=begin btest(load_next)

=end btest(load_next)

=cut


=pod

=item create

Convenience method. Instantiates a brand new object and then immediately commits it to the
database.

=cut

=pod

=begin btest(create)

=end btest(create)

=cut

sub create {
	my $class = shift;

	my $self = $class->new(@_) or return;

	$self->commit or return $class->error($self->errvals);

	return $self;
}

=pod

=item load_all

load_all loads all objects of a given package and returns them in an arrayref.

 my $objects = Some::Package->load_all();

load_all optionally takes an arbitrary number of arguments, where the first is a hashref that defines a set of constraints
and the rest are column values to bind to those constraints.

 my $objects = Some::Package->load_all(
 	{
 		'where'		=> 'name = ? and company = ?',
 		'order by'	=> 'id'
 	},
 	'Jim', 'FooFram'
 );

Will return an arrayref containing all objects with a name of "Jim" and a company of "FooFram"

A list of all valid constraints is provided in the Basset::DB::Table object.

Note that load_all is faster than loading objects individually, since it combines its SQL to minimize the number of queries.
However, all queries dones internally to auto-instantiated relationships will still be performed one at a time, and not in aggregate.

Returns an empty arrayref if no objects found.

The loader can also accept various 'flag' attributes passed in the constraints hash. The flags will not be passed onto the SQL generator.

=over 8

=item iterator

The iterator flag allows you to load up objects in sequence using load_next.

 my $objs = Some::Class->load_all();
 foreach my $o (@$objs) {
 	$o->do_something;
 };

is equivalent to:

 Some::Class->load_all({'iterator' => 1});
 while (my $o = Some::Class->load_nex) {
 	$o->do_something;
 };

The advantage is that you won't have all of the objects in memory at one time. Note that if you
subsequently call a load* method in the same class that you will wipe out the current iterator.

=item constructor

A hashref of constructor args. As data is loaded from the database, objects will be created and initialized with the data loaded. But
sometimes you need to load objects and populate in new values or override existing values with new ones. That's where the constructor
comes in. It will override the values of those attributes in the database with new ones.

 my $objs = Some::Class->load_all(
 	{
 		'constructor' => {
 			'foo' => 'bar'
 		}
 	}
 );

Now all objects in $objs will have their foo attribute set to 'bar'

=item singleton

Sometimes, you build up a complicated query but know that you'll only get back one object. If you pass in the 'singleton' flag, then you'll
only get back a single object instead of an arrayref containing a single object.

=item transform

Will transform the loaded object into one of its related objects declared via a has_a or has_many
relationship.

 Some::User->has_a('pelican' => 'Some::Pelican');

 my $pelican = Some::User->load_all({'where' => 'user_id = ?', 'transform' => 'pelican'});

Directly using this as a loader flag is dubious at best, it is most useful with relationships.

=back

=cut

=pod

=begin btest(load_all)

=end btest(load_all)

=cut

sub load_all {
	my $class	= shift;

	my $clauses	= {};
	my @args	= ();

	if (@_){
		$clauses	= shift;
		@args		= @_;
	};

	#my $table	= $class->primary_table or return $class->error("Cannot load with no table", "BOP-01");
	my $tables = $class->tables;

	return $class->error("Cannot load with no table", "BOP-01") unless @$tables;

	my $driver	= $class->driver or return;

	my $iterated = $clauses->{'iterator'} || 0;
	delete $clauses->{'iterator'};

	my $loading_next = $clauses->{'_loading_next'} || 0;
	delete $clauses->{'_loading_next'};

	my $constructor = $clauses->{'constructor'} || {};
	delete $clauses->{'constructor'};

	my $singleton = $clauses->{'singleton'} || 0;
	delete $clauses->{'singleton'};

	my $key = $clauses->{'key'};
	delete $clauses->{'key'};

	my $transform = $clauses->{'transform'};
	delete $clauses->{'transform'};

	#my $query	= $table->attach_to_query(
	my $tableClass = $class->pkg_for_type('table') or return;

	my $multiselect_query = $tableClass->multiselect_query(
		'tables'		=> $tables,
		'use_aliases'	=> 1,
	) or return $class->error($tableClass->errvals);

	my $query	= $tableClass->attach_to_query(
		$multiselect_query,
		$clauses
	) or return $class->error($tableClass->errvals);

	$class->iterator(undef) unless $loading_next;

	my $stmt = $class->iterator || $class->arbitrary_sql(
		'query' => $query,
		'vars'	=> \@args,
		'iterator' => 1,
	) or return;

	my @objs = ();

	if ($iterated && ! $class->iterator) {
		$class->iterator($stmt);
		return $stmt;
	}

	my $load_cache = $class->central_load_cache;

	while (my $stuff = $stmt->fetchrow_hashref('NAME_lc')){

		# we want to make sure that all of our keys are lower case (since that's what our methods are)
		# and we also want to make sure that no undefined keys are passed in, since Basset::Object's init
		# method would end up throwing an error on that.
		$stuff = {map {$_, $class->import_from_db($_, $stuff->{$_})} grep {defined $stuff->{$_}} keys %$stuff};
#		$stuff = {map {lc $_, $stuff->{$_}} grep {defined $stuff->{$_}} keys %$stuff};
		#print map {"$_ : $stuff->{$_}\n"} sort keys %$stuff;
		my $obj = $class->new(%$stuff, %$constructor, 'loaded' => 1, 'loading' => 1, 'in_db' => 1) or return $class->error("Cannot create object : " . $class->error, "BOP-06");
		$obj->loading(0);

		my $primary_identifier = join(',', $obj->pkg, map {defined $_ ? $_ : ''} @{$obj->primary_identifier('all')});
		if (defined $load_cache->{$primary_identifier}) {
			$obj = $load_cache->{$primary_identifier};
		}
		else {

			$load_cache->{$primary_identifier} = $obj;
			weaken($load_cache->{$primary_identifier});

			$obj->setup() or return $class->error("Setup failed in object : " . $obj->error, $obj->errcode || "BOP-47");
		}

		if (defined $transform) {
			my $transformed = $obj->$transform();
			return $class->error("Cannot transform object into non-object", "BOP-91")
				unless $obj->is_relationship($transform) && ref $transformed;
			$obj = $transformed;
		};

		push @objs, $obj;

		if ($class->cache_object && ! $obj->existing_cached_object) {
			$obj->commit_cached_object();
		};

		if ($iterated) {
			return $obj;
		};
	};

	$stmt->finish()
		or return $class->error($stmt->errstr, "BOP-10");

	if ($iterated && ! @objs) {
		$class->iterator(undef);
		return;
	};

	if ($singleton) {
		my $return = $objs[0];
		return $return || $class->error("Cannot load single object - no objects returned", "BOP-84");
	}
	else {
		if (defined $key) {
			my %objs = map {$_->$key(), $_} @objs;
			return \%objs;
		} else {
			return \@objs;
		}
	}

};

=pod

=item exists

Query to quickly determine if a given object (or set of objects) exists in the database. The objects will not be loaded.
Returns a count of the number of objects that exist.

 my $itsthere = Basset::User->exists(1); #user id 1 exists in the database

=cut

=pod

=begin btest(exists)

=end btest(exists)

=cut

sub exists {
	my $class	= shift;

	my $table	= $class->primary_table or return $class->error("Cannot load with no table", "BOP-01");

	#our default where clause - built on the primary keys
	my $where = join(' and ', map {"$_ = ?"} $table->primary_cols);

	my @args	= @_;
	#if we have arguments, our clause should be on the primary key. No clause otherwise.
	my $clauses	= @args ? {'where' => $where} : {};

	#override the clause with any passed clause
	if (ref $args[0] eq 'HASH'){
		$clauses	= shift @args;
	};

	my $query = $table->attach_to_query(
		$table->count_query,
		$clauses
	) or return $class->error($table->errvals);

	my $data = $class->arbitrary_sql(
		'query' => $query,
		'vars'	=> [@args],
		'into'	=> 'hash',
	) or return;

	return $data->[0]->{'count'} || 0;

};

# used internally by commit, this method will commit the object to the object cache

=pod

=begin btest(commit_cached_object)

=end btest(commit_cached_object)

=cut

sub commit_cached_object {
	my $self = shift;

	my $table		= $self->primary_table or return $self->error("Cannot commit with no table", "BOP-01");
	my $cache_dir	= $self->cache_object_dir or return $self->error("Cannot cache w/o cachedir", "BOP-28");
	my $cols		= join(',', map {my $temp = $self->$_(); $temp =~ s/[\/:]/,/g; $temp} map {$table->alias_column($_)} $table->primary_cols());

	my $temp_committed	= $self->committed();
	$self->committed(0);

	my $temp_pkg		= $self->pkg();
	my $ancestor		= $self->nonrestricted_parent();


	(my $class = $ancestor) =~ s/::/,/;

	bless $self, $ancestor;

	my $cache_handle = $self->gen_handle;
	open ($cache_handle, ">" . $cache_dir . $cols . '-,' . $class . '.cache');
	print $cache_handle $self->dump;
	close $cache_handle;

	$self->committed($temp_committed);

	bless $self, $temp_pkg;

	return $self;
};

#used internally by load, this method will load an object from the cache

=pod

=begin btest(load_cached_object)

=end btest(load_cached_object)

=cut

sub load_cached_object {
	my $class = shift;

	(my $disk_class = $class) =~ s/::/,/;

	my $cache_dir	= $class->cache_object_dir or return $class->error("Cannot load from cache w/o cachedir", "BOP-31");
	my $cols		= join(',', map {my $temp = $_; $temp =~ s/[\/:]/,/g; $temp} @_);

	my $cache_handle = $class->gen_handle;
	if (open ($cache_handle, $cache_dir . $cols . '-,' . $disk_class . '.cache')){
		local $/ = undef;
		my $data = <$cache_handle>;
		local $@ = undef;
		$data =~ /^(\$\w+)/;
		my $obj = eval qq{
			my $1;
			eval \$data;
		};
		if ($@){
			return $class->error("Could not evaluate object : $@", "BOP-30");
		}
		else {
			$obj->loaded(1);
			$obj->loaded_from_cache(1);
			return $obj;
		};
	};

	return $class->error("No cached object to load", "BOP-29");

};

#used internally by commit to determine if an object exists in the cache

=pod

=begin btest(existing_cached_object)

=end btest(existing_cached_object)

=cut

sub existing_cached_object {
	my $self = shift;

	(my $class = $self->pkg) =~ s/::/,/;

	my $table		= $self->primary_table or return $self->error("Cannot commit with no table", "BOP-01");
	my $cache_dir	= $self->cache_object_dir or return $self->error("Cannot cache w/o cachedir", "BOP-28");
	my $cols		= join(',', map {my $temp = $self->$_(); $temp =~ s/[\/:]/,/g; $temp} map {$table->alias_column($_)} $table->primary_cols());

	if (-e $cache_dir . $cols . '-,' . $class . '.cache') {
		return 1;
	}
	else {
		return $self->error('No cache file', 'BOP-32');
	};

};

=pod

=item delete

This will delete an object from the database

$object->delete();

The object itself will not be affected, except for the fact that its deleted flag will be set.

=cut

=pod

=begin btest(delete)

=end btest(delete)

=cut

sub delete {

	my $self = shift;

	#if we haven't loaded the object, we have nothing to delete, so we just pretend
	unless ($self->in_db) {
		$self->deleted(1);
		return $self;
	};

	if ($self->tied_to_parent && ! $self->should_be_deleted) {
		return $self;
	};

	$self->deleting(1);

	my $table	= $self->primary_table or return $self->error("Cannot delete with no table", "BOP-01");

	$self->begin() or return;

	my $query = $table->attach_to_query(
		$table->delete_query(),
		{
			'where' => join(' and ', map {"$_ = ?"} $table->primary_cols)
		}
	) or return $self->error($table->errvals);

	my @values = $self->export_to_db('D', $table->alias_column($table->delete_bindables)) or return;

	$self->arbitrary_sql(
		'query'	=> $query,
		'vars'	=> \@values,
		'table'	=> $table,
		'cols'	=> [$table->delete_bindables]
	) or return;

	$self->delete_relationships or return;

	$self->end or return;

	$self->deleting(0);

	$self->deleted(1);

	return $self;

};

=pod

=item load_by_user

This is a convenience method for objects that frequently do a load_all for a particular user.

It's just a wrapper to:

 $class->load_all({"where" => "user = ?"}, $user_id);

=cut

=pod

=begin btest(load_by_user)

=end btest(load_by_user)

=cut

sub load_by_user {
	my $self	= shift;
	my $user	= shift or return $self->error("Cannot load all with no user!", "BOP-20");

	return $self->error("Cannot load by user, object does not have user", "BOP-21")
		unless $self->can('user');

	return $self->load_all({"where" => "user = ?"}, $user);
};

=pod

=item load_where

Simple wrapper around load_all. Takes key/value pairs.

 my $users = Some::Class->load_where(
 	'user' 		=> 3,
 	'location'	=> 'mountains',
 	'weather'	=> 'sunny'
 );

This is exactly equivalent to:

 my $users = Some::Class->load_all(
 	{
 		'where' => 'user = ? and location = ? and weather = ?'
 	},
 	3, 'mountains', 'sunny'
 );

It just looks prettier and hides more of the SQL.

Even better, you can also stick in an array for multiple value loads.

 my $users = Some::Class->load_where(
 	'state'		=> 'PA',
 	'last_name' => [qw(Smith Jones Johnson)]
 );

Is exactly the same as:

 my $users = Some::Class->load_all(
 	{
 		'where' => 'last_name in (?,?,?) and state = ?'
 	},
 	qw(Smith Jones Johnson), 'PA',
 );

There is an alternative syntax, you may pass in one arrayref and one hashref. The arrayref becomes your
where clause, the second contains additional loader args (such as 'order by', 'limit', etc.)

 my $users = Some::Class->load_where(
 	#where array
 	[
 		'state'		=> 'PA',
 		'last_name' => [qw(Smith Jones Johnson)]
 	],
 	#extra loader hash
 	{
 		'order by' => 'state desc',
 	},
 );

Is exactly the same as:

 my $users = Some::Class->load_all(
 	{
 		'where' => 'last_name in (?,?,?) and state = ?',
 		'order by' => state desc',
 	},
 	qw(Smith Jones Johnson), 'PA',
 );


=cut

sub load_where {
	my $class = shift;

	my @clauses = @_ or return $class->error("Cannot load_where w/o clauses", "BOP-68");

	my $additional_clauses = {};

	if (ref $clauses[0] eq 'ARRAY') {
		$additional_clauses = @clauses == 2 ? pop @clauses : {};	#last one is additional clauses
		@clauses = @{$clauses[0]};
	}

	my ($clause, @values) = $class->primary_table->construct_where_clause($class->tables, @clauses);

	return $class->error($class->primary_table->errvals) unless defined $clause;

	return $class->load_all({%$additional_clauses, 'where' => $clause}, @values);

};

=pod

=begin btest(load_where)

=end btest(load_where)

=cut



=pod

=item arbitrary_sql

The arbitrary_sql method does what it sounds like, it executes arbitrary sql code. You're expected
to pass at least one parameter:

 query => 'some sql query'; #such as select col1, col2 from table1

If you want to bind any variables to the query, put them in the vars parameter:

 query => 'select count(*) from table where id = ?',
 vars => '7'

Normally, you'd pass in an arrayref to vars, but if it's just one, you can skip it

 vars => '7'
 or
 vars => ['7']

 query => 'select count(*) from table where id = ? and type = ?',
 vars => ['7', 'animal']

Binding is done without SQL types, unless you pass in a Basset::DB::Table object and the columns as well, which contains the column types:

 my $t = Basset::DB::Table->new( {table definitions} );
 table => $t
 cols => ['id', 'type']

Insertion queries (insert, update, etc.) will return 1 upon success

If you're running a select, show, set, or desc query, then you end up loading data. It will always be returned in an arrayref containing
the rows. Normally, each row is a hashref, loaded with the ->fetchrow_hashref method from DBI. You can also choose to load
into an array, then pass in into:

 'into' => 'array'

If you pass anything other than 'into' => 'array', then 'into' => 'hash' is assumed.

 my $data = $class->arbitrary_sql(
 	'query' => 'select id, name from names where id in (?, ?) and name in (?, ?)',
 	'vars'	=> [qw(7 8 Jim Koka)],
 );

 foreach my $h (@$data){
 	print {$_->{id} . " : " . $_->name . "\n"} sort keys %$h;
 };

Alternatively, if you're memory conscious, you can pass in the 'iterator' flag. This will return the actual executed statement handle,
so you can call fetchrow_array, fetchrow_hashref, etc. on it yourself.

 my $sth = $class->arbitrary_sql(
 	'query'		=> 'select id, name from names where id in (?, ?) and name in (?, ?)',
 	'vars'		=> [qw(7 8 Jim Koka)],
 	'iterator'	=> 1,
 );

Another example:

 my $rc = $class->arbitrary_sql(
 	'query'	=> 'insert into names (id, name) values (?,?)',
 	'vars'	=> ['18', 'Jim 3'],
 	'table	=> $names_table,
 	'cols'	=> [qw(id name)]
 );

 # $rc == 1

=cut

=pod

=begin btest(arbitrary_sql)

=end btest(arbitrary_sql)

=cut

sub arbitrary_sql {

	my $self	= shift;

	my %init	= @_;

	return $self->error("Cannot execute arbitrary SQL w/o SQL", "BOP-38")
		unless $init{'query'} || $init{'stmt'};

	# table and cols are used to bind a column to a particular type, so you either need to provide both of them
	# or neither
	return $self->error("Cannot use table w/o cols", "BOP-39")
		if (($init{'table'} && ! $init{'cols'}) || (! $init{'table'} && $init{'cols'}));

	#assume that we want a hash, if nothing's passed
	$init{'into'} ||= 'hash';	#default to a hash

	my $driver = $self->driver or return;

	#certain queries return stuff. If so, grab it.
	my $arbitrary_selectables = $self->arbitrary_selectables();

	my $selecting_query = 0;

	if ($init{'selecting_query'} || $init{'query'} =~ /^\s*$arbitrary_selectables/i) {
		$selecting_query = 1;
	}

	if ($selecting_query) {
		$self->begin() or return;
	}
	
	my $errormethod = $selecting_query ? 'error' : 'fatalerror';

	my $stmt = $init{'stmt'} || $driver->prepare_cached($init{'query'})
		or return $self->$errormethod($driver->errstr(), "BOP-05");

	#if we have vars, then we're binding
	if ($init{'vars'}){
		#allow the user to pass in a single value as a scalar, not in an arrayref
		$init{'vars'} = [$init{'vars'}] unless ref $init{'vars'};

#		my $place = 0;

		#bind our places. If we have table and cols, then we know the type to bind to. Otherwise, use undef.
#		foreach my $col (@{$init{'vars'}}) {
		my $max = @{$init{'vars'}};
		my $definition = $init{'table'}->definition if $init{'table'};
		$self->notify('debug', $init{'query'} . "\nVARS: " . join(', ', map {defined($_) ? $_ : 'NULL'} @{$init{'vars'}}));
		for (my $place = 0; $place < $max; $place++) {
			#$self->notify('debug', $init{'vars'}->[$place]);
			$stmt->bind_param(
				$place + 1,					#place
				$init{'vars'}->[$place],	#value
				$init{'table'}				#sql type if we have a table, undef otherwise
					? $driver->sql_type($definition->{$init{'cols'}->[$place]})
					: undef	
			) or return $self->$errormethod($stmt->errstr, "BOP-03");
#			$place++;
		};
	} else {
		#otherwise, just notify with the query
		$self->notify('debug', $init{'query'});
	}

	$stmt->execute() or return $self->$errormethod($stmt->errstr, "BOP-04");

	if ($selecting_query) {
		$self->end() or return;
	}

	return $stmt if $init{'iterator'} && $selecting_query;

	if ($selecting_query){

		my @data = ();

		#into determines our fetchmethod
		my $fetchmethod = $init{'into'} =~ /^array$/i ? 'fetchrow_arrayref' : 'fetchrow_hashref';	#default to hashes

		while (my $stuff = $stmt->$fetchmethod()){
			#push @data, $stuff;
			if ($fetchmethod eq 'fetchrow_hashref'){
			#	$stuff = {map {lc $_, $stuff->{$_}} keys %$stuff};
				#push @data, {%$stuff};
				push @data, {map {lc $_, $stuff->{$_}} keys %$stuff};
			}
			else {
				push @data, [@$stuff];
			};
		};

		$stmt->finish()
			or return $self->error($stmt->errstr, "BOP-10");

		return \@data;
	};

	$stmt->finish()
		or return $self->error($stmt->errstr, "BOP-10");

	return 1;
};

=pod

=item driver

The driver method is just a shortcut wrapper for Basset::DB->new(); Only give it the same arguments in the same
format as you would give to Basset::DB->new() itself. The driver object returned will be cached here for all time,
unless you explicitly wipe it out or set it to something else.

If the driver hasn't been accessed in the last 5 minutes, then it pings the database handle
before returning the driver to ensure that it's still live. If the ping fails and the driver
has no transaction stack, then you transparently just get back a new driver.

But if the ping fails AND the driver had an active transaction stack, then you get back an error.
Calling ->driver again will create a new handle, but you would presumably have an error condition
to deal with.

=cut

=pod

=begin btest(driver)

=end btest(driver)

=cut

__PACKAGE__->add_class_attr('_driver');
__PACKAGE__->add_class_attr('_last_driver_access');

sub driver {
	my $self = shift;

	if (@_) {
		return $self->_driver(shift);
	} elsif (my $driver = $self->_driver) {
		my $now = time;
		if ($now - $self->_last_driver_access > 300) {
			unless ($driver->ping) {
				$self->_driver(undef);
				#if it has a stack and is stale, it's an error condition
				if ($driver->stack) {
					return $self->error("Stale driver - please reconnect", "XXX");
				#otherwise, we don't really care. Go ahead and return a new one.
				} else {
					return $self->driver();
				}
			};
		}
		$self->_last_driver_access($now);
		#$driver->ping unless $driver->stack;
		return $driver;
	} else {
		my $driver = $self->factory('type' => 'driver', @_) or return;
		$self->_last_driver_access(time);
		return $self->_driver($driver);
	}
};

=pod

=item begin

Database transactions are stack based. ->begin adds onto the stack, ->end removes from the stack.
See Basset::DB for more info.

You may now begin and end your transaction as normal. Please be aware of the fact that in the current
implementation, beginning a transaction locks the database driver for ALL objects in the system.

You don't need to begin if you're only committing a single object - individual classes
are expected to do their own locking, stack handling, unlocking, etc. as necessary. You will need to
begin and end if you're doing multiple commits of different objects (or if you're writing your
own module). For example,

 my $user  = Basset::User->load(1);
 my $user2 = Basset::User->load(2);

 $user->begin(); 		#start up a transaction stack

 $user->name('Jim');		#set user's name, doesn't need to be in the transaction
 $user2->name('Koka');	#set user's name, doesn't need to be in the transaction

 $user->commit(); #doesn't actually commit to the database, it's in a transaction
 $user2->commit(); #doesn't actually commit to the database, it's in a transaction

 $user->end();			#closes the transaction stack, now commits

See Basset::DB for more information about begin, end, fail, etc.

=cut

=pod

=begin btest(begin)

=end btest(begin)

=cut

sub begin {
	my $self = shift;

	my $driver = $self->driver or return;

	return $driver->begin() || $self->error($driver->errvals);

}

=pod

=item end

Database transactions are stack based. ->begin adds onto the stack, ->end removes from the stack.
See Basset::DB for more info.

=cut

=pod

=begin btest(end)

=end btest(end)

=cut

sub end {
	my $self = shift;

	my $driver = $self->driver or return;

	return $driver->end() || $self->error($driver->errvals);
};

=pod

=item fail

Database transactions are stack based. ->fail is a shortcut to shutdown and rollback your
transaction

=cut

=pod

=begin btest(fail)

=end btest(fail)

=cut

sub fail {
	my $self = shift;

	my $driver = $self->driver or return;

	return $driver->fail || $self->error($driver->errvals);

};

=pod

=item finish

Database transactions are stack based. ->finish is a shortcut to immediately finish your
transaction

=cut

=pod

=begin btest(finish)

=end btest(finish)

=cut

sub finish {
	my $self = shift;

	my $driver = $self->driver or return;

	return $driver->finish || $self->error($driver->errvals);
};

=pod

=item wipe

Database transactions are stack based. ->wipe clears out your transaction stack.

=cut

=pod

=begin btest(wipe)

=end btest(wipe)

=cut

sub wipe {
	my $self = shift;

	my $driver = $self->driver or return;

	return $driver->wipe || $self->error($driver->errvals);

};

=pod

=item fatalerror

Setting a fatalerror message causes your transaction to fail. Note that you must explicitly pass a
defined value for the transaction stack to be wiped.

If you need to unfail a failed transaction (say, you know how to recover from the error), then you should call
unfail on the driver and continue.

 $driver->unfail();
 # interesting things

=cut

=pod

=begin btest(fatalerror)

my $o = __PACKAGE__->new();
$test->ok($o, "got object");

$test->is($o->committing(1), 1, "set committing to 1");
$test->is($o->deleting(1), 1, "set deleting to 1");

$test->is(scalar($o->fatalerror("fatalerror", "some code")), undef, "set fatalerror");
$test->is($o->errcode, "some code", "proper error code");
$test->is($o->committing, 0, "wiped out committing flag");
$test->is($o->deleting, 0, "wiped out deleting flag");

$test->is(scalar(__PACKAGE__->fatalerror("pkg error", "pkg error code")), undef, "set pkg error");
$test->is(__PACKAGE__->errcode, "pkg error code", "proper package error code");
$test->is($o->errcode, "some code", "object retains error code");

=end btest(fatalerror)

=cut

sub fatalerror {
	my $self = shift;

	my $driver = $self->_driver;

	if (defined $driver && @_ && defined $_[0]) {
		$driver->failed(1);
		$driver->end();
	}

	$self->committing(0)	if ref $self;
	$self->deleting(0)		if ref $self;

	return $self->error(@_);
};

=pod

=item setup

The setup method is called immediately after the object is loaded and initialized in load_all. Basset::Object::Persistent's
method is empty and does nothing. It's designed to be used in subclasses in locations where you need to alter something in
an object after it's loaded from the database and set up properly. Say if you do further initialization
or load in from an object or something.

This is effectively analogous to Basset::DB::Table's perl_read_translation method, but applicable to the object as a whole,
not merely to an individual table

=cut

=pod

=begin btest(setup)

=end btest(setup)

=cut

sub setup {
	return shift;
};

=pod

=item cleanup

The cleanup method is called immediately before the object is committed in commit. Basset::Object::Persistent's
method is empty and does nothing. It's designed to be used in subclasses in locations where you need to alter something in
an object immediately before it's committed to the database.

This is effectively analogous to Basset::DB::Table's perl_write_translation method, but applicable to the object as a whole,
not merely to an individual table

=cut

=pod

=begin btest(cleanup)

=end btest(cleanup)

=cut

sub cleanup {
	return shift;
};

=pod

=back

=cut


#ALMOST DEPRECATED

=pod

=over

=item add_grouptable

This is a wrapper around Basset::Group's (or whichever group class you're using) subclass method.

Presently the only limitation is that a given object may belong to an arbitrary (but fixed) number 
of groups, but not an unlimited amount, the number must be predefined. This will change in the future.

You'll need to hand in the attribute name, table name, and any improvements to the stock definition.

 Some::Class->add_grouptable(
 	'attribute' => 'category',
 	'table' => 'some_class_category',
 	'improvement' => {
 		#improvements
 	}
 );

Where tablename is the name of the group table, and attribute is the object attribute containing
the id of the group. So, for our user and company example, it would be:

 Some::User->add_grouptable(
 	'attribute' => 'company',
 	'table'		=> 'company_names'
 );

Assuming that there is a table named "company_names" in the system and that the Some::User 
class has an attribute called "company" within which to store the company information.

If you wish to group by multiple things, simply add multiple group tables.

 Some::User->add_grouptable('attribute' => 'employee_type', 'table' => 'employment_type');
 Some::User->add_grouptable('attribute' => 'tax_bracket', 'table' => 'tax_bracket');

Naturally, you will need the appropriate attributes and tables defined.

Additionally, if desired, you may improve the group definition:

 Some::User->add_grouptable(
 	'attribute'		=> 'employee_type',
 	'table'			=> 'employment_type',
 	'improvement'	=> {
 		'company' => 'SQL_INTEGER'
 	}
 );

Will assume that the grouptable has an additional column, 'company', which is used for further
isolation of a given group. Allows you to associate particular employee_types with a particular
company, in this case. Note that this is NOT designed to be used as subcategorization, it's used
for refinement as to exactly who owns a group. You can make a subgroup by specifying the 'super'
attribute of the group.

B<See Basset::Group for more info.>

=cut

sub add_grouptable {
	my $class		= shift;

	my $super_groupclass = $class->pkg_for_type('group') or return;

	return $super_groupclass->subclass(
		'class' => $class,
		@_
	) or return $class->error($super_groupclass->errvals);
};

=pod

=item add_group

This is a wrapper around getting the proper Basset::Group subclass, and then calling B<create> for
the new object.

B<See Basset::Group for more info.>

=cut

sub add_group {
	my $class	= shift;

	my %init	= @_;

	my $super_groupclass = $class->pkg_for_type('group') or return;
	my $groupclass = $super_groupclass->group_for_class($class, $init{'attribute'})
		or return $class->error($super_groupclass->errvals);

	return $groupclass->create(
		%init
	) || $class->error($groupclass->errvals);

};

=pod

=item load_group

This is a wrapper around getting the proper Basset::Group subclass, and then loading the ID you want.

B<See Basset::Group for more info.>

=cut

sub load_group {
	my $class	= shift;

	my $attribute = shift or return $class->error("Cannot load group w/o attribute", "BOP-57");
	my $id = shift or return $class->error("Cannot load group w/o id", "BOP-58");


	my $super_groupclass = $class->pkg_for_type('group') or return;
	my $groupclass = $super_groupclass->group_for_class($class, $attribute)
		or return $class->error($super_groupclass->errvals);

	return $groupclass->load(
		$id
	) || $class->error($groupclass->errvals);

};

=pod

=item load_all_groups_by_name

This is a wrapper around getting the proper Basset::Group subclass, and then loading the group you want
by its name.

B<See Basset::Group for more info.>

=cut

sub load_all_groups_by_name {
	my $class	= shift;

	my $attribute = shift or return $class->error("Cannot load group w/o attribute", "BOP-59");
	my $name = shift or return $class->error("Cannot load group w/o name", "BOP-60");

	my $super_groupclass = $class->pkg_for_type('group') or return;
	my $groupclass = $super_groupclass->group_for_class($class, $attribute)
		or return $class->error($super_groupclass->errvals);

	return $groupclass->load_by_name(
		$name
	) || $class->error($groupclass->errvals);

};

=pod

=item groupclass

This is a wrapper around getting the proper Basset::Group subclass, and then loading the ID you want.

B<See Basset::Group for more info.>

=cut

sub groupclass {
	my $class	= shift;
	my $attribute = shift or return $class->error("Cannot get group class w/o attribute", "BOP-61");

	my $super_groupclass = $class->pkg_for_type('group') or return;
	my $groupclass = $super_groupclass->group_for_class($class, $attribute)
		or return $class->error($super_groupclass->errvals);

	return $groupclass;

};


1;
