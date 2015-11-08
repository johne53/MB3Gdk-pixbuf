#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

require "../local-paths.lib";

$gdk_pixbuf_version = "2.33.2";
$major = 2;
$minor = 33;
$micro = 2;
$interface_age = 2;
$binary_age = 3302;
$current_minus_age = 0;
$gettext_package = "gdk-pixbuf20";
$gdk_pixbuf_loaders_version = "v2.32"; # Used to locate the file, 'loaders.cache'. Change this only when absolutely necessary !
$exec_prefix = "lib";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@GDK_PIXBUF_API_VERSION@/$gdk_pixbuf_api_version/g;
	    s/\@ATK_API_VERSION@/$atk_api_version/g;
	    s/\@PANGO_API_VERSION@/$pango_api_version/g;
	    s/\@GDK_PIXBUF_VERSION@/$gdk_pixbuf_version/g;
	    s/\@GDK_PIXBUF_MAJOR\@/$major/g;
	    s/\@GDK_PIXBUF_MINOR\@/$minor/g;
	    s/\@GDK_PIXBUF_MICRO\@/$micro/g;
	    s/\@GDK_PIXBUF_BINARY_VERSION\@/$gdk_pixbuf_loaders_version/g; # See the comment, above
	    s/\@GDK_PIXBUF_BINARY_AGE\@/$binary_age/g;
	    s/\@GDK_PIXBUF_INTERFACE_AGE\@/$interface_age/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@VERSION@/$gdk_pixbuf_version/g;
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
	    s/\@Debug32PixbufLoadersFolder@/$debug32_pixbuf_loaders_folder/g;
	    s/\@Release32PixbufLoadersFolder@/$release32_pixbuf_loaders_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@prefix@/$prefix/g;
	    s/\@exec_prefix@/$exec_prefix/g;
	    s/\@includedir@/$generic_include_folder/g;
	    s/\@libdir@/$generic_library_folder/g;
	    print OUTPUT;
	}
}

process_file ("config.h.win32");
process_file ("gdk-pixbuf/gdk-pixbuf-features.h");
process_file ("gdk-pixbuf-2.0.pc");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("msvc/gdk-pixbuf.vsprops");
	process_file ("gdk-pixbuf/gdk_pixbuf.rc");
}