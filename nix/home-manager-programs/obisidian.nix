{ config, pkgs, ... }:
{

  # Only on darwin
  programs.obsidian = pkgs.lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    package = null;

    vaults."notes" = {
      enable = true;
      target = "./projects/own/notes";
    };

    defaultSettings = {
      app = {
        strictLineBreaks = true;
        foldHeading = false;
        foldIndent = false;
        showLineNumber = true;
        vimMode = true;
        livePreview = false;
        readableLineLength = true;
        defaultViewMode = "source";
        focusNewTab = true;
        propertiesInDocument = "source";
        showIndentGuide = true;
        spellcheck = true;
        autoPairBrackets = true;
        autoPairMarkdown = true;
        smartIndentList = true;
        useTab = true;
        tabSize = 2;
        autoConvertHtml = true;
        alwaysUpdateLinks = true;
        showUnsupportedFiles = true;
        showInlineTitle = true;
      };

      appearance = {
        theme = "obsidian";
        translucency = false;
        accentColor = "";
        baseFontSizeAction = true;
        showViewHeader = true;
        showRibbon = true;
        nativeMenus = true;
      };

      corePlugins = [
        "file-explorer"
        "global-search"
        "switcher"
        "graph"
        "backlink"
        "canvas"
        "outgoing-link"
        "tag-pane"
        "properties"
        "page-preview"
        "daily-notes"
        "templates"
        "note-composer"
        "command-palette"
        "slash-command"
        "editor-status"
        "bookmarks"
        "markdown-importer"
        "zk-prefixer"
        "random-note"
        "outline"
        "word-count"
        "slides"
        "workspaces"
        "file-recovery"
      ];
    };
  };
}
