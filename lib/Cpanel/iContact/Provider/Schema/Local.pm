package Cpanel::iContact::Provider::Schema::Local;

use strict;
use warnings;

# Name is always uc(MODULE)

=encoding utf-8

=head1 NAME

Cpanel::iContact::Provider::Schema::Local - Schema for the "Store Locally" iContact module

=head1 SYNOPSIS

    use Cpanel::iContact::Provider::Schema::Local;

    my $settings = Cpanel::iContact::Provider::Schema::Local::get_settings();

    my $config = Cpanel::iContact::Provider::Schema::Local::get_config();


=head1 DESCRIPTION

Provide settings and configuration for the Local iContact module.

=cut

=head2 get_settings

Provide config data for TweakSettings that will be saved in
/etc/wwwacct.conf.shadow

=over 2

=item Input

=over 3

None

=back

=item Output

=over 3

A hashref that can be injected into Whostmgr::TweakSettings::Basic's %Conf
with the additional help and label keys that are used in the display of the
tweak settings.

=back

=back

=cut

sub get_settings {
    my $help = <<HALP;
Locally storing iContact notices to /var/cpanel/iContact powers the 'Notification Center' plugin in WHM.
If you don't know what that is, then you should probably turn this off.
HALP
    return {
        'CONTACTLOCAL' => {
            'name'     => 'Local',
            'type'     => 'binary',
            'label' => 'Save iContact notices locally?',
            'help'  => $help,
        }
    };
}

=head2 get_config

Provide configuration for the module.

=over 2

=item Input

=over 3

None

=back

=item Output

=over 3

A hash ref containing the following key values:

  default_level:    The iContact default contact level (All)
  display_name:     The name displayed on the Contact Manager page in WHM.

=back

=back

=cut

