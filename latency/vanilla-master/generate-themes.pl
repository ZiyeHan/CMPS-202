#!/usr/bin/perl
use strict;

use constant THEMES_OUTDIR => './res/values-v21/';
use constant THEMES_LIST   => './res/values-v21/themes-list.xml';

my $THEMES = [
	{ name=>"standard_light", id=>0, dark=>0, colorAccent => '#ff3e677a', colorPrimary => '#ff37474f', colorPrimaryDark => '#ff263238', controlsNormal=>'@color/material_grey_900', _bg => '#fff0f0f0' },
	{ name=>"standard_dark", id=>1, dark=>1, colorAccent => '#ff3e677a', colorPrimary => '#ff37474f', colorPrimaryDark => '#ff263238', controlsNormal=>'@color/material_grey_300', _bg => '#ff2a2a2a' },
	{ name=>"grey_light", id=>2, dark=>0, colorAccent => '#ff000000', colorPrimary => '#ff212121', colorPrimaryDark => '#ff090909', controlsNormal=>'@color/material_grey_600', _bg => '#fff0f0f0' },
	{ name=>"grey_dark", id=>3, dark=>1, colorAccent => '#ffd8d8d8', colorPrimary => '#ff212121', colorPrimaryDark => '#ff090909', controlsNormal=>'@color/material_grey_600', _bg => '#ff2a2a2a' },
	{ name=>"orange_light", id=>4, dark=>0, colorAccent => '#FFF57F17', colorPrimary => '#FFE65100', colorPrimaryDark => '#FFBF360C', controlsNormal=>'@color/material_grey_900', _bg => '#fff0f0f0' },
	{ name=>"orange_dark", id=>5, dark=>1, colorAccent => '#FFF57F17', colorPrimary => '#FFE65100', colorPrimaryDark => '#FFBF360C', controlsNormal=>'@color/material_grey_300', _bg => '#ff2a2a2a' },
	{ name=>"blue_light", id=>6, dark=>0, colorAccent => '#FF03A9F4', colorPrimary => '#FF0277BD', colorPrimaryDark => '#FF01579B', controlsNormal=>'@color/material_grey_900', _bg => '#fff0f0f0' },
	{ name=>"blue_dark", id=>7, dark=>1, colorAccent => '#FF03A9F4', colorPrimary => '#FF0277BD', colorPrimaryDark => '#FF01579B', controlsNormal=>'@color/material_grey_300', _bg => '#ff2a2a2a' },
	{ name=>"red_light", id=>8, dark=>0, colorAccent => '#ffd50000', colorPrimary => '#ffc62828', colorPrimaryDark => '#ffb71c1c', controlsNormal=>'@color/material_grey_900', _bg => '#fff0f0f0' },
	{ name=>"red_dark", id=>9, dark=>1, colorAccent => '#ffd50000', colorPrimary => '#ffc62828', colorPrimaryDark => '#ffb71c1c', controlsNormal=>'@color/material_grey_300', _bg => '#ff2a2a2a' },
	{ name=>"amoled_dark", id=>10, dark=>1, colorAccent => '#ffd8d8d8', colorPrimary => '#ff000000', colorPrimaryDark => '#ff000000', controlsNormal=>'@color/material_grey_600', colorBackground=>'@android:color/black', _bg => '#ff000000' },
];


my $XML_ARRAYS    = {};
foreach my $theme_ref (@$THEMES) {
	my $theme_name = $theme_ref->{name};
	my $theme_id = $theme_ref->{id} == 0 ? '' : ucfirst($theme_name)."."; # standard_light has no prefix
	my $outfile  = THEMES_OUTDIR."/theme-$theme_name.xml";
	my $outbuff  = get_theme_xml($theme_ref, $theme_id);

	open(OUT, ">", $outfile) or die "Can not write to $outfile: $!\n";
	print OUT $outbuff;
	close(OUT);

	# Get all styles found in get_theme_xml output.
	foreach my $line (split(/\n/, $outbuff)) {
		if (my ($style) = $line =~ /style name=\"([^"]+)\"/) {
			my $category = "theme_category_".lc((split(/\./, $style))[-1]);
			push(@{$XML_ARRAYS->{'integer-array'}->{$category}}, '@style/'.$style);
		}
	}

	my $tvarr = join(",", map { $theme_ref->{$_} } qw(colorPrimaryDark _bg colorPrimary));
	# csv list of theme info, such as its id and the primary colors to show in preview
	push(@{$XML_ARRAYS->{'string-array'}->{theme_values}},  $tvarr);
	# user visible names of themes
	push(@{$XML_ARRAYS->{'string-array'}->{theme_entries}}, '@string/theme_name_'.$theme_ref->{name});
	# id <-> sort mapping
	push(@{$XML_ARRAYS->{'string-array'}->{theme_ids}}, $theme_ref->{id});
	# set flag whether theme is dark or not
	push(@{$XML_ARRAYS->{'string-array'}->{theme_variant}}, $theme_ref->{dark} ? 'dark' : 'light');
}


