SuperTux Addon
==============

Addon .nfo files look like this:

    (supertux-addoninfo
      (id "octo-levels")
      (version 1)
      (type "worldmap")
      (title "Octo's Levels")
      (author "Octo")
      (license "GPL 2+ / CC-by-sa 3.0"))

The `id` is a identifier for this addon, it has to be unique across
all addons, as it is used to compare the addons with new ones from
other sources to find updates. It is recomment to use something like
"{author}-{title}". The `id` must be all lowercase and only contain
characters of the set "[a-z][0-9]-", underscore is not allowed as it
is used for the version number.

The `version` number is a simple integer, it should be increased each
time the addon is changed.

The `type` gives an indication of what is contained within the addon,
valid values are "worldmap", "world", "levelset". At the moment this
is only a description for the user and doesn't have any impact on how
the addon is handled.

The .nfo file itself needs to be stored in the top-level directory of
the addon and should be named by the unique id of the addon, i.e.
"/octo-levels.nfo" in this example.
