SuperTux Add-ons
==============

## Packaging your add-on

To package your add-on, you can use the "Package Add-on" option in the main level editor menu.

[Information about manual add-on packaging](https://github.com/SuperTux/supertux/wiki/Add-ons#manually-packaging-addons)

[Information about add-on .nfo files](https://github.com/SuperTux/supertux/wiki/Add-ons#nfo-files)

## Adding an add-on
Adding an add-on involves authoring two commits. Here is what each one has to add/change:

1. Adds the archive of your add-on to the `repository/` directory.
2. Edits the `index.nfo` for the latest SuperTux version, by adding the entry for your add-on. This will allow it to be downloaded from the in-game add-on manager.

An add-on data entry looks like this:

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

* **addon-commit-hash** represents the full commit hash of your first commit, which adds your add-on in the `repository/` directory. This is important to include, because it allows the current SuperTux release to always get its versions of all add-ons for backwards compatibility.
* **addon-md5-checksum** represents your new add-on archive's MD5 checksum hash. The MD5 checksum is being used for checking the integrity of the add-on.
* For the rest of the entries, the rules listed for [add-on `.nfo` files](https://github.com/SuperTux/supertux/wiki/Add-ons#nfo-files) also apply here.

## Updating an add-on
Add-ons are automatically updated in this repository. Updating the add-on archives in the `repository/` directory is all that has to be done by the user. The automatic workflow for updating add-ons in the latest index file will take care of the rest.
