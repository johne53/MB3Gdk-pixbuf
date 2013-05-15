#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

require "../local-paths.lib";

$gdk_pixbuf_api_version = "2.0";
$gdk_pixbuf_version = "2.28.1";
$major = 2;
$minor = 28;
$micro = 1;
$interface_age = 1;
$binary_age = 281;
$current_minus_age = 0;
$gettext_package = "gdk-pixbuf20";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@GDK_PIXBUF_API_VERSION@/$gdk_pixbuf_api_version/g;
	    s/\@GDK_PIXBUF_VERSION@/$gdk_pixbuf_version/g;
	    s/\@GDK_PIXBUF_MAJOR\@/$major/g;
	    s/\@GDK_PIXBUF_MINOR\@/$minor/g;
	    s/\@GDK_PIXBUF_MICRO\@/$micro/g;
	    s/\@GDK_PIXBUF_BINARY_VERSION\@/$binary_age/g;
	    s/\@GDK_PIXBUF_BINARY_AGE\@/$binary_age/g;
	    s/\@GDK_PIXBUF_INTERFACE_AGE\@/$interface_age/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@GETTEXT_PACKAGE\@/$gettext_package/g;
	    s/\@PERL_PATH@/$perl_path/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@GdkPixbufBuildRootFolder@/$gdk_pixbuf_build_root_folder/g;
	    s/\@GtkBuildProjectFolder@/$gtk_build_project_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    print OUTPUT;
	}
}

process_file ("config.h.win32");
process_file ("gdk-pixbuf/gdk-pixbuf-features.h");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("msvc/gdk-pixbuf.vsprops");
	process_file ("gdk-pixbuf/gdk_pixbuf.rc");
}