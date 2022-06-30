SuperTux Addons
==============

## Packaging your addon

To package your addon, you can use the "Package Add-on" option in the main level editor menu.

<details>
<summary>Additional information for addon .nfo files</summary>
<br>
Addon .nfo files look like this:

```
(supertux-addoninfo
  (id "octo-levels")
  (version 1)
  (type "worldmap")
  (title "Octo's Levels")
  (author "Octo")
  (license "GPL 2+ / CC-by-sa 3.0")
)
```

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
`/octo-levels.nfo` in this example.
</details>

## Adding/Updating an addon
To update an addon in the repository, you would need to submit a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).
The pull request should contain two commits:

1. Adds/replaces the archive of your addon, contained in the `repository/` directory with a new one, which contains your changes.
2. Edits the `index.nfo` for the latest SuperTux version, by adding/modifying the entry for your addon. This will allow it to be downloaded from the in-game addon manager.

An addon data entry looks like this:

<pre>
(supertux-addoninfo
    (id "<b>addon-id</b>")
    (version <b>addon-version</b>)
    (type <b>addon-type</b>)
    (title "<b>addon-title</b>")
    (author "<b>addon-author</b>")
    (license "<b>addon-license</b>")
    (url "https://raw.githubusercontent.com/SuperTux/addons/<b>addon-commit-hash</b>/repository/<b>addon-file-name</b>")
    (md5 "<b>addon-md5-checksum</b>")
)
</pre>

* **addon-commit-hash** represents the full commit hash of your first commit, which adds/replaces your addon in the `repository/` directory. This is important to include, because it allows the current SuperTux release to always get its versions of all addons for backwards compatibility.
* **addon-md5-checksum** represents your new, modified addon archive's MD5 checksum hash. This needs to be updated every time the addon is updated, because the game will not be able to download your addon otherwise. The MD5 checksum is being used for checking the integrity of the addon.
* For the rest of the entries, the rules listed above for addon `.nfo` files also apply here.
