use Test::More tests => 1054;
use Basset::Object::Persistent;
package Basset::Object::Persistent;
{		Test::More::ok(1, "uses strict");
		Test::More::ok(1, "uses warnings");
};
{#line 74 loaded
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->loaded), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->loaded), 0, 'loaded is 0');
Test::More::is($o->loaded('abc'), 'abc', 'set loaded to abc');
Test::More::is($o->loaded(), 'abc', 'read value of loaded - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->loaded($h), $h, 'set loaded to hashref');
Test::More::is($o->loaded(), $h, 'read value of loaded  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->loaded($a), $a, 'set loaded to arrayref');
Test::More::is($o->loaded(), $a, 'read value of loaded  - arrayref');
};
{#line 110 loading
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->loading), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->loading), 0, 'loading is 0');
Test::More::is($o->loading('abc'), 'abc', 'set loading to abc');
Test::More::is($o->loading(), 'abc', 'read value of loading - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->loading($h), $h, 'set loading to hashref');
Test::More::is($o->loading(), $h, 'read value of loading  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->loading($a), $a, 'set loading to arrayref');
Test::More::is($o->loading(), $a, 'read value of loading  - arrayref');
};
{#line 147 loaded_from_cache
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->loaded_from_cache), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->loaded_from_cache), 0, 'loaded_from_cache is 0');
Test::More::is($o->loaded_from_cache('abc'), 'abc', 'set loaded_from_cache to abc');
Test::More::is($o->loaded_from_cache(), 'abc', 'read value of loaded_from_cache - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->loaded_from_cache($h), $h, 'set loaded_from_cache to hashref');
Test::More::is($o->loaded_from_cache(), $h, 'read value of loaded_from_cache  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->loaded_from_cache($a), $a, 'set loaded_from_cache to arrayref');
Test::More::is($o->loaded_from_cache(), $a, 'read value of loaded_from_cache  - arrayref');
};
{#line 181 committing
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->committing), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->committing), 0, 'committing is 0');
Test::More::is($o->committing('abc'), 'abc', 'set committing to abc');
Test::More::is($o->committing(), 'abc', 'read value of committing - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->committing($h), $h, 'set committing to hashref');
Test::More::is($o->committing(), $h, 'read value of committing  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->committing($a), $a, 'set committing to arrayref');
Test::More::is($o->committing(), $a, 'read value of committing  - arrayref');
};
{#line 225 committed
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->committed), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->committed), 0, 'committed is 0');
Test::More::is($o->committed('abc'), 'abc', 'set committed to abc');
Test::More::is($o->committed(), 'abc', 'read value of committed - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->committed($h), $h, 'set committed to hashref');
Test::More::is($o->committed(), $h, 'read value of committed  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->committed($a), $a, 'set committed to arrayref');
Test::More::is($o->committed(), $a, 'read value of committed  - arrayref');
};
{#line 260 deleting
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->deleting), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->deleting), 0, 'deleting is 0');
Test::More::is($o->deleting('abc'), 'abc', 'set deleting to abc');
Test::More::is($o->deleting(), 'abc', 'read value of deleting - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->deleting($h), $h, 'set deleting to hashref');
Test::More::is($o->deleting(), $h, 'read value of deleting  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->deleting($a), $a, 'set deleting to arrayref');
Test::More::is($o->deleting(), $a, 'read value of deleting  - arrayref');
};
{#line 305 deleted
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->deleted), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->deleted), 0, 'deleted is 0');
Test::More::is($o->deleted('abc'), 'abc', 'set deleted to abc');
Test::More::is($o->deleted(), 'abc', 'read value of deleted - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->deleted($h), $h, 'set deleted to hashref');
Test::More::is($o->deleted(), $h, 'read value of deleted  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->deleted($a), $a, 'set deleted to arrayref');
Test::More::is($o->deleted(), $a, 'read value of deleted  - arrayref');
};
{#line 434 iterator
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar($o->iterator), undef, 'iterator is undefined');
Test::More::is($o->iterator('abc'), 'abc', 'set iterator to abc');
Test::More::is($o->iterator(), 'abc', 'read value of iterator - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->iterator($h), $h, 'set iterator to hashref');
Test::More::is($o->iterator(), $h, 'read value of iterator  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->iterator($a), $a, 'set iterator to arrayref');
Test::More::is($o->iterator(), $a, 'read value of iterator  - arrayref');
};
{#line 473 init
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "got object for init");

Test::More::is($o->loading, 0, "loading is 0");
Test::More::is($o->loaded, 0, "loaded is 0");
Test::More::is($o->committing, 0, "committing is 0");
Test::More::is($o->committed, 0, "committed is 0");
Test::More::is($o->deleting, 0, "deleting is 0");
Test::More::is($o->deleted, 0, "deleted is 0");
Test::More::is($o->loaded_from_cache, 0, 'loaded_from_cache is 0');
Test::More::is(ref($o->instantiated_relationships), 'HASH', 'instantiated_relationships is hashref');
Test::More::is($o->tied_to_parent, 0, 'tied_to_parent is 0');
Test::More::is($o->should_be_committed, 0, 'should_be_committed is 0');
Test::More::is($o->should_be_deleted, 0, 'should_be_committed is 0');
Test::More::is(ref($o->_deleted_relationships), 'ARRAY', '_deleted_relationships is arrayref');
};
{#line 705 perl_read_translation
my $h = {'foo' => 'bar', 'baz' => 'yee'};
Test::More::ok($h, 'got hashref');
Test::More::is($h->{'foo'}, 'bar', 'foo is bar');
Test::More::is($h->{'baz'}, 'yee', 'baz is yee');
Test::More::is(Basset::Object::Persistent->perl_read_translation($h), $h, "Set perl_read_translation");
Test::More::is(Basset::Object::Persistent->perl_read_translation(), $h, 'reset perl_read_translation');
};
{#line 768 perl_write_translation
my $h = {'foo' => 'bar', 'baz' => 'yee'};
Test::More::ok($h, 'got hashref');
Test::More::is($h->{'foo'}, 'bar', 'foo is bar');
Test::More::is($h->{'baz'}, 'yee', 'baz is yee');
Test::More::is(Basset::Object::Persistent->perl_write_translation($h), $h, "Set perl_write_translation");
Test::More::is(Basset::Object::Persistent->perl_write_translation(), $h, 'reset perl_write_translation');
};
{#line 811 export_to_db
package Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

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

Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1->add_attr('able');
Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1->add_attr('baker');
Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1->add_attr('charlie');
Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1->add_attr('delta');

package Basset::Object::Persistent;

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Created object");

my $so = Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1->new(
	'able' => 'able_value',
	'baker' => 'baker_value',
	'charlie' => 'charlie_value',
	'delta' => 'delta_value'
);
Test::More::ok($so, "Created object");

my $def = {
	'able' => 'SQL_INTEGER',
	'baker' => 'SQL_INTEGER',
	'charlie' => 'SQL_INTEGER',
	'delta' => 'SQL_INTEGER'
};

Basset::Test::Testing::Basset::Object::Persistent::export_to_db::Subclass1->add_tables(
	Basset::Object::Persistent->factory(
		'type' => 'table',
		'definition' => $def
	)
);

#Test::More::is($o->definition($def), $def, "Set definition");
#Test::More::is($o->definition, $def, "Got definition");

Test::More::is(scalar($so->export_to_db()), undef, 'Cannot export_to_db w/o type');
Test::More::is($so->errcode, 'BOP-92', 'proper error code for export_to_db (type)');
Test::More::is(scalar($so->export_to_db( 'I')), undef, 'Cannot export_to_db w/o method');
Test::More::is($so->errcode, 'BOP-93', 'proper error code for export_to_db (method)');

Test::More::is($so->export_to_db('I', 'able'), 'able_value', 'exports able upon insert');
Test::More::is($so->export_to_db('I', 'baker'), 'baker_value', 'exports baker upon insert');
Test::More::is($so->export_to_db('I', 'charlie'), 'charlie_value', 'exports charlie upon insert');
Test::More::is($so->export_to_db('I', 'delta'), 'delta_value', 'exports delta upon insert');

Test::More::is($so->export_to_db('U', 'able'), 'able_value', 'exports able upon update');
Test::More::is($so->export_to_db('U', 'baker'), 'baker_value', 'exports baker upon update');
Test::More::is($so->export_to_db('U', 'charlie'), 'charlie_value', 'exports charlie upon update');
Test::More::is($so->export_to_db('U', 'delta'), 'delta_value', 'exports delta upon update');

Test::More::is($so->export_to_db('R', 'able'), 'able_value', 'exports able upon replace');
Test::More::is($so->export_to_db('R', 'baker'), 'baker_value', 'exports baker upon replace');
Test::More::is($so->export_to_db('R', 'charlie'), 'charlie_value', 'exports charlie upon replace');
Test::More::is($so->export_to_db('R', 'delta'), 'delta_value', 'exports delta upon replace');

Test::More::is($so->export_to_db('D', 'able'), 'able_value', 'exports able upon delete');
Test::More::is($so->export_to_db('D', 'baker'), 'baker_value', 'exports baker upon delete');
Test::More::is($so->export_to_db('D', 'charlie'), 'charlie_value', 'exports charlie upon delete');
Test::More::is($so->export_to_db('D', 'delta'), 'delta_value', 'exports delta upon delete');

Test::More::is($so->export_to_db('S', 'able'), 'able_value', 'exports able upon select');
Test::More::is($so->export_to_db('S', 'baker'), 'baker_value', 'exports baker upon select');
Test::More::is($so->export_to_db('S', 'charlie'), 'charlie_value', 'exports charlie upon select');
Test::More::is($so->export_to_db('S', 'delta'), 'delta_value', 'exports delta upon select');

Test::More::is($so->export_to_db('A', 'able'), 'able_value', 'exports able upon all');
Test::More::is($so->export_to_db('A', 'baker'), 'baker_value', 'exports baker upon all');
Test::More::is($so->export_to_db('A', 'charlie'), 'charlie_value', 'exports charlie upon all');
Test::More::is($so->export_to_db('A', 'delta'), 'delta_value', 'exports delta upon all');

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

Test::More::is($o->perl_write_translation($translator), $translator, 'set translator for perl_write_translation');

Test::More::is($so->export_to_db('I', 'able'), 'perl1', 'exports able upon insert');
Test::More::is($so->export_to_db('I', 'baker'), 'baker_value', 'exports baker upon insert');
Test::More::is($so->export_to_db('I', 'charlie'), 'charlie_value', 'exports charlie upon insert');
Test::More::is($so->export_to_db('I', 'delta'), 'delta_value', 'exports delta upon insert');

Test::More::is($so->export_to_db('U', 'able'), 'able_value', 'exports able upon update');
Test::More::is($so->export_to_db('U', 'baker'), 'perl2', 'exports baker upon update');
Test::More::is($so->export_to_db('U', 'charlie'), 'charlie_value', 'exports charlie upon update');
Test::More::is($so->export_to_db('U', 'delta'), 'delta_value', 'exports delta upon update');

Test::More::is($so->export_to_db('R', 'able'), 'able_value', 'exports able upon replace');
Test::More::is($so->export_to_db('R', 'baker'), 'baker_value', 'exports baker upon replace');
Test::More::is($so->export_to_db('R', 'charlie'), 'CHARLIE_VALUE', 'exports charlie upon replace');
Test::More::is($so->export_to_db('R', 'delta'), 'delta_value', 'exports delta upon replace');

Test::More::is($so->export_to_db('D', 'able'), 'able_value', 'exports able upon delete');
Test::More::is($so->export_to_db('D', 'baker'), 'baker_value', 'exports baker upon delete');
Test::More::is($so->export_to_db('D', 'charlie'), 'charlie_value', 'exports charlie upon delete');
Test::More::is($so->export_to_db('D', 'delta'), 'perl1', 'exports delta upon delete');

Test::More::is($so->export_to_db('S', 'able'), 'able_value', 'exports able upon select');
Test::More::is($so->export_to_db('S', 'baker'), 'baker_value', 'exports baker upon select');
Test::More::is($so->export_to_db('S', 'charlie'), 'charlie_value', 'exports charlie upon select');
Test::More::is($so->export_to_db('S', 'delta'), 'delta_value', 'exports delta upon select');

Test::More::is($so->export_to_db('A', 'able'), 'able_value', 'exports able upon all');
Test::More::is($so->export_to_db('A', 'baker'), 'baker_value', 'exports baker upon all');
Test::More::is($so->export_to_db('A', 'charlie'), 'charlie_value', 'exports charlie upon all');
Test::More::is($so->export_to_db('A', 'delta'), 'delta_value', 'exports delta upon all');

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

Test::More::is($o->perl_write_translation($translator2), $translator2, 'set translator for perl_write_translation');

Test::More::is($so->export_to_db('I', 'able'), 'able_value', 'exports able upon insert');
Test::More::is($so->export_to_db('I', 'baker'), 'perl2', 'exports baker upon insert');
Test::More::is($so->export_to_db('I', 'charlie'), 'CHARLIE_VALUE', 'exports charlie upon insert');
Test::More::is($so->export_to_db('I', 'delta'), 'delta_value', 'exports delta upon insert');

Test::More::is($so->export_to_db('U', 'able'), 'able_value', 'exports able upon update');
Test::More::is($so->export_to_db('U', 'baker'), 'perl2', 'exports baker upon update');
Test::More::is($so->export_to_db('U', 'charlie'), 'perl1', 'exports charlie upon update');
Test::More::is($so->export_to_db('U', 'delta'), 'delta_value', 'exports delta upon update');

Test::More::is($so->export_to_db('R', 'able'), 'able_value', 'exports able upon replace');
Test::More::is($so->export_to_db('R', 'baker'), 'perl2', 'exports baker upon replace');
Test::More::is($so->export_to_db('R', 'charlie'), 'perl1', 'exports charlie upon replace');
Test::More::is($so->export_to_db('R', 'delta'), 'delta_value', 'exports delta upon replace');

Test::More::is($so->export_to_db('D', 'able'), 'able_value', 'exports able upon delete');
Test::More::is($so->export_to_db('D', 'baker'), 'perl2', 'exports baker upon delete');
Test::More::is($so->export_to_db('D', 'charlie'), 'perl1', 'exports charlie upon delete');
Test::More::is($so->export_to_db('D', 'delta'), 'delta_value', 'exports delta upon delete');

Test::More::is($so->export_to_db('S', 'able'), 'perl1', 'exports able upon select');
Test::More::is($so->export_to_db('S', 'baker'), 'perl2', 'exports baker upon select');
Test::More::is($so->export_to_db('S', 'charlie'), 'perl1', 'exports charlie upon select');
Test::More::is($so->export_to_db('S', 'delta'), 'delta_value', 'exports delta upon select');

Test::More::is($so->export_to_db('A', 'able'), 'able_value', 'exports able upon all');
Test::More::is($so->export_to_db('A', 'baker'), 'perl2', 'exports baker upon all');
Test::More::is($so->export_to_db('A', 'charlie'), 'perl1', 'exports charlie upon all');
Test::More::is($so->export_to_db('A', 'delta'), 'delta_value', 'exports delta upon all');
};
{#line 1058 import_from_db
my $subclass = 'Basset::Test::Testing::Basset::Object::Persistent::import_from_db::Subclass1';

package Basset::Test::Testing::Basset::Object::Persistent::import_from_db::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

sub perl1 {
	return 'perl1';
}

sub perl2 {
	return 'perl2';
}

sub perl3 {
	return uc $_[2];
};

package Basset::Object::Persistent;

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Created object");

my $def = {
	'able' => 'SQL_INTEGER',
	'baker' => 'SQL_INTEGER',
	'charlie' => 'SQL_INTEGER',
	'delta' => 'SQL_INTEGER'
};

$subclass->add_tables(
	Basset::Object::Persistent->factory(
		'type' => 'table',
		'definition' => $def
	)
);

#Test::More::is($o->definition($def), $def, "Set definition");
#Test::More::is($o->definition, $def, "Got definition");

Test::More::is(scalar($subclass->import_from_db()), undef, 'Cannot import_from_db w/o class');
Test::More::is($subclass->errcode, 'BOP-94', 'proper error code for import_from_db (method)');

Test::More::is($subclass->import_from_db('able', 'able_value'), 'able_value', 'imports able');
Test::More::is($subclass->import_from_db('baker', 'baker_value'), 'baker_value', 'imports baker');
Test::More::is($subclass->import_from_db('charlie', 'charlie_value'), 'charlie_value', 'imports charlie');
Test::More::is($subclass->import_from_db('delta', 'delta_value'), 'delta_value', 'imports delta');

Test::More::is($subclass->import_from_db('able', undef), undef, 'imports undef value');

my $translator = {
	'able' => 'perl1',
	'baker' => 'perl2',
	'charlie' => 'perl3',
};

Test::More::is($o->perl_read_translation($translator), $translator, 'set perl_read_translation');

Test::More::is($subclass->import_from_db('able', 'able_value'), 'perl1', 'imports able');
Test::More::is($subclass->import_from_db('baker', 'baker_value'), 'perl2', 'imports baker');
Test::More::is($subclass->import_from_db('charlie', 'charlie_value'), 'CHARLIE_VALUE', 'imports charlie');
Test::More::is($subclass->import_from_db('delta', 'delta_value'), 'delta_value', 'imports delta');

Test::More::is($subclass->import_from_db('able', undef), 'perl1', 'imports translated undef value');
Test::More::is($subclass->import_from_db('delta', undef), undef, 'imports translated undef value');
};
{#line 1241 should_be_deleted
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->should_be_deleted), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->should_be_deleted), 0, 'should_be_deleted is 0');
Test::More::is($o->should_be_deleted('abc'), 'abc', 'set should_be_deleted to abc');
Test::More::is($o->should_be_deleted(), 'abc', 'read value of should_be_deleted - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->should_be_deleted($h), $h, 'set should_be_deleted to hashref');
Test::More::is($o->should_be_deleted(), $h, 'read value of should_be_deleted  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->should_be_deleted($a), $a, 'set should_be_deleted to arrayref');
Test::More::is($o->should_be_deleted(), $a, 'read value of should_be_deleted  - arrayref');
};
{#line 1275 should_be_committed
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->should_be_committed), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(scalar($o->should_be_committed), 0, 'should_be_committed is zero');
Test::More::is($o->should_be_committed('abc'), 'abc', 'set should_be_committed to abc');
Test::More::is($o->should_be_committed(), 'abc', 'read value of should_be_committed - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->should_be_committed($h), $h, 'set should_be_committed to hashref');
Test::More::is($o->should_be_committed(), $h, 'read value of should_be_committed  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->should_be_committed($a), $a, 'set should_be_committed to arrayref');
Test::More::is($o->should_be_committed(), $a, 'read value of should_be_committed  - arrayref');
};
{#line 1311 instantiated_relationships
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->instantiated_relationships), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(ref(scalar($o->instantiated_relationships)), 'HASH', 'instantiated_relationships is hashref');
Test::More::is($o->instantiated_relationships('abc'), 'abc', 'set instantiated_relationships to abc');
Test::More::is($o->instantiated_relationships(), 'abc', 'read value of instantiated_relationships - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->instantiated_relationships($h), $h, 'set instantiated_relationships to hashref');
Test::More::is($o->instantiated_relationships(), $h, 'read value of instantiated_relationships  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->instantiated_relationships($a), $a, 'set instantiated_relationships to arrayref');
Test::More::is($o->instantiated_relationships(), $a, 'read value of instantiated_relationships  - arrayref');
};
{#line 1362 _deleted_relationships
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");
Test::More::is(scalar(Basset::Object::Persistent->_deleted_relationships), undef, "could not call object method as class method");
Test::More::is(Basset::Object::Persistent->errcode, "BO-08", "proper error code");
Test::More::is(ref(scalar($o->_deleted_relationships)), 'ARRAY', '_deleted_relationships is arrayref');
Test::More::is($o->_deleted_relationships('abc'), 'abc', 'set _deleted_relationships to abc');
Test::More::is($o->_deleted_relationships(), 'abc', 'read value of _deleted_relationships - abc');
my $h = {};
Test::More::ok($h, 'got hashref');
Test::More::is($o->_deleted_relationships($h), $h, 'set _deleted_relationships to hashref');
Test::More::is($o->_deleted_relationships(), $h, 'read value of _deleted_relationships  - hashref');
my $a = [];
Test::More::ok($a, 'got arrayref');
Test::More::is($o->_deleted_relationships($a), $a, 'set _deleted_relationships to arrayref');
Test::More::is($o->_deleted_relationships(), $a, 'read value of _deleted_relationships  - arrayref');
};
{#line 2569 writable_method
Test::More::is(scalar(Basset::Object::Persistent->writable_method), undef, "Cannot determine if writable on a class");
Test::More::is(Basset::Object::Persistent->errcode, "BOP-62", "proper error code");

my $subclass = "Basset::Test::Testing::Basset::Object::Persistent::writable_method::Subclass1";

package Basset::Test::Testing::Basset::Object::Persistent::writable_method::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

$subclass->add_attr('one');
$subclass->add_attr('two');
$subclass->add_attr('three');

package Basset::Object::Persistent;

my $o = $subclass->new();
Test::More::ok($o, "Got object");

Test::More::is(scalar($o->writable_method), undef, "Cannot determine if writable w/o method");
Test::More::is($o->errcode, "BOP-63", "proper error code");

Test::More::is(scalar($o->writable_method('one')), undef, "Cannot determine if writable w/o primary table");
Test::More::is($o->errcode, 'BOP-64', "proper error code");

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

Test::More::is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is one');
Test::More::is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('one'), 1, "method is writable w/o insert or update columns on insert, force_insert");

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

Test::More::is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->force_insert(1), 1, 'force_insert is 1');
Test::More::is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('one'), 0, "method one is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->force_insert(0), 0, 'force_insert is 0');

Test::More::is($o->writable_method('two'), 1, "method two is writable w/ insert and update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->writable_method('two'), 0, "method two is not writable w/ insert and update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('two'), 0, "method two is not writable w/ insert and update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->force_insert(1), 1, 'force_insert is 1');
Test::More::is($o->writable_method('two'), 1, "method two is writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('two'), 1, "method two is writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->force_insert(0), 0, 'force_insert is 0');

Test::More::is($o->writable_method('three'), 0, "method three is not writable w/ insert and update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->writable_method('three'), 1, "method three is writable w/ insert and update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('three'), 1, "method three is writable w/ insert and update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->force_insert(1), 1, 'force_insert is 1');
Test::More::is($o->writable_method('three'), 0, "method three is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('three'), 0, "method three is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->force_insert(0), 0, 'force_insert is 0');

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

Test::More::is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->force_insert(1), 1, 'force_insert is 1');
Test::More::is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('one'), 0, "method one (from alpha) is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->force_insert(0), 0, 'force_insert is 0');

Test::More::is($o->writable_method('two'), 1, "method two (from beta) is writable w/ insert and update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->writable_method('two'), 0, "method two (from beta) is not writable w/ insert and update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('two'), 0, "method two (from beta) is not writable w/ insert and update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->force_insert(1), 1, 'force_insert is 1');
Test::More::is($o->writable_method('two'), 1, "method two (from beta) is writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('two'), 1, "method two (from beta) is writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->force_insert(0), 0, 'force_insert is 0');

Test::More::is($o->writable_method('three'), 0, "method three (from gamma) is not writable w/ insert and update columns on insert");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->writable_method('three'), 1, "method three (from gamma) is writable w/ insert and update columns on update, loaded");
Test::More::is($o->loaded(0), 0, 'loaded is zero');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->writable_method('three'), 1, "method three (from gamma) is writable w/ insert and update columns on update, committed");
Test::More::is($o->loaded(1), 1, 'loaded is 1');
Test::More::is($o->committed(1), 1, 'committed is 1');
Test::More::is($o->force_insert(1), 1, 'force_insert is 1');
Test::More::is($o->writable_method('three'), 0, "method three (from gamma) is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->loaded(0), 0, 'loaded is 0');
Test::More::is($o->committed(0), 0, 'committed is 0');
Test::More::is($o->writable_method('three'), 0, "method three (from gamma) is not writable w/ insert and update columns on insert, force_insert");
Test::More::is($o->force_insert(0), 0, 'force_insert is 0');
};
{#line 3947 fatalerror
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "got object");

Test::More::is($o->committing(1), 1, "set committing to 1");
Test::More::is($o->deleting(1), 1, "set deleting to 1");

Test::More::is(scalar($o->fatalerror("fatalerror", "some code")), undef, "set fatalerror");
Test::More::is($o->errcode, "some code", "proper error code");
Test::More::is($o->committing, 0, "wiped out committing flag");
Test::More::is($o->deleting, 0, "wiped out deleting flag");

Test::More::is(scalar(Basset::Object::Persistent->fatalerror("pkg error", "pkg error code")), undef, "set pkg error");
Test::More::is(Basset::Object::Persistent->errcode, "pkg error code", "proper package error code");
Test::More::is($o->errcode, "some code", "object retains error code");
};
{		Test::More::ok(1, "uses strict");
		Test::More::ok(1, "uses warnings");
};
{#line 193 add_attr
sub test_accessor {
	my $self = shift;
	my $prop = shift;
	my $extra = shift;

	return $self->error("Not a class attribute", "BO-08") unless ref $self;

	return $extra;
};

Test::More::ok(\&Basset::Object::Persistent::test_accessor, "Added test accessor");

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::ok(Basset::Object::Persistent->add_attr('test_attribute1'), "Added attribute for _accessor");
Test::More::ok($o->can('test_attribute1'), "Object sees attribute");
Test::More::ok(Basset::Object::Persistent->can('test_attribute1'), "Class sees attribute");

Test::More::is($o->test_attribute1('testval1'), 'testval1', "Method test_attribute1 mutates");
Test::More::is($o->test_attribute1(), 'testval1', "Method test_attribute1 accesses");
Test::More::is($o->test_attribute1(undef), undef, "Method test_attribute1 deletes");

Test::More::is(scalar Basset::Object::Persistent->test_attribute1('testval17'), undef, "Class fails to mutate");
Test::More::is(scalar Basset::Object::Persistent->test_attribute1(), undef, "Class fails to access");
Test::More::is(scalar Basset::Object::Persistent->test_attribute1(undef), undef, "Class fails to delete");

Test::More::ok(Basset::Object::Persistent->add_attr(['test_attribute2', 'test_accessor'], 'excess'), "Added attribute for test_accessor");
Test::More::ok($o->can('test_attribute2'), "Object sees attribute");
Test::More::ok(Basset::Object::Persistent->can('test_attribute2'), "Class sees attribute");

Test::More::is($o->test_attribute2('testval2'), 'excess', "Method test_attribute2 mutates");
Test::More::is($o->test_attribute2(), 'excess', "Method test_attribute2 accesses");
Test::More::is($o->test_attribute2(undef), 'excess', "Method test_attribute2 deletes");

Test::More::is(scalar Basset::Object::Persistent->test_attribute2('testval18'), undef, "Class fails to mutate");
Test::More::is(scalar Basset::Object::Persistent->test_attribute2(), undef, "Class fails to access");
Test::More::is(scalar Basset::Object::Persistent->test_attribute2(undef), undef, "Class fails to delete");

Test::More::ok(Basset::Object::Persistent->add_attr('test_attribute3', 'static'), "Added static attribute");
Test::More::ok($o->can('test_attribute3'), "Object sees attribute");
Test::More::ok(Basset::Object::Persistent->can('test_attribute3'), "Class sees attribute");

Test::More::is($o->test_attribute3('status'), 'static', "Method test_attribute3 mutates");
Test::More::is($o->test_attribute3(), 'static', "Method test_attribute3 accesses");
Test::More::is($o->test_attribute3(undef), 'static', "Method test_attribute3 deletes");

Test::More::is(scalar Basset::Object::Persistent->test_attribute3('testval19'), undef, "Class fails to mutate");
Test::More::is(scalar Basset::Object::Persistent->test_attribute3(), undef, "Class fails to access");
Test::More::is(scalar Basset::Object::Persistent->test_attribute3(undef), undef, "Class fails to delete");

Test::More::ok(Basset::Object::Persistent->add_attr(['test_attribute4', '_regex_accessor'], '^\d+$', 'Numbers only', 'test code'), "Added numeric only regex attribute");
Test::More::ok($o->can('test_attribute4'), "Object sees attribute");
Test::More::ok(Basset::Object::Persistent->can('test_attribute4'), "Class sees attribute");

Test::More::isnt(scalar $o->test_attribute4('foo'), 'foo', "Method test_attribute4 fails to set non-numeric");
Test::More::is($o->error, "Numbers only", "Proper object error message");
Test::More::is($o->errcode, "test code", "Proper object error code");
Test::More::isnt(scalar $o->test_attribute4('1234567890a'), '1234567890a', "Method test_attribute4 fails to set non-numeric");
Test::More::is($o->error, "Numbers only", "Proper object error message");
Test::More::is($o->errcode, "test code", "Proper object error code");
Test::More::isnt(scalar $o->test_attribute4('a1234567890'), 'a1234567890', "Method test_attribute4 fails to set non-numeric");
Test::More::is($o->error, "Numbers only", "Proper object error message");
Test::More::is($o->errcode, "test code", "Proper object error code");
Test::More::isnt(scalar $o->test_attribute4('123456a7890'), '123456a7890', "Method test_attribute4 fails to set non-numeric");
Test::More::is($o->error, "Numbers only", "Proper object error message");
Test::More::is($o->errcode, "test code", "Proper object error code");
Test::More::is(scalar $o->test_attribute4('12345'), '12345', "Method test_attribute4 mutates");
Test::More::is(scalar $o->test_attribute4(), '12345', "Method test_attribute4 accesses");
Test::More::is(scalar $o->test_attribute4(undef), undef, "Method test_attribute4 deletes");

Test::More::is(scalar Basset::Object::Persistent->test_attribute4('testval20'), undef, "Class fails to mutate");
Test::More::is(scalar Basset::Object::Persistent->test_attribute4(), undef, "Class fails to access");
Test::More::is(scalar Basset::Object::Persistent->test_attribute4(undef), undef, "Class fails to delete");

Test::More::ok(Basset::Object::Persistent->add_attr(['test_attribute5', '_regex_accessor'], 'abcD', 'Must contain abcD', 'test code2'), "Added abcD only regex attribute");
Test::More::ok($o->can('test_attribute5'), "Object sees attribute");
Test::More::ok(Basset::Object::Persistent->can('test_attribute5'), "Class sees attribute");

Test::More::isnt(scalar $o->test_attribute5('foo'), 'foo', "Method test_attribute4 fails to set non-abcD");
Test::More::is($o->error, "Must contain abcD", "Proper object error message");
Test::More::is($o->errcode, "test code2", "Proper object error code");
Test::More::isnt(scalar $o->test_attribute5('abc'), 'abc', "Method test_attribute4 fails to set non-abcD");
Test::More::is($o->error, "Must contain abcD", "Proper object error message");
Test::More::is($o->errcode, "test code2", "Proper object error code");
Test::More::isnt(scalar $o->test_attribute5('bcD'), 'bcD', "Method test_attribute4 fails to set non-abcD");
Test::More::is($o->error, "Must contain abcD", "Proper object error message");
Test::More::is($o->errcode, "test code2", "Proper object error code");
Test::More::isnt(scalar $o->test_attribute5('abD'), 'abD', "Method test_attribute4 fails to set non-abcD");
Test::More::is($o->error, "Must contain abcD", "Proper object error message");
Test::More::is($o->errcode, "test code2", "Proper object error code");
Test::More::is(scalar $o->test_attribute5('abcD'), 'abcD', "Method test_attribute5 mutates");
Test::More::is(scalar $o->test_attribute5('abcDE'), 'abcDE', "Method test_attribute5 mutates");
Test::More::is(scalar $o->test_attribute5('1abcD'), '1abcD', "Method test_attribute5 mutates");
Test::More::is(scalar $o->test_attribute5('zabcDz'), 'zabcDz', "Method test_attribute5 mutates");
Test::More::is(scalar $o->test_attribute5(), 'zabcDz', "Method test_attribute5 accesses");
Test::More::is(scalar $o->test_attribute5(undef), undef, "Method test_attribute5 deletes");

Test::More::is(scalar Basset::Object::Persistent->test_attribute5('testval20'), undef, "Class fails to mutate");
Test::More::is(scalar Basset::Object::Persistent->test_attribute5(), undef, "Class fails to access");
Test::More::is(scalar Basset::Object::Persistent->test_attribute5(undef), undef, "Class fails to delete");
};
{#line 366 add_class_attr
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::ok(Basset::Object::Persistent->add_class_attr('test_class_attribute_1'), "Added test class attribute");
Test::More::ok($o->can("test_class_attribute_1"), "object can see class attribute");
Test::More::ok(Basset::Object::Persistent->can("test_class_attribute_1"), "class can see class attribute");

Test::More::is(Basset::Object::Persistent->test_class_attribute_1('test value 1'), 'test value 1', 'class method call mutates');
Test::More::is(Basset::Object::Persistent->test_class_attribute_1(), 'test value 1', 'class method call accesses');
Test::More::is(Basset::Object::Persistent->test_class_attribute_1(undef), undef, 'class method call deletes');

Test::More::is($o->test_class_attribute_1('test value 2'), 'test value 2', 'object method call mutates');
Test::More::is($o->test_class_attribute_1(), 'test value 2', 'object method call accesses');
Test::More::is($o->test_class_attribute_1(undef), undef, 'object method call deletes');

Test::More::ok(Basset::Object::Persistent->add_class_attr('test_class_attribute_2', 14), "Added test class attribute 2");
Test::More::ok($o->can("test_class_attribute_2"), "object can see class attribute");
Test::More::ok(Basset::Object::Persistent->can("test_class_attribute_2"), "class can see class attribute");

Test::More::is(Basset::Object::Persistent->test_class_attribute_2(), 14, "Class has default arg");
Test::More::is(Basset::Object::Persistent->test_class_attribute_2(), 14, "Object has default arg");

Test::More::is(Basset::Object::Persistent->test_class_attribute_2('test value 3'), 'test value 3', 'class method call mutates');
Test::More::is(Basset::Object::Persistent->test_class_attribute_2(), 'test value 3', 'class method call accesses');
Test::More::is(Basset::Object::Persistent->test_class_attribute_2(undef), undef, 'class method call deletes');

Test::More::is($o->test_class_attribute_1('test value 4'), 'test value 4', 'class method call mutates');
Test::More::is($o->test_class_attribute_1(), 'test value 4', 'object method call accesses');
Test::More::is($o->test_class_attribute_1(undef), undef, 'object method call deletes');

package Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

my $so = Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->new();
Test::More::ok($so, "Sub-Object created");

Test::More::is(scalar Basset::Object::Persistent->test_class_attribute_1("newer test val"), "newer test val", "trickle method class re-mutates");

Test::More::is(scalar $so->test_class_attribute_1(), "newer test val", "trickle method sub-object accesses super");

Test::More::is(scalar $so->test_class_attribute_1("testval3"), "testval3", "trickle method sub-object mutates");
Test::More::is(scalar $so->test_class_attribute_1(), "testval3", "trickle method sub-object accesses");
Test::More::is(scalar $so->test_class_attribute_1(undef), undef, "trickle method sub-object deletes");

Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->test_class_attribute_1("testval4"), "testval4", "trickle method class mutates");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->test_class_attribute_1(), "testval4", "trickle method subclass accesses");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->test_class_attribute_1(undef), undef, "trickle method subclass deletes");

Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->test_class_attribute_1("sub value"), "sub value", "Subclass re-mutates");
Test::More::is(scalar Basset::Object::Persistent->test_class_attribute_1(), "sub value", "Super class affected on access");

