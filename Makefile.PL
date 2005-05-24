use inc::Module::Install;

name          ( 'Template-Plugin-NakedBody'              );
abstract      ( 'Strip HTML wrapping to get just the naked body' );
author        ( 'Adam Kennedy <cpan@ali.as>'           );
version_from  ( 'lib/Template/Plugin/NakedBody.pm'       );
license       ( 'perl'                                 );

requires      ( 'perl'                      => '5.005' );
requires      ( 'Template'                  => '2.10'  );

build_requires( 'Test::More'                => '0.47'  );
build_requires( 'File::Spec'                => '0.82'  );

auto_install();

&WriteAll;
