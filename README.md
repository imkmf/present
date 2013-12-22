# Present

Give presentations in the command-line. Keyboard controlled and powered with syntax highlighting.

![Imgur](http://i.imgur.com/ngEUDvK.png)

## Installation

    $ gem install present

You now have `present` as an executable, given all your `PATH` stuff is working correctly.

## Usage

Present works when given a directory as an argument:

`present my-awesome-slides`

Slides are plain files of any extension (YES it will skip images, leave me alone).

    my-awesome-slides
    |
    |- 1-intro.md
    |- 2-somecode.rb

If you include a code file or a markdown file, the syntax highlighting will make it look nice.

Any key to go to the next slide.

### Config

Only one configuration option so far: changing the order of slides. Create a `_config.yml` file in your slide directory for Present to pick it up:

```yml
# Set sort order for slides - "alpha", "created_at", and "modified_at"
#
### alpha: Sort alphanumerically. "1-intro", "2-who-am-i", "3-ruby", etc.
### created_at: Sort by order of creation. Oldest slides first.
### modified_at: Sort by last modified slides. Most recently changed first.
sort: alpha
```

There's a lot of bugs here so bear with me! This is a bit of a weekend experiment, I'm afraid.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
