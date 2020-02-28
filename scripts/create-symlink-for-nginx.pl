#!/usr/bin/perl
my $username = $ARGV[0];
my $reponame = $ARGV[1];

### _____________________________________________________________________________________________
### subroutines
sub executeAndDieOnFail {
    my $result = system($_[0]);
    if($result) { 
        die $result;
    }
}

sub createSymlinkForNginx {  
    print "-> createSymlinkForNginx\n";
    ### reponame = username
    print "  username: ".$_[0]."\n";
    ###
    
    my $pathBase = "/home/".$_[0];
    my $linkBase = "/srv/http";

    my $websiteBasePath = $pathBase."/document-root";
    my $command = "[ -d  $websiteBasePath ] || mkdir $websiteBasePath";
    executeAndDieOnFail($command);

    my $websiteBaseLink = $linkBase."/$username";
    $command = "ln -sfn $websiteBasePath $websiteBaseLink";
    executeAndDieOnFail($command);

    # my $result = symlink($websiteBasePath, $websiteBaseLink);
    # if($result) {die $result;}
    ##
    $command = "chown ".$_[0].":http $pathBase";
    executeAndDieOnFail($command);

    $command = "chmod 750 $pathBase";
    executeAndDieOnFail($command);

    # $command = "chmod a+X $pathBase";
    # executeAndDieOnFail($command);
}
### _____________________________________________________________________________________________

if(!defined($username)) { die "username is not defined!";}
print $username."\n";

createSymlinkForNginx($username);
