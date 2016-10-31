# add entries to ignore.conf
define logwatch::ignore (
  $regex,
) {
  concat::fragment { $title:
    target  => 'ignore.conf',
    content => "${regex}\n",
    order   => '05',
  }
}