Test::More::is(scalar Basset::Object::Persistent->test_class_attribute_1("super value"), "super value", "Super class re-mutates");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->test_class_attribute_1(), "super value", "Sub class affected on access");

package Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass5;
our @ISA = qw(Basset::Object::Persistent);

sub conf {
	return undef;
};

package Basset::Object::Persistent;

{

	local $@ = undef;

	eval {
		Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass5->add_class_attr('test_class_attr');
	};

	Test::More::like($@, qr/^Conf file error :/, 'could not add class attr w/o conf file');
}

my $conf = Basset::Object::Persistent->conf();
$conf->{'Basset::Object::Persistent'}->{'_test_attribute'} = 'test value';

Test::More::ok(Basset::Object::Persistent->add_class_attr('_test_attribute'), 'added test attribute');
Test::More::is(Basset::Object::Persistent->_test_attribute, 'test value', 'populated with value from conf fiel');
};
{#line 594 add_trickle_class_attr
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::ok(Basset::Object::Persistent->add_trickle_class_attr('trick_attr1'), "Added test trickle class attribute");
Test::More::ok($o->can("trick_attr1"), "object can see trickle class attribute");
Test::More::ok(Basset::Object::Persistent->can("trick_attr1"), "class can see trickle class attribute");

package Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

my $so = Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->new();
Test::More::ok($so, "Sub-Object created");

Test::More::is(scalar $o->trick_attr1("testval1"), "testval1", "trickle method object mutates");
Test::More::is(scalar $o->trick_attr1(), "testval1", "trickle method object accesses");
Test::More::is(scalar $o->trick_attr1(undef), undef, "trickle method object deletes");

Test::More::is(scalar Basset::Object::Persistent->trick_attr1("testval2"), "testval2", "trickle method class mutates");
Test::More::is(scalar Basset::Object::Persistent->trick_attr1(), "testval2", "trickle method class accesses");
Test::More::is(scalar Basset::Object::Persistent->trick_attr1(undef), undef, "trickle method class deletes");
Test::More::is(scalar Basset::Object::Persistent->trick_attr1("newer test val"), "newer test val", "trickle method class re-mutates");

Test::More::is(scalar $so->trick_attr1(), "newer test val", "trickle method sub-object accesses super");

Test::More::is(scalar $so->trick_attr1("testval3"), "testval3", "trickle method sub-object mutates");
Test::More::is(scalar $so->trick_attr1(), "testval3", "trickle method sub-object accesses");
Test::More::is(scalar $so->trick_attr1(undef), undef, "trickle method sub-object deletes");

Test::More::is(scalar Basset::Object::Persistent->trick_attr1("supertestval"), "supertestval", "super trickle method class mutates");
Test::More::is(Basset::Object::Persistent->trick_attr1(), "supertestval", "trickle method class accesses");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->trick_attr1("testval4"), "testval4", "trickle method class mutates");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->trick_attr1(), "testval4", "trickle method subclass accesses");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->trick_attr1(undef), undef, "trickle method subclass deletes");
Test::More::is(Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->trick_attr1(), undef, "subclass still sees undef as value");