open(OUT, ">", THEMES_LIST) or die "Cannot write theme list: $!\n";
print OUT << "EOLIST";
<?xml version="1.0" encoding="utf-8"?>
<!-- THIS FILE IS AUTOGENERATED BY generate-themes.pl - DO NOT TOUCH! -->
<resources>
EOLIST
while(my($array_type, $lists) = each(%$XML_ARRAYS)) {
	while(my($name, $items) = each(%$lists)) {
		print OUT "\t<$array_type name=\"$name\">\n";
		foreach my $item (@$items) {
			print OUT "\t\t<item>$item</item>\n";
		}
		print OUT "\t</$array_type>\n\n";
	}
}
print OUT "</resources>\n";

close(OUT);






sub get_theme_xml {
	my($this, $tid) = @_;

my $DATA = << "EOF";
<?xml version="1.0" encoding="utf-8"?>
<!--

 *** THIS FILE WAS GENERATED BY 'generate-themes.pl' - DO NOT TOUCH ***

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>. 
-->

<resources>
EOF

	if($this->{dark} == 0) {
	$DATA .= << "EOF"
	<style name="${tid}VanillaBase" parent="android:Theme.Material.Light.DarkActionBar">
		<item name="overlay_background_color">\@color/overlay_background_light</item>
		<item name="overlay_foreground_color">\@color/overlay_foreground_light</item>
		<item name="float_color">\@color/material_grey_400</item>
		<item name="background_circle_color">\@color/material_grey_300</item>
		<item name="tabs_background">$this->{colorPrimary}</item>
		<item name="now_playing_marker">$this->{colorAccent}</item>
		<item name="controls_normal">$this->{controlsNormal}</item>
		<item name="controls_active">$this->{colorAccent}</item>
		<item name="android:colorAccent">$this->{colorAccent}</item>
		<item name="android:colorPrimary">$this->{colorPrimary}</item>
		<item name="android:colorPrimaryDark">$this->{colorPrimaryDark}</item>
	</style>

	<style name="${tid}Playback" parent="${tid}VanillaBase">
		<item name="android:actionBarStyle">\@style/Universal.PlaybackActionBar</item>
	</style>

	<style name="${tid}BackActionBar" parent="${tid}VanillaBase">
		<item name="android:actionBarStyle">\@style/Universal.PlaybackActionBar</item>
	</style>

	<style name="${tid}Library" parent="${tid}VanillaBase">
		<item name="android:windowActionBar">false</item>
		<item name="android:windowNoTitle">true</item>
	</style>

	<style name="${tid}PopupDialog" parent="android:Theme.Material.Light.Dialog.MinWidth">
		<item name="background_circle_color">\@color/material_grey_300</item>
		<item name="controls_normal">$this->{controlsNormal}</item>
		<item name="controls_active">$this->{colorAccent}</item>
	</style>
EOF
	} else {
	$DATA .= << "EOF"
	<!-- dark theme -->
	<style name="${tid}VanillaBase" parent="android:Theme.Material">
		<item name="overlay_background_color">\@color/overlay_background_dark</item>
		<item name="overlay_foreground_color">\@color/overlay_foreground_dark</item>
		<item name="float_color">\@color/material_grey_900</item>
		<item name="background_circle_color">\@color/material_grey_700</item>
		<item name="tabs_background">$this->{colorPrimary}</item>
		<item name="now_playing_marker">$this->{colorAccent}</item>
		<item name="controls_normal">$this->{controlsNormal}</item>
		<item name="controls_active">$this->{colorAccent}</item>
		<item name="android:colorAccent">$this->{colorAccent}</item>
		<item name="android:colorPrimary">$this->{colorPrimary}</item>
		<item name="android:colorPrimaryDark">$this->{colorPrimaryDark}</item>
	</style>

	<style name="${tid}Playback" parent="${tid}VanillaBase">
		<item name="android:actionBarStyle">\@style/Universal.PlaybackActionBar</item>
	</style>

	<style name="${tid}BackActionBar" parent="${tid}VanillaBase">
		<item name="android:actionBarStyle">\@style/Universal.PlaybackActionBar</item>
	</style>

	<style name="${tid}Library" parent="${tid}VanillaBase">
		<item name="android:windowActionBar">false</item>
		<item name="android:windowNoTitle">true</item>
	</style>

	<style name="${tid}PopupDialog" parent="android:Theme.Material.Dialog.MinWidth">
		<item name="background_circle_color">\@color/material_grey_700</item>
		<item name="controls_normal">$this->{controlsNormal}</item>
		<item name="controls_active">$this->{colorAccent}</item>
	</style>
EOF
	}
$DATA .= "\n</resources>\n";

	# Add custom colorBackground if set, inherit from theme otherwise.
	# If we force this, we also set overlay_background_color to the same value
	# as it is expected to match the background.
	if (defined($this->{colorBackground})) {
		$DATA =~ s/<item name="(overlay_background_color)">.+<\/item>/
		<item name="android:colorBackground">$this->{colorBackground}<\/item>
		<item name="\1">$this->{colorBackground}<\/item>
		/;
	}

	return $DATA
}
