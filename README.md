Lita::Handlers::Random
======================

[![Gem Version](https://badge.fury.io/rb/lita-random.svg)](http://badge.fury.io/rb/lita-random)
[![Build Status](https://travis-ci.org/braiden-vasco/lita-random.svg)](https://travis-ci.org/braiden-vasco/lita-random)
[![Coverage Status](https://coveralls.io/repos/braiden-vasco/lita-random/badge.svg)](https://coveralls.io/r/braiden-vasco/lita-random)

Generator of random numbers and strings for the [Lita](http://lita.io) chat bot.

Usage
-----

At first, see the documentation for Lita: http://docs.lita.io/

### Installation

Add **lita-random** to your Lita instance's Gemfile:

```ruby
gem 'lita-random', '~> 0.6.0'
```

### Commands

The space between instructions can be skipped, so you can write
`random hex` as `randomhex`, `rand b64` as `randb64`

Arguments for all commands (excluding `random case`, `shuffle` and `sample`)
can be passed as keyword arguments too. Put them after
positional arguments with two dashes before, or the first letter
of argument name with one dash. Examples:

```
You: lita random 5 10
Lita: 7
You: lita random 5 --to 5
Lita: 9
You: lita random 5 -t 10
Lita: 5
You: lita random --to 10 --from 5
Lita: 6
You: lita random -f 5 -t 10
Lita: 9
```

Command `random` has alias `rand`

* `random` -
  random float number, greater or equal to 0 and lesser than 1

* `random <to>` -
  random integer or float number, greater or equal to 0 and lesser than `to`

* `random <from> <to>` -
  random integer or float number, greater or equal to `from` and lesser than `to`

* `random case <string>` -
  randomize case of each character of string `string`

Command `base64` has alias `b64`

* `random base64 <size=16>` -
  random base64 string, length of source string is `size`,
  length of result is about `size * 4 / 3` (24 with default value of `size`)

Command `hex` has aliases `hx` and `x`

* `random hex <size=16>` -
  random hexadecimal string with length `size * 2`

Command `uuid` has alias `uid`

* `random uuid` -
  v4 random UUID (Universally Unique IDentifier). The version 4 UUID
  is purely random (except the version). It doesn’t contain
  meaningful information such as MAC address, time, etc.

Command `password` has alias `pass`

* `random password <length=16>` -
  random password with length `length` containing characters
  in upper and lower case, and digits

* `random smart password <length=8>` -
  random pronounceable password with a minimum length of `length`

* `shuffle <array, ...>` -
  new array with elements of `array` shuffled

* `sample <count=1> <array, ...>` -
  choose `count` random elements from `array`

### Examples

```
You: lita random
Lita: 0.52693215290866
You: lita rand
Lita: 0.8332672468501509

You: lita random 5
Lita: 2
You: lita rand --to 100
Lita: 24

You: lita random -f 1.5
Lita: 1.1828046952104034
You: lita random 10 --from 5
Lita: 8
You: lita rand 1000 2000
Lita: 1240
You: lita random 12 13.5
Lita: 13.458799783677263

You: lita random case foo bar car cdr
Lita: FoO bAr CAr Cdr

You: lita random base64
Lite: 56wnZVVVStKG5+I6L4LVGw==
You: lita randb64 10
Lita: NMkIhB+iG2VNpg==

You: lita random hex
Lita: 7d6f39cf53303db862bac5e1b36eb0fa
You: lita randx -s 10
Lita: 0d8297837d6e63b8c25b

You: lita random uuid
Lita: f1281565-3c8a-475d-a1aa-565ff840a42c

You: lita random password
Lita: TXXBu7XEBdwFF7fP
You: lita randpass --length 8
Lita: 7lFateFs

You: lita random smart password
Lita: mospowot
You: lita random smartpass 16
Lita: jophemyrdivezagi

You: lita shuffle 1, 2, 3, 4, 5
Lita: 3, 1, 5, 2, 4

You: lita sample 1, 2, 3, 4, 5
Lita: 4
You: lita sample 3  1, 2, 3, 4, 5
Lita: 5, 1, 2
```