Test::More::is(scalar Basset::Object::Persistent->trick_attr1("super value"), "super value", "Super class re-mutates");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->trick_attr1("sub value"), "sub value", "Subclass re-mutates");

Test::More::is(scalar Basset::Object::Persistent->trick_attr1(), "super value", "Super class unaffected on access");
Test::More::is(scalar Basset::Object::Persistent->trick_attr1("new super value"), "new super value", "Super class re-mutates");
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_class_attr::Subclass1->trick_attr1(), "sub value", "Sub class unaffected on access");

package Basset::Test::Testing::Basset::Object::Persistent::add_trickle_class_attr::Subclass5;
our @ISA = qw(Basset::Object::Persistent);

sub conf {
	return undef;
};

package Basset::Object::Persistent;

{
	local $@ = undef;
	eval {
		Basset::Test::Testing::Basset::Object::Persistent::add_trickle_class_attr::Subclass5->add_class_attr('test_trickle_attr');
	};
	Test::More::like($@, qr/^Conf file error :/, 'could not add trickle class attr w/o conf file');
}
};
{#line 771 populate_trickle_parents
my $conf = Basset::Object::Persistent->conf;
Test::More::ok($conf, "Got conf");

$conf->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1'}->{'foo'} = 'subclass 1';
$conf->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass3'}->{'foo'} = 'subclass 3';

package Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1;

our @ISA = qw(Basset::Object::Persistent);

Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1->add_trickle_class_attr('foo');

package Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass2;

our @ISA = qw(Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1);

package Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass3;

our @ISA = qw(Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass2);

package Basset::Object::Persistent;

Test::More::ok(! Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1->populate_trickle_parents, "Cannot populate parents w/o method");
Test::More::is(Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1->errcode, "BO-30", "Proper error code");

Test::More::ok(Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass3->populate_trickle_parents('foo'), "populated sub 3's parents");

Test::More::ok(Basset::Object::Persistent->populated_trickle_parents->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1'}, "subclass1 is populated");

Test::More::is(Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1->foo, 'subclass 1', 'proper super attribute');

Test::More::ok(Basset::Object::Persistent->populated_trickle_parents->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass1'}, "subclass1 populated");
Test::More::ok(Basset::Object::Persistent->populated_trickle_parents->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass2'}, "subclass2 is populated");
Test::More::ok(Basset::Object::Persistent->populated_trickle_parents->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass3'}, "subclass3 is populated");
Test::More::is(Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass3->foo, 'subclass 3', 'proper sub attribute');

Test::More::ok(Basset::Object::Persistent->populated_trickle_parents->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass2'}, "subclass2 populated");
Test::More::ok(Basset::Object::Persistent->populated_trickle_parents->{'Basset::Object::Persistent::Testing::populate_trickle_parents::Subclass3'}, "subclass3 populated");
};
{#line 829 add_default_attr
package Basset::Test::Testing::Basset::Object::Persistent::add_default_class_attr::subclass;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::add_default_class_attr::subclass->add_default_class_attr('some_test_attr'), "Added default class attribute");

package Basset::Test::Testing::Basset::Object::Persistent::add_default_class_attr::Subclass5;
our @ISA = qw(Basset::Object::Persistent);

sub conf {
	return undef;
};

package Basset::Object::Persistent;

{
	local $@ = undef;
	eval {
		Basset::Test::Testing::Basset::Object::Persistent::add_default_class_attr::Subclass5->add_class_attr('test_default_attr');
	};
	Test::More::like($@, qr/^Conf file error :/, 'could not add default class attr w/o conf file');
}
};
{#line 1013 error
my $notes = 0;

sub notifier {
	my $self = shift;
	my $note = shift;
	$notes++;
};

my $center = Basset::Object::Persistent->pkg_for_type('notificationcenter');
Test::More::ok($center, "Got notification center class");


Test::More::ok(
	$center->addObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'error',
		'object' => 'all',
		'method' => 'notifier'
	), "Added observer for error notifications"
);

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::is(scalar Basset::Object::Persistent->error("classerr"), undef, "Class error set and returns undef");
Test::More::is($notes, 1, "Posted a notification");
Test::More::is(scalar Basset::Object::Persistent->error(), 'classerr', "Class error accesses");
Test::More::is($notes, 1, "No notification");

Test::More::is(scalar Basset::Object::Persistent->error("classerr2", "classcode2"), undef, "Class error and errcode set and returns undef");
Test::More::is($notes, 2, "Posted a notification");
Test::More::is(scalar Basset::Object::Persistent->error(), 'classerr2', "Class error accesses");
Test::More::is($notes, 2, "No notification");
Test::More::is(scalar Basset::Object::Persistent->errcode(), 'classcode2', "Class Class errcode accesses");
Test::More::is($notes, 2, "No notification");

Test::More::is(scalar $o->error("objerr"), undef, "Object error set and returns undef");
Test::More::is($notes, 3, "Posted a notification");
Test::More::is(scalar $o->error(), 'objerr', "Object error accesses");
Test::More::is($notes, 3, "No notification");
Test::More::is(scalar Basset::Object::Persistent->error(), 'classerr2', "Class error unaffected");
Test::More::is($notes, 3, "No notification");

Test::More::is(scalar $o->error("objerr2", "objcode2"), undef, "Object error and errcode set and returns undef");
Test::More::is($notes, 4, "Posted a notification");
Test::More::is(scalar $o->error(), 'objerr2', "Object error accesses");
Test::More::is($notes, 4, "No notification");
Test::More::is(scalar $o->errcode(), 'objcode2', "Object errcode accesses");
Test::More::is($notes, 4, "No notification");
Test::More::is(scalar Basset::Object::Persistent->error(), 'classerr2', "Class error unaffected");
Test::More::is($notes, 4, "No notification");
Test::More::is(scalar Basset::Object::Persistent->errcode(), 'classcode2', "Class errcode unaffected");
Test::More::is($notes, 4, "No notification");

Test::More::is(scalar Basset::Object::Persistent->error("classerr3", "clscode3"), undef, "Re-set class error");
Test::More::is($notes, 5, "Posted notification");
Test::More::is(scalar $o->error(), 'objerr2', "Object error unchanged");
Test::More::is($notes, 5, "No notification");
Test::More::is(scalar $o->errcode(), 'objcode2', "Object errcode unchanged");
Test::More::is($notes, 5, "No notification");

Test::More::is(scalar $o->error("objerr3", "objcode3", "silently"), undef, "Silently set error");
Test::More::is($notes, 5, "No notification");
Test::More::is(scalar $o->error(), 'objerr3', "Object error accesses");
Test::More::is($notes, 5, "No notification");
Test::More::is(scalar $o->errcode(), 'objcode3', "Object errcode accesses");
Test::More::is($notes, 5, "No notification");
Test::More::is(scalar Basset::Object::Persistent->error(), 'classerr3', "Class error unaffected");
Test::More::is($notes, 5, "No notification");
Test::More::is(scalar Basset::Object::Persistent->errcode(), 'clscode3', "Class errcode unaffected");
Test::More::is($notes, 5, "No notification");

Test::More::is(scalar $o->error(["formatted error %d %.2f %s", 13, 3.14, "data"], "ec", "silently"), undef, "Object set formatted error");
Test::More::is(scalar $o->error, "formatted error 13 3.14 data", "Formatted error accesses");
Test::More::is(scalar $o->errcode, "ec", "Formatted errcode accesses");
Test::More::is(scalar Basset::Object::Persistent->error(), 'classerr3', "Class error unaffected");
Test::More::is($notes, 5, "No notification");
Test::More::is(scalar Basset::Object::Persistent->errcode(), 'clscode3', "Class errcode unaffected");
Test::More::is($notes, 5, "No notification");

my $confClass = Basset::Object::Persistent->pkg_for_type('conf');
Test::More::ok($confClass, "Got conf");

my $cfg = $confClass->conf;
Test::More::ok($cfg, "Got configuration");

Test::More::ok($cfg->{"Basset::Object"}->{'exceptions'} = 1, "enables exceptions");

eval {
	$o->error("exception error", "excpcode");
};
Test::More::ok($@ =~ /^excpcode /, "Caught object exception code");
Test::More::is($o->last_exception, "exception error", "Caught object exception");
Test::More::is(Basset::Object::Persistent->last_exception, "exception error", "Caught class exception");
Test::More::is($notes, 6, "Posted a notification");

eval {
	Basset::Object::Persistent->error("exception error 2", "excpcode2");
};

Test::More::ok($@ =~ /^excpcode2 /, "Caught object exception code2");
Test::More::is($o->last_exception, "exception error 2", "Caught object exception");
Test::More::is(Basset::Object::Persistent->last_exception, "exception error 2", "Caught class exception");
Test::More::is($notes, 7, "Posted a notification");

eval {
	Basset::Object::Persistent->error("exception error 3", "excpcode3", "silently");
};
Test::More::ok($@ =~ /^excpcode3/, "Caught object exception code3");
Test::More::is($o->last_exception, "exception error 3", "Caught object exception");
Test::More::is(Basset::Object::Persistent->last_exception, "exception error 3", "Caught class exception");
Test::More::is($notes, 7, "No notification");

Test::More::is($cfg->{"Basset::Object"}->{'exceptions'} = 0, 0,"shut off exceptions");

Test::More::ok(
	$center->removeObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'error',
	), "Removed observer for error notifications"
);

package Basset::Test::Testing::Basset::Object::Persistent::error::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

sub can {
	my $self = shift;
	my $method = shift;
	return 0 if $method =~ /_..._error/;
	return $self->SUPER::can($method);
};

package Basset::Object::Persistent;
{
	local $@ = undef;

	eval {
		Basset::Test::Testing::Basset::Object::Persistent::error::Subclass1->error("some error");
	};
	Test::More::like($@, qr/^System start up failure/, 'Could not start system when cannot error');
}

package Basset::Test::Testing::Basset::Object::Persistent::error::Subclass2;
our @ISA = qw(Basset::Object::Persistent);

sub can {
	my $self = shift;
	my $method = shift;
	return 0 if $method =~ /_..._errcode/;
	return $self->SUPER::can($method);
};

package Basset::Object::Persistent;

{
	local $@ = undef;

	eval {
		Basset::Test::Testing::Basset::Object::Persistent::error::Subclass2->error("some error");
	};

	Test::More::like($@, qr/^System start up failure/, 'Could not start system when cannot errcode');

	Test::More::is(scalar(Basset::Test::Testing::Basset::Object::Persistent::error::Subclass2->error), undef, 'accessing error merely returns');

}
};
{#line 1268 rawerror
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::is(scalar Basset::Object::Persistent->error("raw class error", "roe"), undef, "Set class error");
Test::More::is(scalar Basset::Object::Persistent->rawerror(), "raw class error", "Class raw error accesses");
Test::More::is(scalar Basset::Object::Persistent->error(["raw class error %d"], "roe"), undef, "Set formatted class error");
Test::More::is(ref Basset::Object::Persistent->rawerror(), 'ARRAY', "Class formatted raw error accesses");
Test::More::is(Basset::Object::Persistent->rawerror()->[0], "raw class error %d", "Class formatted raw error accesses");

Test::More::is(scalar $o->error("raw object error", "roe"), undef, "Set object error");
Test::More::is(scalar $o->rawerror(), "raw object error", "Object raw error accesses");
Test::More::is(scalar $o->error(["raw object error %d"], "roe"), undef, "Set formatted object error");
Test::More::is(ref $o->rawerror(), 'ARRAY', "Object formatted raw error accesses");
Test::More::is($o->rawerror()->[0], 'raw object error %d', "Object formatted raw error accesses");
Test::More::ok(ref $o->rawerror() eq 'ARRAY', "Class formatted raw error unaffected");
Test::More::is(Basset::Object::Persistent->rawerror()->[0], "raw class error %d", "Class formatted raw error unaffected");
};
{#line 1321 errcode
Test::More::is(scalar Basset::Object::Persistent->error("test error", "test code", "silently"), undef, "Class sets errcode");
Test::More::is(scalar Basset::Object::Persistent->errcode(), "test code", "Class accesses");
};
{#line 1348 errstring
Test::More::is(scalar Basset::Object::Persistent->error("test error", "test code"), undef, "Class sets error & errcode");
Test::More::is(Basset::Object::Persistent->errstring(), "test error...with code (test code)", "Class accesses errstring");

Test::More::is(scalar Basset::Object::Persistent->error("test error2", "test code2", "silently"), undef, "Class silently sets error & errcode");
Test::More::is(Basset::Object::Persistent->errstring(), "test error2...with code (test code2)", "Class accesses errstring");

Test::More::is(scalar Basset::Object::Persistent->error("test error3"), undef, "Class sets error & no errcode");
Test::More::is(Basset::Object::Persistent->errstring(), "test error3...with code (code undefined)", "Class accesses errstring");

Test::More::is(scalar Basset::Object::Persistent->error("test error4", undef, "silently"), undef, "Class silently sets error & no errcode");
Test::More::is(Basset::Object::Persistent->errstring(), "test error4...with code (code undefined)", "Class accesses errstring");

Basset::Object::Persistent->wipe_errors();

Test::More::is(scalar(Basset::Object::Persistent->errstring), undef, 'errcode returns nothing w/o error and errcode');
Basset::Object::Persistent->errcode('test code');
Test::More::is(Basset::Object::Persistent->errstring, 'error undefined...with code (test code)', 'errcode returns undefined w/o error');
};
{#line 1401 errvals
my $notes = 0;

sub notifier2 {
	my $self = shift;
	my $note = shift;
	$notes++;
};

my $center = Basset::Object::Persistent->pkg_for_type('notificationcenter');
Test::More::ok($center, "Got notification center class");


Test::More::ok(
	$center->addObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'error',
		'object' => 'all',
		'method' => 'notifier2'
	), "Added observer for error notifications"
);

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::is(scalar $o->error("test error", "test code"), undef, "Object set error");
Test::More::is($notes, 1, "Posted notification");

my @errvals = $o->errvals;
Test::More::is($notes, 1, "No notification");
Test::More::is($errvals[0], "test error", "Object accesses error");
Test::More::is($notes, 1, "No notification");
Test::More::is($errvals[1], "test code", "Object accesses error");
Test::More::is($notes, 1, "No notification");
Test::More::is($errvals[2], "silently", "errvals always silent");
Test::More::is($notes, 1, "No notification");

Test::More::ok(
	$center->removeObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'error',
	), "Removed observer for error notifications"
);
};
{#line 1475 usererror
my $translator = Basset::Object::Persistent->errortranslator();
Test::More::ok(Basset::Object::Persistent->errortranslator(
	{
		'test code' => "friendly test message",
		'formatted test error %d' => "friendlier test message",
		'formatted test error 7' => 'friendliest test message',
		'extra error' => 'friendliest test message 2'
	}),
	'Class set error translator'
);

my $uses_real = Basset::Object::Persistent->use_real_errors();
Test::More::is(Basset::Object::Persistent->use_real_errors(0), 0, "Uses real errors");

Test::More::is(scalar Basset::Object::Persistent->error("extra error", "test code"), undef, "Class sets error");
Test::More::is(Basset::Object::Persistent->usererror(), "friendliest test message 2", "Class gets user error for literal");

Test::More::is(scalar Basset::Object::Persistent->error(["formatted test error %d", 7], "test code"), undef, "Class sets formatted error");
Test::More::is(Basset::Object::Persistent->usererror(), "friendliest test message", "Class gets user error for formatted string");

Test::More::is(scalar Basset::Object::Persistent->error(["formatted test error %d", 9], "test code"), undef, "Class sets formatted error");
Test::More::is(Basset::Object::Persistent->usererror(), "friendlier test message", "Class gets user error for string format");

Test::More::is(scalar Basset::Object::Persistent->error("Some test error", "test code"), undef, "Class sets standard error");
Test::More::is(Basset::Object::Persistent->usererror(), "friendly test message", "Class gets user error for error code");

Test::More::is(scalar Basset::Object::Persistent->error("Some unknown error", "unknown code"), undef, "Class sets standard error w/o translation");
Test::More::is(Basset::Object::Persistent->usererror(), "Some unknown error", "Class gets no user error");

Test::More::ok(Basset::Object::Persistent->errortranslator(
	{
		'test code' => "friendly test message",
		'formatted test error %d' => "friendlier test message",
		'formatted test error 7' => 'friendliest test message',
		'extra error' => 'friendliest test message 2',
		'*' => 'star error',
	}),
	'Class changed error translator'
);

Test::More::is(scalar Basset::Object::Persistent->error("Some unknown error", "unknown code"), undef, "Class sets standard error w/o translation");
Test::More::is(Basset::Object::Persistent->usererror(), "star error", "Class gets star error");

Test::More::is(Basset::Object::Persistent->errortranslator($translator), $translator, 'Class reset error translator');
Test::More::is(Basset::Object::Persistent->use_real_errors($uses_real), $uses_real, "resets uses real errors");
};
{#line 1576 wipe_errors
Test::More::is(scalar Basset::Object::Persistent->error("test error", "error code"), undef, "Class set error and errcode");
Test::More::is(Basset::Object::Persistent->error(), "test error", "Class accesses error");
Test::More::is(Basset::Object::Persistent->errcode(), "error code", "Class accesses errcode");
Test::More::ok(Basset::Object::Persistent->wipe_errors(), "Class wiped errors");
Test::More::is(Basset::Object::Persistent->error(), undef, "Class error wiped out");
Test::More::is(Basset::Object::Persistent->errcode(), undef, "Class errcode wiped out");

my $confClass = Basset::Object::Persistent->pkg_for_type('conf');
Test::More::ok($confClass, "Got conf");

my $cfg = $confClass->conf;
Test::More::ok($cfg, "Got configuration");

Test::More::ok($cfg->{"Basset::Object"}->{'exceptions'} = 1, "enables exceptions");

eval {
	Basset::Object::Persistent->error("test exception", "test exception code");
};
Test::More::ok($@, "Caught exception");
Test::More::like($@, qr/test exception code/, "Exception matches");
Test::More::like(Basset::Object::Persistent->last_exception, qr/test exception/, "Exception is present");
Test::More::ok(Basset::Object::Persistent->wipe_errors(), "Class wiped errors");
Test::More::is(Basset::Object::Persistent->last_exception, undef, "last exception wiped out");
Test::More::is($cfg->{"Basset::Object"}->{'exceptions'} = 0, 0,"disables exceptions");
};
{#line 1649 notify
my $test1notes = undef;
my $test2notes = undef;

sub test1notifier {
	my $self = shift;
	my $note = shift;
	$test1notes = $note->{'args'}->[0];
};

sub test2notifier {
	my $self = shift;
	my $note = shift;
	$test2notes = $note->{'args'}->[0];
};

my $center = Basset::Object::Persistent->pkg_for_type('notificationcenter');
Test::More::ok($center, "Got notification center class");

Test::More::ok(
	$center->addObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'test1',
		'object' => 'all',
		'method' => 'test1notifier'
	), "Added observer for test1 notifications"
);

