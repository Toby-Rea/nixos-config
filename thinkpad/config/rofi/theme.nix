{ config, ... }:

let inherit (config.lib.formats.rasi) mkLiteral;

in
{
  "*" = {
    bg = mkLiteral "#fafafa";
    bg-border = mkLiteral "#f3f3f3";
    fg = mkLiteral "#5a5a5a";
    accent-bg = mkLiteral "#fac7cf";
    accent-fg = mkLiteral "#ffffff";
    spacing = mkLiteral "10";
    background-color = mkLiteral "#fafafa";
  };

  "#window" = {
    width = mkLiteral "30%";
    border = mkLiteral "0.125em";
    padding = mkLiteral "1.0em";
    background-color = mkLiteral "#fafafa";
    border-color = mkLiteral "#f3f3f3";
  };

  "#inputbar" = {
    spacing = mkLiteral "0px";
    padding = mkLiteral "0px 5px 0px 5px";
    text-color = mkLiteral "#5a5a5a";
    children = map mkLiteral [ "prompt" "textbox-prompt-colon" "entry" "case-indicator" ];
  };

  "#prompt" = {
    spacing = mkLiteral "0";
    text-color = mkLiteral "#5a5a5a";
  };

  "#textbox-prompt-colon" = {
    expand = mkLiteral "false";
    margin = mkLiteral "0px 0.3em 0em 0em";
    text-color = "#5a5a5a";
  };

  "#entry" = {
    spacing = mkLiteral "5px";
    text-color = mkLiteral "#5a5a5a";
  };

  "#listview" = {
    fixed-height = mkLiteral "true";
    spacing = mkLiteral "0px";
    scrollbar = mkLiteral "false";
    lines = mkLiteral "8";
  };

  "#element" = {
    border = mkLiteral "0";
    padding = mkLiteral "10px 5px 10px 5px";
    background-color = mkLiteral "#fafafa";
    text-color = mkLiteral "#5a5a5a";
  };

  "#element-text" = {
    background-color = mkLiteral "inherit";
  };

  "#element-icon" = {
    horizontal-align = mkLiteral "0.5";
    vertical-align = mkLiteral "0.5";
    padding = mkLiteral "0.25em";
    background-color = mkLiteral "inherit";
  };

  "#element selected" = {
    background-color = mkLiteral "#fac7cf";
    text-color = mkLiteral "#ffffff";
  };
}
