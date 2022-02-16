# asdf-loadout

Want to just start off "asdf" with all plugins available? Yep.

  ./asdf_load_up.sh

If the asdf plugin repo is successfully downloaded, you will be given a plugin
count and asked to confirm the loadup by entering "GO AHEAD".

If the asdf plugin repo cannot be downloaded, the script will fallback on a cached
list of the plugins and also get confirmation.

If you GO AHEAD, then all of the plugins will be added to asdf and available for the install commands.

# Why?

The plugins do not seem to be something that can be queried from the asdf tool itself. Since there
is a plugin repo being maintained, this is a quick way to load up on the plugin url configs.