Test::More::ok(
	$center->addObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'test2',
		'object' => 'all',
		'method' => 'test2notifier'
	), "Added observer for test2 notifications"
);


my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Object created");

Test::More::ok(Basset::Object::Persistent->notify('test1', "Test 1 note 1"), "Class posted notification");
Test::More::is($test1notes, "Test 1 note 1", "Received note");
Test::More::is($test2notes, undef, "No note for test 2");

Test::More::ok(Basset::Object::Persistent->notify('test2', "Test 2 note 2"), "Class posted notification");
Test::More::is($test2notes, "Test 2 note 2", "Received note");
Test::More::is($test1notes, "Test 1 note 1", "Test 1 note unchanged");

Test::More::ok(
	$center->removeObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'test1',
	), "Removed observer for test1 notifications"
);

Test::More::ok(
	$center->addObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'test1',
		'object' => $o,
		'method' => 'test1notifier'
	), "Added specific observer for test1 notifications"
);

Test::More::ok(Basset::Object::Persistent->notify('test1', 'Test 1 note 2'), "Class posted notification");
Test::More::is($test1notes, "Test 1 note 1", "Test 1 note unchanged");
Test::More::is($test2notes, "Test 2 note 2", "Test 2 note unchanged");

Test::More::ok($o->notify('test1', 'Test 1 note 3'), "Object posted notification");
Test::More::is($test1notes, "Test 1 note 3", "Recieved note");

