# convert svg files directly to pdf with inkscape
add_cus_dep('svg', 'pdf', 0, 'svg2pdf');
add_cus_dep('md', 'tex', 0, 'md2tex');

sub md2tex {
    $currdir = '$PWD';
    return system("pandoc -t beamer -o \"$currdir/$_[0].tex\" \"$currdir/$_[0].md\"");
}

sub svg2pdf {
    $currdir = '$PWD';
    return system("inkscape --export-text-to-path --export-area-drawing --export-pdf=\"$currdir/$_[0].pdf\" \"$currdir/$_[0].svg\"");
}