sub get_config {
    return {
        'default_level' => 'All',
        'display_name'  => 'Local',
        'icon' =>
          'data:image/svg+xml,%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20xmlns:xlink=%22http://www.w3.org/1999/xlink%22%20width=%2232mm%22%20height=%2232mm%22%20viewBox=%22-.135%20-.009%20114%20117%22%3E%0A%20%20%3ClinearGradient%20id=%22a%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.764%22%20stop-color=%22#c2cfdc%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#b8c2d4%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22g%22%20x1=%2257.165%22%20x2=%2257.165%22%20y1=%22178.789%22%20y2=%2255.42%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#a%22/%3E%0A%20%20%3ClinearGradient%20id=%22h%22%20x1=%2257.165%22%20x2=%2257.165%22%20y1=%22122.151%22%20y2=%2294.593%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.163%22%20stop-color=%22#f0f0ff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#8d99a9%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22b%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#9e9eac%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#42425b%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22i%22%20x1=%2257.165%22%20x2=%2257.164%22%20y1=%22162.114%22%20y2=%2291.85%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22j%22%20x1=%2252.548%22%20x2=%228.753%22%20y1=%22104.32%22%20y2=%22104.32%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#d1d1e6%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.042%22%20stop-color=%22#c9c9de%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.169%22%20stop-color=%22#b5b5ca%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.299%22%20stop-color=%22#aaaabf%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.433%22%20stop-color=%22#a6a6bb%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.994%22%20stop-color=%22#666679%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22k%22%20x1=%2278.529%22%20x2=%2278.529%22%20y1=%22115.325%22%20y2=%2298.078%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%22.01%22%20stop-opacity=%220%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22c%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22l%22%20x1=%2271.701%22%20x2=%2271.701%22%20y1=%22115.325%22%20y2=%2298.078%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22m%22%20x1=%2264.871%22%20x2=%2264.871%22%20y1=%22115.325%22%20y2=%2298.078%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22n%22%20x1=%2258.044%22%20x2=%2258.044%22%20y1=%22115.325%22%20y2=%2298.078%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22d%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-opacity=%220%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22o%22%20x1=%2251.214%22%20x2=%2251.214%22%20y1=%22115.325%22%20y2=%2298.078%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#d%22/%3E%0A%20%20%3ClinearGradient%20id=%22p%22%20x1=%2233.728%22%20x2=%229.236%22%20y1=%22106.732%22%20y2=%22106.732%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#e3e3e3%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.123%22%20stop-color=%22#cecece%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.277%22%20stop-color=%22#bababa%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.433%22%20stop-color=%22#afafaf%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.596%22%20stop-color=%22#ababab%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#6e6e6e%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22q%22%20x1=%2248.765%22%20x2=%2240.905%22%20y1=%22115.318%22%20y2=%2274.569%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22r%22%20x1=%2245.181%22%20x2=%2245.181%22%20y1=%22106.351%22%20y2=%2291.238%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#d%22/%3E%0A%20%20%3ClinearGradient%20id=%22s%22%20x1=%2297.537%22%20x2=%2297.537%22%20y1=%22109.754%22%20y2=%22102.057%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22t%22%20x1=%2297.536%22%20x2=%2297.536%22%20y1=%22113.801%22%20y2=%22107.157%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%22.489%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.82%22%20stop-color=%22#00cd00%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#00bd00%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22u%22%20x1=%2293.163%22%20x2=%2295.823%22%20y1=%22100.348%22%20y2=%22104.337%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%22.011%22%20stop-color=%22#009500%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.298%22%20stop-color=%22#009000%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#005b00%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22v%22%20x1=%2297.438%22%20x2=%2297.438%22%20y1=%22103.69%22%20y2=%22107.485%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.115%22%20stop-color=%22#e9fae9%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.354%22%20stop-color=%22#b0edb0%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.694%22%20stop-color=%22#57d957%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#00c500%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22e%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.163%22%20stop-color=%22#f0f0ff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#354c60%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22w%22%20x1=%2255.388%22%20x2=%2256.299%22%20y1=%2268%22%20y2=%2239.301%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#e%22/%3E%0A%20%20%3ClinearGradient%20id=%22x%22%20x1=%2255.77%22%20x2=%2255.77%22%20y1=%22114.116%22%20y2=%2243.821%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#a%22/%3E%0A%20%20%3ClinearGradient%20id=%22y%22%20x1=%2255.176%22%20x2=%2255.42%22%20y1=%2261.081%22%20y2=%2253.392%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#e%22/%3E%0A%20%20%3ClinearGradient%20id=%22z%22%20x1=%2255.371%22%20x2=%2255.371%22%20y1=%2272.432%22%20y2=%2254.501%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#a%22/%3E%0A%20%20%3ClinearGradient%20id=%22A%22%20x1=%2241.144%22%20x2=%2241.343%22%20y1=%2225.618%22%20y2=%2219.323%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#e%22/%3E%0A%20%20%3ClinearGradient%20id=%22B%22%20x1=%2241.125%22%20x2=%2241.125%22%20y1=%2233.374%22%20y2=%2220.262%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#a%22/%3E%0A%20%20%3ClinearGradient%20id=%22C%22%20x1=%22138.234%22%20x2=%2223.444%22%20y1=%22-17.351%22%20y2=%2279.674%22%20gradientUnits=%22userSpaceOnUse%22%3E%0A%20%20%20%20%3Cstop%20offset=%22.057%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#fff%22%20stop-opacity=%220%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22f%22%3E%0A%20%20%20%20%3Cstop%20offset=%220%22%20stop-color=%22#fff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%22.348%22%20stop-color=%22#f0f0ff%22/%3E%0A%20%20%20%20%3Cstop%20offset=%221%22%20stop-color=%22#8d99a9%22/%3E%0A%20%20%3C/linearGradient%3E%0A%20%20%3ClinearGradient%20id=%22D%22%20x1=%2214.532%22%20x2=%2214.447%22%20y1=%2286.127%22%20y2=%2281.227%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#f%22/%3E%0A%20%20%3ClinearGradient%20id=%22E%22%20x1=%2214.35%22%20x2=%2214.35%22%20y1=%2278.496%22%20y2=%2281.653%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22F%22%20x1=%2214.455%22%20x2=%2214.455%22%20y1=%2284.905%22%20y2=%2283.75%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22G%22%20x1=%2214.307%22%20x2=%2214.307%22%20y1=%2283.223%22%20y2=%2282.636%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22H%22%20x1=%2298.617%22%20x2=%2298.532%22%20y1=%2286.127%22%20y2=%2281.227%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#f%22/%3E%0A%20%20%3ClinearGradient%20id=%22I%22%20x1=%2298.436%22%20x2=%2298.436%22%20y1=%2278.496%22%20y2=%2281.653%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22J%22%20x1=%2298.54%22%20x2=%2298.54%22%20y1=%2284.905%22%20y2=%2283.75%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22K%22%20x1=%2298.393%22%20x2=%2298.393%22%20y1=%2283.223%22%20y2=%2282.636%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22L%22%20x1=%2222.233%22%20x2=%2222.162%22%20y1=%2210.741%22%20y2=%226.59%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#f%22/%3E%0A%20%20%3ClinearGradient%20id=%22M%22%20x1=%2222.081%22%20x2=%2222.081%22%20y1=%224.278%22%20y2=%226.949%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22N%22%20x1=%2222.168%22%20x2=%2222.168%22%20y1=%229.703%22%20y2=%228.725%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22O%22%20x1=%2222.044%22%20x2=%2222.044%22%20y1=%228.279%22%20y2=%227.782%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22P%22%20x1=%2292.232%22%20x2=%2292.16%22%20y1=%2210.74%22%20y2=%226.591%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#f%22/%3E%0A%20%20%3ClinearGradient%20id=%22Q%22%20x1=%2292.082%22%20x2=%2292.082%22%20y1=%224.278%22%20y2=%226.949%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#c%22/%3E%0A%20%20%3ClinearGradient%20id=%22R%22%20x1=%2292.168%22%20x2=%2292.168%22%20y1=%229.703%22%20y2=%228.725%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3ClinearGradient%20id=%22S%22%20x1=%2292.044%22%20x2=%2292.044%22%20y1=%228.279%22%20y2=%227.782%22%20gradientUnits=%22userSpaceOnUse%22%20xlink:href=%22#b%22/%3E%0A%20%20%3Cg%20transform=%22matrix(1.01949%200%200%201%20-1.11409%200)%22%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#g)%22%20d=%22m106.815%207.704c-.321-4.021-3.144-7.021-7.021-7.021h-85.26c-3.877%200-6.769%202.913-7.021%207.021l-6.833%2092.47%201.137%209.111c.633%203.815%203.146%207.021%207.023%207.021h96.648c3.877%200%206.48-3.157%207.021-7.021l1.14-9.111z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#fff%22%20d=%22m106.626%2089.736h-98.924c-3.877%200-7.021%203.142-7.021%207.021l1.137%209.113c.633%203.813%203.146%207.021%207.023%207.021h96.648c3.877%200%206.48-3.159%207.021-7.021l1.14-9.113c-.001-3.879-3.147-7.021-7.024-7.021z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#h)%22%20d=%22m106.626%2092.468h-98.924c-3.877%200-7.021%203.146-7.021%207.021l1.137%209.113c.633%203.813%203.146%207.021%207.023%207.021h96.648c3.877%200%206.48-3.156%207.021-7.021l1.14-9.113c-.001-3.875-3.147-7.021-7.024-7.021z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22none%22%20d=%22m99.796%201.366h-85.26c-3.5%200-6.107%202.625-6.34%206.388l-5.479%2074.004c1.247-1.109%202.889-1.787%204.689-1.787h99.516c1.799%200%203.437.674%204.683%201.783-1.993-26.979-5.468-73.989-5.469-73.995-.3-3.763-2.907-6.393-6.34-6.393z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#i)%22%20d=%22m113.104%2083.665-5.605-76.015c-.359-4.504-3.526-7.65-7.703-7.65h-85.26c-4.257%200-7.425%203.15-7.704%207.663l-5.616%2076.015-1.216%2016.445%201.143%209.247c.757%204.568%203.849%207.621%207.7%207.621h96.649c3.967%200%207.061-3.059%207.697-7.61l1.14-9.12zm-1.269%2025.537c-.448%203.191-2.583%206.422-6.344%206.422h-96.649c-3.896%200-5.855-3.476-6.348-6.449l-1.134-9.084%201.356-18.333%205.48-74.004c.232-3.763%202.84-6.388%206.34-6.388h85.26c3.434%200%206.04%202.629%206.34%206.393.001.006%203.476%2047.017%205.469%2073.995.802%2010.854%201.365%2018.471%201.365%2018.471z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#j)%22%20d=%22m80.489%20111.606h-70.457l-1.279-14.572h71.736z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#k)%22%20d=%22m80.358%2098.326h-3.658v12.045h3.658z%22%20opacity=%22.7%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#l)%22%20d=%22m73.53%2098.326h-3.659v12.045h3.659z%22%20opacity=%22.7%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#m)%22%20d=%22m66.702%2098.326h-3.661v12.045h3.661z%22%20opacity=%22.7%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#n)%22%20d=%22m59.875%2098.326h-3.663v12.045h3.663z%22%20opacity=%22.7%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#o)%22%20d=%22m53.045%2098.326h-3.663v12.045h3.663z%22%20opacity=%22.7%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#p)%22%20d=%22m20.364%20107.323c8.808%203.979%2028.99%204.283%2028.99%204.283h-39.322l-.796-9.749c-.001%200%201.187.976%2011.128%205.466z%22%20opacity=%22.8%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#fff%22%20d=%22m81.663%20111.608h-71.658v-1.288h71.658z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#fff%22%20d=%22m80.459%20110.584v-13.631h1.272v13.631z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#q)%22%20d=%22m81.708%2097.988h-72.777v-1.066h72.777z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#r)%22%20d=%22m8.637%2096.857.402%203.24c13.009%203.439%2032.607%206.819%2053.424%206.819%206.678%200%2013.133-.228%2019.261-.645v-9.415h-73.087z%22%20opacity=%22.7%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#s)%22%20d=%22m102.079%20106.908c0%202.511-2.033%204.539-4.541%204.539-2.51%200-4.542-2.028-4.542-4.539%200-2.508%202.032-4.543%204.542-4.543%202.508%200%204.541%202.035%204.541%204.543z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#t)%22%20d=%22m101.096%20106.908c0%201.969-1.593%203.561-3.558%203.561-1.967%200-3.562-1.592-3.562-3.561%200-1.966%201.595-3.559%203.562-3.559%201.965.001%203.558%201.593%203.558%203.559z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#u)%22%20d=%22m93.808%20106.908c0%202.058%201.674%203.729%203.73%203.729%202.055%200%203.729-1.671%203.729-3.729s-1.675-3.727-3.729-3.727c-2.057.001-3.73%201.67-3.73%203.727zm.338%200c0-1.87%201.522-3.389%203.392-3.389s3.389%201.519%203.389%203.389c0%201.871-1.52%203.389-3.389%203.389s-3.392-1.518-3.392-3.389z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#v)%22%20d=%22m97.551%20107.045c1.24-.914%202.404-1.227%202.916-1.325-.49-1.109-1.601-1.881-2.891-1.881-1.749%200-3.167%201.416-3.167%203.165%200%20.274.036.54.1.793.514.098%201.767.189%203.042-.752z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#w)%22%20d=%22m91.166%2045.768c-.38-.563-.794-1.112-1.235-1.649l-1.656-31.49-2.656-2.654-15.233%2022.657c-4.513-1.202-9.441-1.874-14.615-1.874-21.371%200-38.694%2011.287-38.694%2025.208%200%2013.922%2017.323%2025.205%2038.694%2025.205%2021.37%200%2038.694-11.283%2038.694-25.205%200-3.631-1.179-7.079-3.299-10.198z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#x)%22%20d=%22m88.522%2045.753c-.352-.522-.733-1.028-1.144-1.529l-1.53-29.136-2.457-2.457-14.097%2020.967c-4.174-1.109-8.736-1.734-13.523-1.734-19.776%200-35.806%2010.443-35.806%2023.326%200%2012.881%2016.03%2023.324%2035.806%2023.324%2019.775%200%2035.805-10.443%2035.805-23.324-.001-3.359-1.091-6.552-3.054-9.437z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#y)%22%20d=%22m71.444%2054.947c0%205.338-7.197%209.666-16.073%209.666-8.877%200-16.073-4.328-16.073-9.666%200-5.335%207.196-9.664%2016.073-9.664%208.876%200%2016.073%204.329%2016.073%209.664z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#z)%22%20d=%22m69.344%2054.947c0%204.643-6.256%208.403-13.973%208.403s-13.973-3.761-13.973-8.403c0-4.641%206.256-8.402%2013.973-8.402s13.973%203.762%2013.973%208.402z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#A)%22%20d=%22m65.492%2015.311c-.103-1.058-.861-1.92-1.92-1.92h-43.802c-1.061%200-1.809.846-1.921%201.92l-1.14%2011.217c.249.731.933%201.257%201.747%201.257h45.231c1.023%200%201.853-.83%201.853-1.852v-1.107z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#B)%22%20d=%22m63.923%2016.083c-.097-.905-.805-1.639-1.796-1.639h-40.981c-.994%200-1.694.721-1.798%201.639l-1.065%209.576c.232.623.873%201.074%201.634%201.074h42.318c.958%200%201.734-.71%201.734-1.583v-.945z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#fff%22%20d=%22m61.194%2016.5c-.085-.729-.708-1.321-1.58-1.321h-36.08c-.874%200-1.49.582-1.582%201.321l-.939%207.722c.206.501.77.864%201.439.864h37.255c.843%200%201.528-.571%201.528-1.276v-.76z%22/%3E%0A%20%20%20%20%3Cpath%20d=%22m61.194%2016.288c-.085-.612-.708-1.109-1.58-1.109h-36.08c-.874%200-1.49.489-1.582%201.109l-.939%206.478c.206.422.77.726%201.439.726h37.255c.843%200%201.528-.479%201.528-1.07v-.639z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#C)%22%20d=%22m92.102%201.697h-69.874c-2.638%200-4.411%202.024-4.777%204.687l-8.063%2084.802h4.277%2087.001%204.275l-8.064-84.802c-.487-2.602-2.137-4.687-4.775-4.687z%22%20opacity=%22.85%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#D)%22%20d=%22m18.229%2081.667c0%201.632-1.689%202.954-3.774%202.954-2.083%200-3.774-1.322-3.774-2.954%200-1.631%201.691-2.955%203.774-2.955%202.085%200%203.774%201.324%203.774%202.955z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#E)%22%20d=%22m14.47%2081.644c1.314-.759%202.549-1.019%203.091-1.1-.521-.922-1.697-1.564-3.068-1.564-1.852%200-3.354%201.178-3.354%202.63%200%20.226.039.448.106.657.546.08%201.873.157%203.225-.623z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#F)%22%20d=%22m10.501%2081.667c0%201.707%201.773%203.097%203.953%203.097s3.953-1.39%203.953-3.097-1.773-3.096-3.953-3.096-3.953%201.389-3.953%203.096zm.359%200c0-1.552%201.612-2.814%203.595-2.814%201.982%200%203.594%201.263%203.594%202.814s-1.612%202.813-3.594%202.813c-1.983-.001-3.595-1.261-3.595-2.813z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#eee%22%20d=%22m11.307%2083.327%206.437-2.896-.182-.247-6.438%202.894z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#G)%22%20d=%22m11.18%2083.15%206.435-2.896-.182-.248-6.434%202.895z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#H)%22%20d=%22m102.313%2081.667c0%201.632-1.689%202.954-3.772%202.954-2.085%200-3.774-1.322-3.774-2.954%200-1.631%201.689-2.955%203.774-2.955%202.083%200%203.772%201.324%203.772%202.955z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#I)%22%20d=%22m98.557%2081.644c1.313-.759%202.549-1.019%203.091-1.1-.521-.922-1.698-1.564-3.067-1.564-1.853%200-3.354%201.178-3.354%202.63%200%20.226.036.448.106.657.542.08%201.871.157%203.224-.623z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#J)%22%20d=%22m94.587%2081.667c0%201.707%201.772%203.097%203.954%203.097%202.18%200%203.952-1.39%203.952-3.097s-1.772-3.096-3.952-3.096c-2.182%200-3.954%201.389-3.954%203.096zm.359%200c0-1.552%201.611-2.814%203.595-2.814%201.98%200%203.594%201.263%203.594%202.814s-1.613%202.813-3.594%202.813c-1.983-.001-3.595-1.261-3.595-2.813z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#eee%22%20d=%22m95.394%2083.327%206.435-2.896-.181-.247-6.436%202.894z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#K)%22%20d=%22m95.266%2083.15%206.435-2.896-.181-.248-6.436%202.895z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#L)%22%20d=%22m25.31%206.962c0%201.383-1.407%202.503-3.142%202.503s-3.142-1.12-3.142-2.503%201.407-2.502%203.142-2.502%203.142%201.119%203.142%202.502z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#M)%22%20d=%22m22.181%206.939c1.093-.643%202.122-.86%202.574-.93-.436-.778-1.414-1.322-2.554-1.322-1.543%200-2.792.995-2.792%202.223%200%20.195.03.382.087.559.455.069%201.56.134%202.685-.53z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#N)%22%20d=%22m18.876%206.962c0%201.446%201.478%202.621%203.292%202.621s3.291-1.175%203.291-2.621-1.476-2.622-3.291-2.622-3.292%201.176-3.292%202.622zm.299%200c0-1.314%201.344-2.385%202.993-2.385%201.648%200%202.991%201.071%202.991%202.385s-1.343%202.383-2.991%202.383c-1.649%200-2.993-1.069-2.993-2.383z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#eee%22%20d=%22m19.548%208.366%205.358-2.452-.151-.211-5.359%202.453z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#O)%22%20d=%22m19.44%208.218%205.357-2.453-.151-.208-5.356%202.452z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#P)%22%20d=%22m95.31%206.962c0%201.383-1.407%202.503-3.141%202.503-1.737%200-3.145-1.12-3.145-2.503s1.407-2.502%203.145-2.502c1.733%200%203.141%201.119%203.141%202.502z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#Q)%22%20d=%22m92.183%206.939c1.092-.643%202.119-.86%202.572-.93-.436-.778-1.414-1.322-2.556-1.322-1.541%200-2.79.995-2.79%202.223%200%20.195.03.382.086.559.455.069%201.562.134%202.688-.53z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#R)%22%20d=%22m88.876%206.962c0%201.446%201.478%202.621%203.293%202.621%201.813%200%203.29-1.175%203.29-2.621s-1.477-2.622-3.29-2.622c-1.815%200-3.293%201.176-3.293%202.622zm.3%200c0-1.314%201.341-2.385%202.993-2.385%201.648%200%202.991%201.071%202.991%202.385s-1.343%202.383-2.991%202.383c-1.652%200-2.993-1.069-2.993-2.383z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22#eee%22%20d=%22m89.548%208.366%205.356-2.452-.148-.211-5.36%202.453z%22/%3E%0A%20%20%20%20%3Cpath%20fill=%22url(#S)%22%20d=%22m89.441%208.218%205.355-2.453-.149-.208-5.356%202.453z%22/%3E%0A%20%20%3C/g%3E%0A%3C/svg%3E%0A'
    };
}

1;