Test::More::is($test2notes, "Test 2 note 2", "Test 2 note unchanged");



Test::More::ok(
	$center->removeObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'test1',
	), "Removed observer for test1 notifications"
);


Test::More::ok(
	$center->removeObserver(
		'observer' => 'Basset::Object::Persistent',
		'notification'	=> 'test2',
	), "Removed observer for test2 notifications"
);
};
{#line 1803 add_restrictions
package Basset::Test::Testing::Basset::Object::Persistent::add_restrictions::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

my %restrictions = (
	'specialerror' => [
		'error' => 'error2',
		'errcode' => 'errcode2'
	],
	'invalidrestriction' => [
		'junkymethod' => 'otherjunkymethod'
	]
);

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::add_restrictions::Subclass1->add_restrictions(%restrictions), "Added restrictions to subclass");
};
{#line 1872 add_restricted_method
package Basset::Test::Testing::Basset::Object::Persistent::add_restricted_method::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

my %restrictions = (
	'specialerror' => [
		'error' => 'error2',
		'errcode' => 'errcode2'
	],
	'invalidrestriction' => [
		'junkymethod' => 'otherjunkymethod'
	]
);

Basset::Object::Persistent->add_class_attr('e2');
Basset::Object::Persistent->add_class_attr('c2');

Test::More::is(Basset::Object::Persistent->e2(0), 0, "set e2 to 0");
Test::More::is(Basset::Object::Persistent->c2(0), 0, "set c2 to 0");

sub error2 {
	my $self = shift;
	$self->e2($self->e2 + 1);
	return $self->SUPER::error(@_);
}

sub errcode2 {
	my $self = shift;
	$self->c2($self->c2 + 1);
	return $self->SUPER::errcode(@_);
}

Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::add_restricted_method::Subclass1->add_restrictions(%restrictions), "Added restrictions to subclass");

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::add_restricted_method::Subclass1->isa('Basset::Object::Persistent'), 'Proper subclass');

my $subclass = Basset::Test::Testing::Basset::Object::Persistent::add_restricted_method::Subclass1->inline_class();
Test::More::ok(scalar $subclass, "Got restricted class");
Test::More::ok($subclass->restricted, "Subclass is restricted");
Test::More::ok(scalar $subclass->isa('Basset::Test::Testing::Basset::Object::Persistent::add_restricted_method::Subclass1'), "Is subclass");
Test::More::ok(scalar $subclass->isa('Basset::Object::Persistent'), "Is subclass");

Test::More::ok(scalar $subclass->add_restricted_method('specialerror', 'error'), "Restricted error");
Test::More::ok(scalar $subclass->add_restricted_method('specialerror', 'errcode'), "Restricted errcode");
Test::More::ok(! scalar $subclass->add_restricted_method('invalidrestriction', 'junkymethod'), "Could not add invalid restriction");

Test::More::ok(! scalar $subclass->add_restricted_method('specialerror', 'error2'), "Could not add invalid restricted method");
Test::More::ok(! scalar $subclass->add_restricted_method('specialerror', 'errcode2'), "Could not add invalid restricted method");
Test::More::ok(! scalar $subclass->add_restricted_method('specialerror', 'junkymethod2'), "Could not add invalid restricted method");

my $e2 = $subclass->e2;
my $c2 = $subclass->c2;

#we post silently or else error and errcode would be called when it posts the error notification.
Test::More::is(scalar $subclass->error("test error", "test code", "silently"), undef, "Set error for subclass");

Test::More::is($subclass->e2, $e2 + 1, "Subclass restricted error incremented");
Test::More::is($subclass->c2, $c2, "Subclass restricted errcode unchanged");
Test::More::is($subclass->error(), "test error", "Subclass accesses error method");
Test::More::is($subclass->e2, $e2 + 2, "Subclass restricted error incremented");
Test::More::is($subclass->c2, $c2, "Subclass restricted errcode unchanged");
Test::More::is($subclass->errcode(), "test code", "Subclass accesses errcode method");
Test::More::is($subclass->e2, $e2 + 2, "Subclass restricted error unchanged");
Test::More::is($subclass->c2, $c2 + 1, "Subclass restricted errcode incremented");

Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::add_restricted_method::Subclass1->error("super test error", "super test code", "silently"), undef, "Superclass sets error");
Test::More::is($subclass->e2, $e2 + 2, "Subclass restricted error unchanged");
Test::More::is($subclass->c2, $c2 + 1, "Subclass restricted errcode unchanged");
};
{#line 2009 failed_restricted_method
package Basset::Test::Testing::Basset::Object::Persistent::failed_restricted_method::Subclass2;
our @ISA = qw(Basset::Object::Persistent);

sub successful {
	return 1;
};

my %restrictions = (
	'failure' => [
		'successful' => 'failed_restricted_method',
	],
);

package Basset::Object::Persistent;

my $subclass = Basset::Test::Testing::Basset::Object::Persistent::failed_restricted_method::Subclass2->inline_class;
Test::More::ok($subclass, "Got restricted subclass");
Test::More::ok(scalar $subclass->restricted, "Subclass is restricted");
Test::More::ok(scalar $subclass->add_restrictions(%restrictions), "Subclass added restrictions");

Test::More::ok(! scalar Basset::Object::Persistent->failed_restricted_method, "Failed restricted method always fails");
Test::More::ok(! scalar Basset::Test::Testing::Basset::Object::Persistent::failed_restricted_method::Subclass2->failed_restricted_method, "Failed restricted method always fails");
Test::More::ok(! scalar $subclass->failed_restricted_method, "Failed restricted method always fails");

Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::failed_restricted_method::Subclass2->successful, "Super Success is successful");
Test::More::ok(scalar $subclass->successful, "Subclass success is successful");
Test::More::ok(scalar $subclass->add_restricted_method('failure', 'successful'), "Restricted subclass to fail upon success");
Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::failed_restricted_method::Subclass2->successful, "Super Success is successful");
Test::More::ok(! scalar $subclass->successful, "Subclass success fails");
};
{#line 2063 inline_class
my $class = Basset::Object::Persistent->inline_class();
Test::More::ok($class, "Got restricted class");
Test::More::ok($class->restricted(), "Class is restricted");
Test::More::ok(! Basset::Object::Persistent->restricted(), "Superclass is not restricted");
};
{#line 2107 restrict
package Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

sub successful {
	return 1;
};

my %restrictions = (
	'failure' => [
		'successful' => 'failed_restricted_method',
	],
);

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->add_restrictions(%restrictions), "Subclass added restrictions");

package Basset::Object::Persistent;

