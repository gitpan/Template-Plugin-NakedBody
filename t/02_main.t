#!/usr/bin/perl -w

# Main unit tests for Template::Plugin::NakedBody module

use strict;
use lib ();
use UNIVERSAL 'isa';
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		chdir ($FindBin::Bin = $FindBin::Bin); # Avoid a warning
		lib->import( catdir( updir(), updir(), 'modules') );
	}
}





# Does everything load?
use Template::Plugin::NakedBody;
use Test::More 'tests' => 5;

my $coderef = Template::Plugin::NakedBody->coderef;
is( ref($coderef), 'CODE', '->coderef returns a CODE reference' );





#####################################################################
# Tests

{ # The basics
my $content = <<'END_HTML';
<html>
<body>
This is the content
</body>
</html>
END_HTML

is( $coderef->( $content ), "\nThis is the content\n",
	"Basic filter returns as expected" );
}





{ # A little more stuff
my $content = <<'END_HTML';
<html>
<body onload="foo();">
This is the content
</body>
</html>
END_HTML

is( $coderef->( $content ), "\nThis is the content\n",
	"onload filter returns as expected" );
}





{ # A little broken
my $content = <<'END_HTML';
<html>
<body>
This is the <body> content
</body>
</html>
END_HTML

is( $coderef->( $content ), "\nThis is the <body> content\n",
	"Broken content filter returns as expected" );
}





{ # Another possible broken one
my $content = <<'END_HTML';
<html>
<body>
This is the content
END_HTML

is( $coderef->( $content ), "\nThis is the content\n",
	"Broken content filter returns as expected" );
}
