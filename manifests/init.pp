class homeassistant (
  $user         = 'homeassistant',
  $group        = 'homeassistant',
  $home         = '/srv/homeassistant',
  $config       = '/etc/homeassistant',
  $paths        = [],
) {

  if !is_array($paths) {
    fail('$paths is not an array')
  }

  class{'::homeassistant::install':} ~>
  class{'::homeassistant::service':}

  contain ::homeassistant::install
  contain ::homeassistant::service

}