Test::More::ok(scalar Basset::Object::Persistent->can('failed_restricted_method'), "Basset::Object::Persistent has failed_restricted_method");
Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->can('failed_restricted_method'), "Subclass has failed_restricted_method");

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->isa('Basset::Object::Persistent'), 'Proper subclass');
Test::More::ok(! scalar Basset::Object::Persistent->failed_restricted_method, "Method properly fails");
Test::More::ok(! scalar Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->failed_restricted_method, "Method properly fails");

my $subclass = Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->restrict('failure');

Test::More::ok($subclass, "Got restricted subclass");

Test::More::ok($subclass->restricted, "Subclass is restricted");
Test::More::ok(! Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->restricted, "Superclass unaffected");
Test::More::ok(! Basset::Object::Persistent->restricted, "Superclass unaffected");

Test::More::ok(! scalar $subclass->successful, "Subclass restricted");
Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->successful, "Superclass unaffected");

Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::restrict::Subclass1->restrict('worthless restriction'), "Added unknown restriction");
};
{#line 2204 nonrestricted_parent
package Basset::Test::Testing::Basset::Object::Persistent::nonrestricted_parent::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

Test::More::is(Basset::Object::Persistent->nonrestricted_parent, "Basset::Object::Persistent", "Basset::Object::Persistent own nonrestricted parent");
Test::More::is(Basset::Test::Testing::Basset::Object::Persistent::nonrestricted_parent::Subclass1->nonrestricted_parent, "Basset::Test::Testing::Basset::Object::Persistent::nonrestricted_parent::Subclass1", "Subclass own nonrestricted parent");

my $subclass = Basset::Test::Testing::Basset::Object::Persistent::nonrestricted_parent::Subclass1->inline_class;
Test::More::ok($subclass, "Got restricted class");
Test::More::is($subclass->nonrestricted_parent, "Basset::Test::Testing::Basset::Object::Persistent::nonrestricted_parent::Subclass1", "Restricted class has proper non restricted parent");

my $subclass2 = $subclass->inline_class;
Test::More::ok($subclass2, "Got restricted class of restricted class");
Test::More::is($subclass2->nonrestricted_parent, "Basset::Test::Testing::Basset::Object::Persistent::nonrestricted_parent::Subclass1", "Restricted class has proper non restricted parent");

my $subclass3 = Basset::Object::Persistent->inline_class;
Test::More::ok($subclass3, "Got restricted class");
Test::More::is($subclass3->nonrestricted_parent, "Basset::Object::Persistent", "Restricted class has proper non restricted parent");
};
{#line 2262 dump
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Created object");
my $o2 = Basset::Object::Persistent->new();
Test::More::ok($o2, "Created object");

Test::More::ok($o->dump, "Dumped object");
Test::More::ok($o->dump(['a']), "Dumped array");
Test::More::ok($o->dump({'k' => 'v'}), "Dumped hash");
Test::More::ok($o2->dump, "Dumped other object");
Test::More::is($o->dump($o2), $o2->dump, "Dumps equal");
Test::More::is($o->dump, $o2->dump($o), "Dumps equal");
};
{#line 2335 new
my $o = Basset::Object::Persistent->new();

Test::More::ok($o, "created a new object");

package Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->add_attr('attr1');
Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->add_attr('attr2');
Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->add_attr('attr3');
Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->add_class_attr('class_attr');

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->isa('Basset::Object::Persistent'), "Subclass is subclass");
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->can('attr1'), 'class can attr1');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->can('attr2'), 'class can attr2');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->can('attr3'), 'class can attr3');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->can('class_attr'), 'class can class_attr');

my $o2 = Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->new();
Test::More::ok($o2, "created a subclass object");

my $o3 = Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->new(
	'attr1' => 'attr1val',
);

Test::More::ok($o3, "Created a subclass object");
Test::More::is(scalar $o3->attr1, 'attr1val', 'subclass object has attribute from constructor');

my $o4 = Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->new(
	'attr1' => 'attr1val',
	'attr2' => 'attr2val',
);

Test::More::ok($o4, "Created a subclass object");
Test::More::is(scalar $o4->attr1, 'attr1val', 'subclass object has attribute from constructor');
Test::More::is(scalar $o4->attr2, 'attr2val', 'subclass object has attribute from constructor');

my $o5 = Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->new(
	'attr1' => 'attr1val',
	'attr2' => 'attr2val',
	'attr7' => 'attr7val',
	'attr8' => 'attr8val',
);

Test::More::ok($o5, "Created a subclass object w/junk values");
Test::More::is(scalar $o5->attr1, 'attr1val', 'subclass object has attribute from constructor');
Test::More::is(scalar $o5->attr2, 'attr2val', 'subclass object has attribute from constructor');

#these tests would now pass.
#my $o6 = Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->new(
#	'attr1' => undef,
#);
#
#Test::More::ok(! $o6, "Failed to create object w/undef value");

my $o7 = Basset::Test::Testing::Basset::Object::Persistent::new::Subclass1->new(
	'attr1' => 7,
	'attr2' => 0,
);

Test::More::ok($o7, "Created object w/0 value");
Test::More::is($o7->attr1, 7, 'attr1 value set');
Test::More::is($o7->attr2, 0, 'attr2 value set');
};
{#line 2451 init
package Basset::Test::Testing::Basset::Object::Persistent::init::Subclass2;
our @ISA = qw(Basset::Object::Persistent);

sub conf {
	return undef;
};

package Basset::Object::Persistent;

{
	my $o = undef;
	local $@ = undef;
	$o = Basset::Test::Testing::Basset::Object::Persistent::init::Subclass2->new();
	Test::More::is($o, undef, 'could not create object w/o conf file');
}

{
	my $o = Basset::Object::Persistent->new('__j_known_junk_method' => 'a');
	Test::More::ok($o, 'created object');
}
};
{#line 2532 pkg
package main::Basset::Test::Testing::Basset::Object::Persistent::MainSubClass;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Test::Testing::Basset::Object::Persistent::MainSubClass2;
our @ISA = qw(Basset::Object::Persistent);


package ::Basset::Test::Testing::Basset::Object::Persistent::MainSubClass3;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

Test::More::ok(main::Basset::Test::Testing::Basset::Object::Persistent::MainSubClass->isa('Basset::Object::Persistent'), "Created subclass");
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::MainSubClass2->isa('Basset::Object::Persistent'), "Created subclass");
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::MainSubClass3->isa('Basset::Object::Persistent'), "Created subclass");

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Created object");

my $so1 = main::Basset::Test::Testing::Basset::Object::Persistent::MainSubClass->new();
Test::More::ok($so1, "Created sub-object");

my $so2 = Basset::Test::Testing::Basset::Object::Persistent::MainSubClass2->new();
Test::More::ok($so2, "Created sub-object");

my $so3 = Basset::Test::Testing::Basset::Object::Persistent::MainSubClass3->new();
Test::More::ok($so3, "Created sub-object");

Test::More::is($o->pkg, "Basset::Object::Persistent", "Superclass works");
Test::More::is($so1->pkg, "Basset::Test::Testing::Basset::Object::Persistent::MainSubClass", "Subclass works");
Test::More::is($so2->pkg, "Basset::Test::Testing::Basset::Object::Persistent::MainSubClass2", "Subclass works");
Test::More::is($so3->pkg, "Basset::Test::Testing::Basset::Object::Persistent::MainSubClass3", "Subclass works");
};
{#line 2607 factory
package Basset::Test::Testing::Basset::Object::Persistent::factory::Subclass;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

my $oldtypes = Basset::Object::Persistent->types();
Test::More::ok($oldtypes, "Saved old types");
my $newtypes = {%$oldtypes, 'factory_test_type' => 'Basset::Object::Persistent'};
Test::More::is(Basset::Object::Persistent->types($newtypes), $newtypes, "Set new types");
Test::More::is(Basset::Object::Persistent->pkg_for_type('factory_test_type'), 'Basset::Object::Persistent', 'can get class for type');
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Created new object");
my $o2 = Basset::Object::Persistent->factory('type' => 'factory_test_type');
Test::More::ok($o2, "Factoried new object");
Test::More::ok($o2->isa('Basset::Object::Persistent'), "Factory object isa class object");
Test::More::is(Basset::Object::Persistent->types($oldtypes), $oldtypes, "reset old types");
};
{#line 2663 copy
package Basset::Test::Testing::Basset::Object::Persistent::copy::subclass;
our @ISA = qw(Basset::Object::Persistent);

Basset::Test::Testing::Basset::Object::Persistent::copy::subclass->add_attr('attr1');
Basset::Test::Testing::Basset::Object::Persistent::copy::subclass->add_attr('attr2');
Basset::Test::Testing::Basset::Object::Persistent::copy::subclass->add_attr('attr3');

package Basset::Object::Persistent;

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Instantiated object");
my $o2 = $o->copy;
Test::More::ok($o2, "Copied object");
Test::More::is(length $o->dump, length $o2->dump, "dumps are same size");

my $o3 = Basset::Test::Testing::Basset::Object::Persistent::copy::subclass->new(
	'attr1' => 'first attribute',
	'attr2' => 'second attribute',
	'attr3' => 'third attribute'
);

Test::More::ok($o3, "Instantiated sub-object");

Test::More::is($o3->attr1, 'first attribute', 'Subobject attr1 matches');
Test::More::is($o3->attr2, 'second attribute', 'Subobject attr2 matches');
Test::More::is($o3->attr3, 'third attribute', 'Subobject attr3 matches');

my $o4 = $o3->copy;

Test::More::ok($o4, "Copied sub-object");

Test::More::is($o4->attr1, 'first attribute', 'Copied subobject attr1 matches');
Test::More::is($o4->attr2, 'second attribute', 'Copied subobject attr2 matches');
Test::More::is($o4->attr3, 'third attribute', 'Copied subobject attr3 matches');

Test::More::is(length $o3->dump, length $o4->dump, "Sub object dumps are same size");

my $array = ['a', 2, {'foo' => 'bar'}];

Test::More::ok($array, "Got array");

my $array2 = Basset::Object::Persistent->copy($array);

Test::More::ok($array2, "Copied array");
Test::More::is($array->[0], $array2->[0], "First element matches");
Test::More::is($array->[1], $array2->[1], "Second element matches");
Test::More::is($array->[2]->{'foo'}, $array2->[2]->{'foo'}, "Third element matches");
};
{#line 2742 pkg_for_type
Test::More::ok(Basset::Object::Persistent->types, "Got types out of the conf file");
my $typesbkp = Basset::Object::Persistent->types();
my $newtypes = {%$typesbkp, 'testtype1' => 'Basset::Object::Persistent', 'testtype2' => 'boguspkg'};
Test::More::ok($typesbkp, "Backed up the types");
Test::More::is(Basset::Object::Persistent->types($newtypes), $newtypes, "Set new types");
Test::More::is(Basset::Object::Persistent->pkg_for_type('testtype1'), 'Basset::Object::Persistent', "Got class for new type");
Test::More::ok(! scalar Basset::Object::Persistent->pkg_for_type('testtype2'), "Could not access invalid type");
Test::More::is(Basset::Object::Persistent->errcode, 'BO-11', 'proper error code');

Basset::Object::Persistent->wipe_errors;
Test::More::is(scalar(Basset::Object::Persistent->pkg_for_type('testtype2', 'errorless')), undef, "Could not access invalid type w/ second arg");
Test::More::is(scalar(Basset::Object::Persistent->errcode), undef, 'no error code set w/second arg');
Test::More::is(scalar(Basset::Object::Persistent->errstring), undef, 'no error string set w/second arg');

my $h = {};

Test::More::is(Basset::Object::Persistent->types($h), $h, 'wiped out types');
Test::More::is(scalar(Basset::Object::Persistent->pkg_for_type('testtype3')), undef, 'could not get type w/o types');
Test::More::is(Basset::Object::Persistent->errcode, 'BO-09', 'proper error code for no types');

Test::More::is(Basset::Object::Persistent->types($typesbkp), $typesbkp, "Re-set original types");
};
{#line 2911 inherits
package Basset::Test::Testing::Basset::Object::Persistent::inherits::Subclass1;
Basset::Object::Persistent->inherits('Basset::Test::Testing::Basset::Object::Persistent::inherits::Subclass1', 'object');

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::inherits::Subclass1->isa('Basset::Object'), 'subclass inherits from root');
};
{#line 2953 isa_path
Test::More::ok(Basset::Object::Persistent->isa_path, "Can get an isa_path for root");
my $path = Basset::Object::Persistent->isa_path;
Test::More::is($path->[-1], 'Basset::Object::Persistent', 'Class has self at end of path');

package Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass2;
our @ISA = qw(Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1);

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1->isa('Basset::Object::Persistent'), 'Subclass of Basset::Object::Persistent');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass2->isa('Basset::Object::Persistent'), 'Sub-subclass of Basset::Object::Persistent');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1->isa('Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1'), 'Sub-subclass of subclass');

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1->isa_path, "We have a path");
my $subpath = Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1->isa_path;
Test::More::is($subpath->[-2], 'Basset::Object::Persistent', 'Next to last entry is parent');
Test::More::is($subpath->[-1], 'Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1', 'Last entry is self');

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass2->isa_path, "We have a sub path");
my $subsubpath = Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass2->isa_path;

Test::More::is($subsubpath->[-3], 'Basset::Object::Persistent', 'Third to last entry is grandparent');
Test::More::is($subsubpath->[-2], 'Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass1', 'Second to last entry is parent');
Test::More::is($subsubpath->[-1], 'Basset::Test::Testing::Basset::Object::Persistent::isa_path::subclass2', 'Last entry is self');

