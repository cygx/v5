use v6;

module CPANPLUS::Backend {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &CPANPLUS::Backend::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &CPANPLUS::Backend::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
