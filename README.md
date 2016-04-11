# OmniFocus To Due

This is an OS X service that implements exporting [OmniFocus](https://omnigroup.com/omnifocus) tasks to [Due](http://www.dueapp.com). Unlike the generic "Add to Due" service that Due comes with, this service will copy across due dates and repeat schedules in addition to the name of the task.

Once it's installed, "Add OmniFocus Task to Due" will appear in your the menu bar and right-click menus within OmniFocus.

## Installing

You need to have Ruby 2.3 installed at `~/.rubies/ruby-2.3.0/bin/ruby`.
I'll be trying to make this work better out of the box in future.
There's an [issue](https://github.com/alyssais/omnifocus_to_due/issues/1) open for this if you want to help out.

Run these commands in Terminal. You need to have [Bundler](http://bundler.io) installed.

```sh
git clone https://github.com/alyssais/omnifocus_to_due
cd omnifocus_to_due
bundle install
ln -s lib/omnifocus_to_due.workflow "~/Library/Scripts/Add OmniFocus Task to Due.workflow"
```

Make sure not to delete the `omnifocus_to_due` directory.
If you move it, you'll have to recreate the symbolic link.

You can [assign a custom keyboard shortcut](https://support.apple.com/kb/PH18418?locale=en_US) to the service in System Preferences.

## Uninstalling

Run this command in Terminal.

```sh
rm "~/Library/Scripts/Add OmniFocus Task to Due.workflow"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alyssais/omnifocus_to_due. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).