package Basset::Test::Testing::Basset::Object::Persistent::isa_path::Subclass3;

our @ISA = qw(Basset::Object::Persistent Basset::Object::Persistent);

package Basset::Object::Persistent;

my $isa = Basset::Test::Testing::Basset::Object::Persistent::isa_path::Subclass3->isa_path;
Test::More::ok($isa, "Got isa path");

#Test::More::is(scalar(@$isa), 2, 'two entries in isa_path');
Test::More::is($isa->[-2], 'Basset::Object::Persistent', 'Second to last entry is parent');
Test::More::is($isa->[-1], 'Basset::Test::Testing::Basset::Object::Persistent::isa_path::Subclass3', 'Last entry is self');
};
{#line 3047 module_for_class
Test::More::is(scalar(Basset::Object::Persistent->module_for_class), undef, "Could not get module_for_class w/o package");
Test::More::is(Basset::Object::Persistent->errcode, "BO-20", 'proper error code');
Test::More::is(Basset::Object::Persistent->module_for_class('Basset::Object'), 'Basset/Object.pm', 'proper pkg -> file name');
Test::More::is(Basset::Object::Persistent->module_for_class('Basset::Object::Persistent'), 'Basset/Object/Persistent.pm', 'proper pkg -> file name');
Test::More::is(Basset::Object::Persistent->module_for_class('Basset::DB::Table'), 'Basset/DB/Table.pm', 'proper pkg -> file name');
};
{#line 3080 conf
Test::More::ok(scalar Basset::Object::Persistent->conf, "Class accessed conf file");
my $o = Basset::Object::Persistent->new();
Test::More::ok(scalar $o, "Got object");
Test::More::ok(scalar $o->conf, "Object accessed conf file");
};
{#line 3107 escape_for_html
Test::More::is(Basset::Object::Persistent->escape_for_html('&'), '&#38;', 'escapes &');
Test::More::is(Basset::Object::Persistent->escape_for_html('a&'), 'a&#38;', 'escapes &');
Test::More::is(Basset::Object::Persistent->escape_for_html('&b'), '&#38;b', 'escapes &');
Test::More::is(Basset::Object::Persistent->escape_for_html('a&b'), 'a&#38;b', 'escapes &');

Test::More::is(Basset::Object::Persistent->escape_for_html('"'), '&#34;', 'escapes "');
Test::More::is(Basset::Object::Persistent->escape_for_html('a"'), 'a&#34;', 'escapes "');
Test::More::is(Basset::Object::Persistent->escape_for_html('"b'), '&#34;b', 'escapes "');
Test::More::is(Basset::Object::Persistent->escape_for_html('a"b'), 'a&#34;b', 'escapes "');

Test::More::is(Basset::Object::Persistent->escape_for_html("'"), '&#39;', "escapes '");
Test::More::is(Basset::Object::Persistent->escape_for_html("a'"), 'a&#39;', "escapes '");
Test::More::is(Basset::Object::Persistent->escape_for_html("'b"), '&#39;b', "escapes '");
Test::More::is(Basset::Object::Persistent->escape_for_html("a'b"), 'a&#39;b', "escapes '");

Test::More::is(Basset::Object::Persistent->escape_for_html('<'), '&#60;', 'escapes <');
Test::More::is(Basset::Object::Persistent->escape_for_html('a<'), 'a&#60;', 'escapes <');
Test::More::is(Basset::Object::Persistent->escape_for_html('<b'), '&#60;b', 'escapes <');
Test::More::is(Basset::Object::Persistent->escape_for_html('a<b'), 'a&#60;b', 'escapes <');

Test::More::is(Basset::Object::Persistent->escape_for_html('>'), '&#62;', 'escapes >');
Test::More::is(Basset::Object::Persistent->escape_for_html('a>'), 'a&#62;', 'escapes >');
Test::More::is(Basset::Object::Persistent->escape_for_html('>b'), '&#62;b', 'escapes >');
Test::More::is(Basset::Object::Persistent->escape_for_html('a>b'), 'a&#62;b', 'escapes >');

Test::More::is(Basset::Object::Persistent->escape_for_html('&>'), '&#38;&#62;', 'escapes &>');
Test::More::is(Basset::Object::Persistent->escape_for_html('<">'), '&#60;&#34;&#62;', 'escapes <">');
Test::More::is(Basset::Object::Persistent->escape_for_html("&&'"), '&#38;&#38;&#39;', "escapes &&'");
Test::More::is(Basset::Object::Persistent->escape_for_html('<&'), '&#60;&#38;', 'escapes <&');
Test::More::is(Basset::Object::Persistent->escape_for_html(q('"'')), '&#39;&#34;&#39;&#39;', q(escapes '"''));

Test::More::is(Basset::Object::Persistent->escape_for_html(), undef, 'escaped nothing returns undef');
Test::More::is(Basset::Object::Persistent->escape_for_html(undef), undef, 'escaped undef returns nothing');
};
{#line 3171 today
Test::More::like(Basset::Object::Persistent->today, qr/^\d\d\d\d-\d\d-\d\d$/, 'matches date regex');
Test::More::like(Basset::Object::Persistent->today('abc'), qr/^\d\d\d\d-\d\d-\d\d$/, 'matches date regex despite input');
};
{#line 3194 now
Test::More::like(Basset::Object::Persistent->now, qr/^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d$/, 'matches timestamp regex');
Test::More::like(Basset::Object::Persistent->now('def'), qr/^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d$/, 'matches timestamp regex despite input');
};
{#line 3223 gen_handle
Test::More::ok(Basset::Object::Persistent->gen_handle, "Generated handle");
my $h = Basset::Object::Persistent->gen_handle;
Test::More::ok($h, "Generated second handle");
Test::More::is(ref $h, "GLOB", "And it's a globref");
};
{#line 3298 perform
package Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass;
our @ISA = qw(Basset::Object::Persistent);

Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->add_attr('attr1');
Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->add_attr('attr2');
Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->add_attr('attr3');

sub method1 {
	return 77;
}

sub method2 {
	my $self = shift;
	return scalar @_;
};

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->isa('Basset::Object::Persistent'), 'we have a subclass');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->can('attr1'), 'subclass has attr1');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->can('attr2'), 'subclass has attr2');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->can('attr2'), 'subclass has attr3');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->can('method1'), 'subclass has method1');
Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->can('method2'), 'subclass has method2');
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->method1, 77, 'method1 returns 77');
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->method2, 0, 'method2 behaves as expected');
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->method2('a'), 1, 'method2 behaves as expected');
Test::More::is(scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->method2(0,0), 2, 'method2 behaves as expected');

my $o = Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->new();

Test::More::ok($o, "Instantiated object");

my $class = 'Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass';

Test::More::is(scalar($class->perform), undef, "Cannot perform w/o method");
Test::More::is($class->errcode, 'BO-04', 'proper error code');
Test::More::is(scalar($class->perform('methods' => 'able')), undef, "Cannot perform w/o values");
Test::More::is($class->errcode, 'BO-05', 'proper error code');
Test::More::is(scalar($class->perform('methods' => 'able', 'values' => 'baker')), undef, "methods must be arrayref");
Test::More::is($class->errcode, 'BO-11', 'proper error code');
Test::More::is(scalar($class->perform('methods' => ['able'], 'values' => 'baker')), undef, "values must be arrayref");
Test::More::is($class->errcode, 'BO-12', 'proper error code');


Test::More::ok(
	scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->perform(
		'methods' => ['method1'],
		'values' => ['a'],
	),
	"Class performs method1");

Test::More::ok(
	scalar $o->perform(
		'methods' => ['method1'],
		'values' => ['a'],
	),
	"Object performs method1");

Test::More::ok(! 
	scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->perform(
		'methods' => ['method2'],
		'values' => [],
	),
	"Class cannot perform method2 w/o args");

Test::More::ok(
	scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->perform(
		'methods' => ['method2'],
		'values' => ['a']
	),
	"Class performs method2 w/1 arg");

Test::More::ok(
	scalar Basset::Test::Testing::Basset::Object::Persistent::perform::Subclass->perform(
		'methods' => ['method2'],
		'values' => ['b'],
	),
	"Class performs method2 w/1 arg in arrayref");

Test::More::ok(! 
	scalar $o->perform(
		'methods' => ['attr1'],
		'values' => []
	),
	"object cannot access attribute w/o args"
);

Test::More::is(scalar $o->attr1, undef, 'attr1 is undefined');
Test::More::is(scalar $o->attr2, undef, 'attr2 is undefined');
Test::More::is(scalar $o->attr3, undef, 'attr3 is undefined');

Test::More::ok(
	scalar $o->perform(
		'methods' => ['attr1'],
		'values' => ['attr1_val']
	),
	"object performed attr1"
);

Test::More::is(scalar $o->attr1(), 'attr1_val', 'attr1 set via perform');

Test::More::ok(
	scalar $o->perform(
		'methods' => ['attr2', 'attr3'],
		'values' => ['attr2_val', 'attr3_val']
	),
	"object performed attr2, attr3"
);

Test::More::is(scalar $o->attr2(), 'attr2_val', 'attr2 set via perform');
Test::More::is(scalar $o->attr3(), 'attr3_val', 'attr3 set via perform');

Test::More::ok(! 
	scalar $o->perform(
		'methods' => ['attr4'],
		'values' => ['attr4_val']
	),
	"object cannot perform unknown method"
);

Test::More::ok(! 
	scalar $o->perform(
		'methods' => ['attr4', 'attr2'],
		'values' => ['attr4_val', 'attr2_val_2'],
	),
	'object cannot perform unknown method w/known method'
);

Test::More::is(scalar $o->attr2, 'attr2_val', 'attr2 unchanged');

Test::More::ok(! 
	scalar $o->perform(
		'methods' => ['attr1'],
		'values' => [undef]
	),
	"object failed trying to perform attr1"
);


Test::More::ok(! 
	scalar $o->perform(
		'methods' => ['attr1', 'attr2'],
		'values' => [undef, 'attr2_val_2'],
	),
	'object failed trying to perform attr1'
);

Test::More::is(scalar $o->attr2, 'attr2_val', 'attr2 unchanged');

Test::More::ok(! 
	scalar $o->perform(
		'methods' => ['attr1', 'attr2'],
		'values' => [undef, 'attr2_val_2'],
		'continue' => 1,
	),
	'object failed trying to perform attr1'
);

Test::More::is(scalar $o->attr2, 'attr2_val_2', 'attr2 changed due to continue');

my $arr = ['a', 'b'];
Test::More::ok($arr, "Have an arrayref");

Test::More::ok(
	scalar $o->perform(
		'methods' => ['attr3'],
		'values' => [$arr],
	),
	"Performed attr3"
);

Test::More::is($o->attr3, $arr, "attr3 contains arrayref");

Test::More::ok(
	scalar $o->perform(
		'methods' => ['attr3'],
		'values' => [$arr],
		'dereference' => ['attr3'],
	),
	"Performed attr3 with de-reference"
);

Test::More::is($o->attr3, 'a', "attr3 contains first element of arrayref");

Test::More::ok(
	scalar $o->perform(
		'methods' => ['attr2', 'attr3'],
		'values' => [$arr, $arr],
		'dereference' => ['attr2'],
	),
	"Performed attr3 with de-reference"
);

Test::More::is($o->attr2, 'a', "attr2 contains first element of arrayref");
Test::More::is($o->attr3, $arr, "attr3 contains arrayref");
};
{#line 3569 stack_trace
sub tracer {
	return Basset::Object::Persistent->stack_trace;
};

Test::More::ok(tracer(), "Got a stack trace");
my $trace = tracer();
Test::More::ok($trace, "Has a stack trace");
Test::More::like($trace, qr/Package:/, "Contains word: 'Package:'");
Test::More::like($trace, qr/Filename:/, "Contains word: 'Filename:'");
Test::More::like($trace, qr/Line number:/, "Contains word: 'Line number:'");
Test::More::like($trace, qr/Subroutine:/, "Contains word: 'Subroutine:'");
Test::More::like($trace, qr/Has Args\? :/, "Contains word: 'Has Args:'");
Test::More::like($trace, qr/Want array\? :/, "Contains word: 'Want array:'");
Test::More::like($trace, qr/Evaltext:/, "Contains word: 'Evaltext:'");
Test::More::like($trace, qr/Is require\? :/, "Contains word: 'Is require:'");
};
{#line 3621 no_op
Test::More::ok(Basset::Object::Persistent->no_op, "No op");
Test::More::is(Basset::Object::Persistent->no_op, 1, "No op is 1");
my $obj = Basset::Object::Persistent->new();
Test::More::ok($obj, "Got object");
Test::More::ok($obj->no_op, "Object no ops");
Test::More::is($obj->no_op, 1, "Object no op is 1");
};
{#line 3645 system_prefix
Test::More::is(Basset::Object::Persistent->system_prefix(), '__b_', 'expected system prefix');
};
{#line 3677 privatize
Test::More::ok(! Basset::Object::Persistent->privatize, 'Cannot privatize w/o method');
Test::More::is(Basset::Object::Persistent->errcode, "BO-24", "proper error code");

Test::More::is(Basset::Object::Persistent->privatize('foo'), '__b_foo', "privatized foo");
Test::More::is(Basset::Object::Persistent->privatize('__b_foo'), '__b_foo', "__b_foo remains __b_foo");
};
{#line 3715 deprivatize
Test::More::ok(! Basset::Object::Persistent->deprivatize, 'Cannot deprivatize w/o method');
Test::More::is(Basset::Object::Persistent->errcode, "BO-25", "proper error code");

Test::More::is(Basset::Object::Persistent->deprivatize('foo'), 'foo', "deprivatized foo");
Test::More::is(Basset::Object::Persistent->deprivatize('__b_foo'), 'foo', "deprivatized __b_foo");
};
{#line 3748 deprivatize
Test::More::ok(! Basset::Object::Persistent->is_private, 'Cannot is_private w/o method');
Test::More::is(Basset::Object::Persistent->errcode, "BO-26", "proper error code");

Test::More::ok(! Basset::Object::Persistent->is_private('foo'), 'foo is not private');
Test::More::ok(Basset::Object::Persistent->is_private('__b_foo'), '__b_foo is private');
};
{#line 3807 cast
package Basset::Test::Testing::Basset::Object::Persistent::cast::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

#pretend it was loaded normally
$INC{Basset::Object::Persistent->module_for_class("Basset::Test::Testing::Basset::Object::Persistent::cast::Subclass1")}++;

my $subclass = "Basset::Test::Testing::Basset::Object::Persistent::cast::Subclass1";

Test::More::ok(! Basset::Object::Persistent->cast, "Cannot cast classes");
Test::More::is(Basset::Object::Persistent->errcode, "BO-21", "proper error code");

my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "got object");

