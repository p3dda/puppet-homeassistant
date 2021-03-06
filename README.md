# Puppet module for Home Assistant 

[![Build Status](https://travis-ci.org/voxpupuli/puppet-homeassistant.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-homeassistant)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-homeassistant/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-homeassistant)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/homeassistant.svg)](https://forge.puppetlabs.com/puppet/homeassistant)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/homeassistant.svg)](https://forge.puppetlabs.com/puppet/homeassistant)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/homeassistant.svg)](https://forge.puppetlabs.com/puppet/homeassistant)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/homeassistant.svg)](https://forge.puppetlabs.com/puppet/homeassistant)

## Description
Home Assistant is an open-source home automation platform running on Python 3. This
puppet module can be used to install and configurue Home Assistant.
Home assistant is installed within an python3 virtualenv environment.

Home Assistant - https://home-assistant.io/

## Usage
To install and start homeassistant

```puppet
include ::homeassistant
```

or with a custom configuration.

```puppet
class{'::homeassistant':
  user         => 'steve',
  home         => '/home/steve' 
  config       => '/etc/myconfig',
}
```

### Parameters for homeassistant class
* `user` - Specify a username to run the service as. Default: `homeassistant`
* `home` - Home directory of user and virtualeven for software. Default: `/srv/homeassistant`
* `config` - Configuration directory. Default: `/etc/homeassistant`

## Authors
puppet-homeassistant is maintained by VoxPupuli. It was
originally written by Steve Traylen.

