# Site config (for dev/MacBookPro)
# For Rackspace: use -march=barcelona

case platform
when 'gentoo'
  set[:gentoo][:portage][:CFLAGS] = '-march=native -O2 -pipe'
  set[:gentoo][:portage][:USE] = "-X -gnome -gtx -kde -qt mmx sse sse2 unicode ipv6 idn threads"
else
  raise "This is a Gentoo-only Cookbook"
end