Test::More::ok(! $o->cast, "Cannot cast w/o class");
Test::More::is($o->errcode, "BO-22", "proper error code");
my $c = $o->cast($subclass, 'copy');
Test::More::ok($c, "casted object");
Test::More::is($o->pkg, "Basset::Object::Persistent", "original part of super package");
Test::More::is($c->pkg, $subclass, "casted object part of sub package");
Test::More::is($c->errcode, $o->errcode, "error codes match, rest is assumed");

my $o2 = Basset::Object::Persistent->new();
Test::More::ok($o2, "got object");

Test::More::ok(! $o2->cast, "Cannot cast w/o class");
Test::More::is($o2->errcode, "BO-22", "proper error code");
my $c2 = $o2->cast($subclass, 'copy');
Test::More::ok($c2, "casted object");
Test::More::is($o2->pkg, "Basset::Object::Persistent", "original part of super package");
Test::More::is($c2->pkg, $subclass, "casted object part of sub package");
Test::More::is($c2->errcode, $o->errcode, "error codes match, rest is assumed");
};
{#line 3907 errortranslator
my $uses_real = Basset::Object::Persistent->use_real_errors();
Test::More::is(Basset::Object::Persistent->use_real_errors(0), 0, "Uses real errors");

my $translator = {
	'test error' => 'test message'
};

Test::More::ok($translator, "Created translator");
Test::More::is(Basset::Object::Persistent->errortranslator($translator), $translator, "Set translator");
Test::More::is(scalar Basset::Object::Persistent->error('test error', 'test code'), undef, "Set error");
Test::More::is(Basset::Object::Persistent->usererror(), 'test message', 'Re-wrote error message');

Test::More::is(Basset::Object::Persistent->errortranslator($uses_real), $uses_real, 'Class reset uses real error');
};
{#line 3939 use_real_errors
my $translator = Basset::Object::Persistent->errortranslator();
Test::More::ok(Basset::Object::Persistent->errortranslator(
	{
		'test code' => "friendly test message",
		'formatted test error %d' => "friendlier test message",
		'formatted test error 7' => 'friendliest test message',
		'extra error' => 'friendliest test message 2'
	}),
	'Class set error translator'
);

my $uses_real = Basset::Object::Persistent->use_real_errors();

my $confClass = Basset::Object::Persistent->pkg_for_type('conf');
Test::More::ok($confClass, "Got conf");

my $cfg = $confClass->conf;
Test::More::ok($cfg, "Got configuration");

Test::More::ok($cfg->{"Basset::Object"}->{'use_real_errors'} = 1, "enables real errors");

Test::More::is(scalar Basset::Object::Persistent->error("extra error", "test code"), undef, "Class sets error");
Test::More::is(Basset::Object::Persistent->usererror(), "extra error...with code (test code)", "Class gets literal error for literal");

Test::More::is(scalar Basset::Object::Persistent->error(["formatted test error %d", 7], "test code"), undef, "Class sets formatted error");
Test::More::is(Basset::Object::Persistent->usererror(), "formatted test error 7...with code (test code)", "Class gets literal error for formatted string");

Test::More::is(scalar Basset::Object::Persistent->error(["formatted test error %d", 9], "test code"), undef, "Class sets formatted error");
Test::More::is(Basset::Object::Persistent->usererror(), "formatted test error 9...with code (test code)", "Class gets literal error for string format");

Test::More::is(scalar Basset::Object::Persistent->error("Some test error", "test code"), undef, "Class sets standard error");
Test::More::is(Basset::Object::Persistent->usererror(), "Some test error...with code (test code)", "Class gets literal error for error code");

Test::More::is(scalar Basset::Object::Persistent->error("Some unknown error", "unknown code"), undef, "Class sets standard error w/o translation");
Test::More::is(Basset::Object::Persistent->usererror(), "Some unknown error...with code (unknown code)", "Class gets no user error");

Test::More::ok(Basset::Object::Persistent->errortranslator(
	{
		'test code' => "friendly test message",
		'formatted test error %d' => "friendlier test message",
		'formatted test error 7' => 'friendliest test message',
		'extra error' => 'friendliest test message 2',
		'*' => 'star error',
	}),
	'Class changed error translator'
);

Test::More::is(scalar Basset::Object::Persistent->error("Some unknown error", "unknown code"), undef, "Class sets standard error w/o translation");
Test::More::is(Basset::Object::Persistent->usererror(), "Some unknown error...with code (unknown code)", "Class gets literal star error");

Test::More::is(Basset::Object::Persistent->errortranslator($translator), $translator, 'Class reset error translator');
#Test::More::is(Basset::Object::Persistent->errortranslator($uses_real), $uses_real, 'Class reset uses real error');
#Test::More::ok('foo', 'bar');
Test::More::is($cfg->{"Basset::Object::Persistent"}->{'use_real_errors'} = $uses_real, $uses_real, "enables reset uses real errors");
};
{#line 4021 delegate
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Set up object");
my $o2 = Basset::Object::Persistent->new();
Test::More::ok($o2, "Set up second object");
Test::More::ok(! scalar Basset::Object::Persistent->delegate($o), "Class cannot set delegate");
Test::More::is(scalar $o->delegate($o2), $o2, "Object set delegate");
Test::More::is(scalar $o->delegate(), $o2, "Object accessed delegate");
Test::More::is(scalar $o->delegate(undef), undef, "Object deleted delegate");
};
{#line 4054 types
Test::More::ok(Basset::Object::Persistent->types, "Got types out of the conf file");
my $typesbkp = Basset::Object::Persistent->types();
my $newtypes = {%$typesbkp, 'testtype1' => 'Basset::Object::Persistent', 'testtype2' => 'boguspkg'};
Test::More::ok($typesbkp, "Backed up the types");
Test::More::is(Basset::Object::Persistent->types($newtypes), $newtypes, "Set new types");
Test::More::is(Basset::Object::Persistent->pkg_for_type('testtype1'), 'Basset::Object::Persistent', "Got class for new type");
Test::More::ok(! scalar Basset::Object::Persistent->pkg_for_type('testtype2'), "Could not access invalid type");
Test::More::is(Basset::Object::Persistent->types($typesbkp), $typesbkp, "Re-set original types");
};
{#line 4083 restrictions
package Basset::Test::Testing::Basset::Object::Persistent::restrictions::subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::restrictions::subclass1->isa('Basset::Object::Persistent'), 'proper subclass');
my $restrictions = {
	'foo' => [
		'a' => 'b'
	]
};
Test::More::ok($restrictions, 'made restrictions');
Test::More::is(Basset::Test::Testing::Basset::Object::Persistent::restrictions::subclass1->restrictions($restrictions), $restrictions, 'added restrictions');
Test::More::is(Basset::Test::Testing::Basset::Object::Persistent::restrictions::subclass1->restrictions, $restrictions, 'accessed restrictions');
};
{#line 4107 applied_restrictions
package Basset::Test::Testing::Basset::Object::Persistent::applied_restrictions::Subclass;
our @ISA = qw(Basset::Object::Persistent);

my %restrictions = (
	'specialerror' => [
		'error' => 'error3',
		'errcode' => 'errcode3'
	],
	'invalidrestriction' => [
		'junkymethod' => 'otherjunkymethod'
	]
);

Basset::Object::Persistent->add_class_attr('e3');
Basset::Object::Persistent->add_class_attr('c3');

Test::More::is(Basset::Object::Persistent->e3(0), 0, "set e3 to 0");
Test::More::is(Basset::Object::Persistent->c3(0), 0, "set c3 to 0");

sub error3 {
	my $self = shift;
	$self->e3($self->e3 + 1);
	return $self->SUPER::error(@_);
}

sub errcode3 {
	my $self = shift;
	$self->c3($self->c3 + 1);
	return $self->SUPER::errcode(@_);
}

Test::More::ok(scalar Basset::Test::Testing::Basset::Object::Persistent::applied_restrictions::Subclass->add_restrictions(%restrictions), "Added restrictions to subclass");

package Basset::Object::Persistent;

Test::More::ok(Basset::Test::Testing::Basset::Object::Persistent::applied_restrictions::Subclass->isa('Basset::Object::Persistent'), 'Proper subclass');
my $subclass = Basset::Test::Testing::Basset::Object::Persistent::applied_restrictions::Subclass->restrict('specialerror');
Test::More::ok($subclass, "Restricted error");
Test::More::ok(! scalar $subclass->add_restricted_method('invalidrestriction', 'junkymethod'), "Could not add invalid restriction");
Test::More::ok($subclass->restricted, "Subclass is restricted");

Test::More::ok($subclass->applied_restrictions, "Subclass has applied restrictions");
my $restrictions = $subclass->applied_restrictions;

Test::More::ok(ref $restrictions eq 'ARRAY', 'applied restrictions are an array');
Test::More::is(scalar @$restrictions, 1, "Subclass has 1 restriction");
Test::More::is($restrictions->[0], 'specialerror', 'Correct restriction in place');
};
{#line 4173 restricted
package Basset::Test::Testing::Basset::Object::Persistent::restricted::Subclass1;
our @ISA = qw(Basset::Object::Persistent);

package Basset::Object::Persistent;

Test::More::ok(! Basset::Object::Persistent->restricted, "Basset::Object::Persistent is not restricted");
Test::More::ok(! Basset::Test::Testing::Basset::Object::Persistent::restricted::Subclass1->restricted, "Subclass is not restricted");
my $subclass = Basset::Object::Persistent->inline_class;
Test::More::ok($subclass, "Subclassed Basset::Object::Persistent");
my $subclass2 = Basset::Test::Testing::Basset::Object::Persistent::restricted::Subclass1->inline_class();
Test::More::ok($subclass2, "Restricted Basset::Test::Testing::Basset::Object::Persistent::restricted::Subclass1");
Test::More::ok($subclass->restricted, "Subclass is restricted");
Test::More::ok($subclass2->restricted, "Subclass is restricted");
};
{#line 4237 exceptions
my $confClass = Basset::Object::Persistent->pkg_for_type('conf');
Test::More::ok($confClass, "Got conf");

my $cfg = $confClass->conf;
Test::More::ok($cfg, "Got configuration");

my $exceptions = $cfg->{"Basset::Object"}->{'exceptions'};

Test::More::is($cfg->{"Basset::Object"}->{'exceptions'} = 0, 0, "disables exceptions");
Test::More::is($cfg->{"Basset::Object"}->{'exceptions'} = 0, 0, "enables exceptions");
Test::More::is($cfg->{"Basset::Object"}->{'exceptions'} = $exceptions, $exceptions, "reset exceptions");
};
{#line 4266 last_exception
my $o = Basset::Object::Persistent->new();
Test::More::ok($o, "Got object");

my $confClass = Basset::Object::Persistent->pkg_for_type('conf');
Test::More::ok($confClass, "Got conf");

my $cfg = $confClass->conf;
Test::More::ok($cfg, "Got configuration");

Test::More::ok($cfg->{"Basset::Object"}->{'exceptions'} = 1, "enables exceptions");

Test::More::ok(scalar Basset::Object::Persistent->wipe_errors, "Wiped out errors");
Test::More::ok(! Basset::Object::Persistent->last_exception, "Last exception is empty");
eval {
	Basset::Object::Persistent->error('test exception', 'test code');
};
Test::More::like($@, "/test code/", "Thrown exception matches");
Test::More::like(Basset::Object::Persistent->last_exception, qr/test exception/, "Last exception matches");
Test::More::like($o->last_exception, qr/test exception/, "Object last exception matches");
Test::More::is($cfg->{"Basset::Object"}->{'exceptions'} = 0, 0,"disables exceptions");
};
