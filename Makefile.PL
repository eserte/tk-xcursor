# -*- cperl -*-

use Tk::MMutil;

if ($^O eq 'MSWin32') {
    warn "Tk::Xcursor is not supported on non-X11 systems.\n";
    exit 0;
}

eval {
    if ((getpwuid($<))[0] eq 'eserte' && $ExtUtils::MakeMaker::VERSION < 6.54) {
	warn <<EOF;
**********************************************************************
* WARNING:
* ExtUtils::MakeMaker too old. META.yml will be imcomplete
**********************************************************************
EOF
    }
};

# XXX Should check rather if -lXcursor is available at all.

Tk::MMutil::TkExtMakefile(
			  VERSION      => '0.02',
			  XS_VERSION   => '0.02',
			  NAME         => 'Tk::Xcursor',
			  OBJECT       => '$(O_FILES)',
			  LIBS         => ['-lXcursor'],
			  TYPEMAPS     => ['typemap'], # seems to be needed, why?
			  ($ExtUtils::MakeMaker::VERSION >= 6.54 ?
			   (META_ADD => { resources => { repository => 'git://github.com/eserte/tk-xcursor.git' },
					  configure_requires => {
								 'Tk::MMutil' => 0,
								},
					}) : ()),
			 );
