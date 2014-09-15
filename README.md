## Getting Started

* `$ git clone git://github.com/softeamco/softeam_rails.git myapp`
* `$ cd ./myapp`
* `$ rails g mongoid:config`
* Configure your config/mongoid.yml
* `$ bundle install`

## Deploy to staging

### Setup SSH Access
* `$ brew install ssh-copy-id`
* `$ ssh-copy-id username@hostname`

### First Server Setup
* configure config/deploy/staging.rb
* `$ cap deploy:setup`

## License

Licenced under [MIT](http://www.opensource.org/licenses/mit-license.php).

Cheers, [Softeam](http://softeam.co).
