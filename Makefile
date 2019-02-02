all: depend-all install-slack install-xmpp install-discord install-irc install-notification-center

install: all

mkdir:
	[ -d /var/cpanel/perl/Cpanel/iContact/Provider/Schema ] || mkdir -p /var/cpanel/perl/Cpanel/iContact/Provider/Schema/
	[ -d /var/cpanel/perl/Cpanel/iContact/Provider/Local ] || mkdir -p /var/cpanel/perl/Cpanel/iContact/Provider/Local/

install-slack: mkdir
	cp -f lib/Cpanel/iContact/Provider/Schema/Slack.pm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Slack.pm
	cp -f lib/Cpanel/iContact/Provider/Slack.pm /var/cpanel/perl/Cpanel/iContact/Provider/Slack.pm

install-xmpp: mkdir depend-xmpp
	cp -f lib/Cpanel/iContact/Provider/Schema/XMPP.pm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/XMPP.pm
	cp -f lib/Cpanel/iContact/Provider/XMPP.pm /var/cpanel/perl/Cpanel/iContact/Provider/XMPP.pm

install-irc: mkdir depend-irc
	cp -f lib/Cpanel/iContact/Provider/Schema/IRC.pm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/IRC.pm
	cp -f lib/Cpanel/iContact/Provider/IRC.pm /var/cpanel/perl/Cpanel/iContact/Provider/IRC.pm

install-discord: mkdir
	cp -f lib/Cpanel/iContact/Provider/Schema/Discord.pm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Discord.pm
	cp -f lib/Cpanel/iContact/Provider/Discord.pm /var/cpanel/perl/Cpanel/iContact/Provider/Discord.pm

install-notification-center: mkdir
	cp -f lib/Cpanel/iContact/Provider/Schema/Local.pm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Local.pm
	cp -f lib/Cpanel/iContact/Provider/Local.pm /var/cpanel/perl/Cpanel/iContact/Provider/Local.pm
	cp -f lib/Cpanel/iContact/Provider/Local/Getter.pm /var/cpanel/perl/Cpanel/iContact/Provider/Local/Getter.pm
	cd notification-center && make install

uninstall: uninstall-slack uninstall-irc uninstall-xmpp uninstall-discord uninstall-local

uninstall-slack:
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Slack.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Slack.pm
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Slack.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Slack.pm

uninstall-irc:
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/IRC.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/IRC.pm
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Schema/IRC.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/IRC.pm

uninstall-xmpp:
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/XMPP.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/XMPP.pm
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Schema/XMPP.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/XMPP.pm

uninstall-discord:
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Discord.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Discord.pm
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Discord.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Discord.pm

uninstall-local:
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Local.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Local.pm
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Local.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Schema/Local.pm
	[ ! -f /var/cpanel/perl/Cpanel/iContact/Provider/Local/Getter.pm ] || rm /var/cpanel/perl/Cpanel/iContact/Provider/Local/Getter.pm
	[ ! -f /usr/local/cpanel/whostmgr/docroot/cgi/addon_notification-center.cgi ] || cd notification-center && make uninstall

test: depend-all depend-test
	[ ! -x /usr/local/cpanel/3rdparty/bin/prove ] || /usr/local/cpanel/3rdparty/bin/prove t/*.t
	[ -x /usr/local/cpanel/3rdparty/bin/prove ] || prove t/*.t

depend-irc:
	perl -MIO::Socket::INET -MIO::Socket::SSL -e 'exit 0;' || sudo cpan -i IO::Socket::INET IO::Socket::SSL

depend-xmpp:
	perl -MNet::XMPP -MMozilla::CA -e 'exit 0;' || sudo cpan -i Net::XMPP Mozilla::CA

depend-all: depend-xmpp depend-irc

depend-test:
	perl -MTest::More -MTest::Fatal -MTest::MockModule -MFile::Temp -MConfig::Simple -MHTTP::Tiny::UA -MHTTP::Tiny::UA::Response -e 'exit 0;' || sudo cpan -i Test::More Test::Fatal Test::MockModule Config::Simple HTTP::Tiny::UA HTTP::Tiny::UA::Response File::Temp
