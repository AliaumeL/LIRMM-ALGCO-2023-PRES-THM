# convert svg files directly to pdf with inkscape
add_cus_dep('svg', 'pdf', 0, 'svg2pdf');

sub svg2pdf {
    $currdir = '$PWD';
    return system("inkscape --export-text-to-path --export-area-drawing --export-pdf=\"$currdir/$_[0].pdf\" \"$currdir/$_[0].svg\"");
}
