Wercker step goveralls [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/YOwatari/wercker-step-goveralls/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/6531dbf99260accf92262a5df473d4fd/m "wercker status")](https://app.wercker.com/project/bykey/6531dbf99260accf92262a5df473d4fd)

This is [wercker](http://wercker.com/) deploy step for [mattn/goveralls](https://github.com/YOwatari/goveralls), go integration with [https://coveralls.io/](https://coveralls.io/) continuous code coverage tracking system.

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
   - yowatari/goveralls:
     token: $COVERALLS_TOKEN
```

To use this step, you need to set `$COVERALLS_TOKEN`.

## Author

[tcnksm](https://github.com/tcnksm)
