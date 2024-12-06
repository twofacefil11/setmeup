#!/bin/bash

#util
start_dir=$(pwd)
tw=$(tput cols)
spacer="        "

#paths
alacritty_path="$HOME/.config/alacritty"
zellij_path="$HOME/.config/zellij"
yazi_path="$HOME/.config/yazi"
keyd_path="/etc/keyd"

fonts_path="$HOME/.local/share/fonts"


echo 
echo "[▓░░░░] Creating config paths.."
mkdir -pv $alacritty_path $zellij_path $yazi_path/flavors 


#configs -------------------------------------------------------------------
alacritty_config=$(cat << EOF
[window]
	startup_mode = "Fullscreen"

[terminal]
	shell = "zellij"

[font] 
normal = {family = "GohuFont uni 14 Nerd Font Mono"}
EOF
)

zellij_config=$(cat << EOF
keybinds clear-defaults=true {
    locked {
        bind "Ctrl g" { SwitchToMode "normal"; }
    }
    pane {
        bind "left" { MoveFocus "left"; }
        bind "down" { MoveFocus "down"; }
        bind "up" { MoveFocus "up"; }
        bind "right" { MoveFocus "right"; }
        bind "c" { SwitchToMode "renamepane"; PaneNameInput 0; }
        bind "d" { NewPane "down"; SwitchToMode "normal"; }
        bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "normal"; }
        bind "f" { ToggleFocusFullscreen; SwitchToMode "normal"; }
        bind "h" { MoveFocus "left"; }
        bind "j" { MoveFocus "down"; }
        bind "k" { MoveFocus "up"; }
        bind "l" { MoveFocus "right"; }
        bind "n" { NewPane; SwitchToMode "normal"; }
        bind "p" { SwitchFocus; }
        bind "Ctrl p" { SwitchToMode "normal"; }
        bind "r" { NewPane "right"; SwitchToMode "normal"; }
        bind "w" { ToggleFloatingPanes; SwitchToMode "normal"; }
        bind "z" { TogglePaneFrames; SwitchToMode "normal"; }
    }
    tab {
        bind "left" { GoToPreviousTab; }
        bind "down" { GoToNextTab; }
        bind "up" { GoToPreviousTab; }
        bind "right" { GoToNextTab; }
        bind "1" { GoToTab 1; SwitchToMode "normal"; }
        bind "2" { GoToTab 2; SwitchToMode "normal"; }
        bind "3" { GoToTab 3; SwitchToMode "normal"; }
        bind "4" { GoToTab 4; SwitchToMode "normal"; }
        bind "5" { GoToTab 5; SwitchToMode "normal"; }
        bind "6" { GoToTab 6; SwitchToMode "normal"; }
        bind "7" { GoToTab 7; SwitchToMode "normal"; }
        bind "8" { GoToTab 8; SwitchToMode "normal"; }
        bind "9" { GoToTab 9; SwitchToMode "normal"; }
        bind "[" { BreakPaneLeft; SwitchToMode "normal"; }
        bind "]" { BreakPaneRight; SwitchToMode "normal"; }
        bind "b" { BreakPane; SwitchToMode "normal"; }
        bind "h" { GoToPreviousTab; }
        bind "j" { GoToNextTab; }
        bind "k" { GoToPreviousTab; }
        bind "l" { GoToNextTab; }
        bind "n" { NewTab; SwitchToMode "normal"; }
        bind "r" { SwitchToMode "renametab"; TabNameInput 0; }
        bind "s" { ToggleActiveSyncTab; SwitchToMode "normal"; }
        bind "Ctrl t" { SwitchToMode "normal"; }
        bind "x" { CloseTab; SwitchToMode "normal"; }
        bind "tab" { ToggleTab; }
    }
    resize {
        bind "left" { Resize "Increase left"; }
        bind "down" { Resize "Increase down"; }
        bind "up" { Resize "Increase up"; }
        bind "right" { Resize "Increase right"; }
        bind "+" { Resize "Increase"; }
        bind "-" { Resize "Decrease"; }
        bind "=" { Resize "Increase"; }
        bind "H" { Resize "Decrease left"; }
        bind "J" { Resize "Decrease down"; }
        bind "K" { Resize "Decrease up"; }
        bind "L" { Resize "Decrease right"; }
        bind "h" { Resize "Increase left"; }
        bind "j" { Resize "Increase down"; }
        bind "k" { Resize "Increase up"; }
        bind "l" { Resize "Increase right"; }
        bind "Ctrl n" { SwitchToMode "normal"; }
    }
    move {
        bind "left" { MovePane "left"; }
        bind "down" { MovePane "down"; }
        bind "up" { MovePane "up"; }
        bind "right" { MovePane "right"; }
        bind "h" { MovePane "left"; }
        bind "Ctrl h" { SwitchToMode "normal"; }
        bind "j" { MovePane "down"; }
        bind "k" { MovePane "up"; }
        bind "l" { MovePane "right"; }
        bind "n" { MovePane; }
        bind "p" { MovePaneBackwards; }
        bind "tab" { MovePane; }
    }
    scroll {
        bind "Alt left" { MoveFocusOrTab "left"; SwitchToMode "normal"; }
        bind "Alt down" { MoveFocus "down"; SwitchToMode "normal"; }
        bind "Alt up" { MoveFocus "up"; SwitchToMode "normal"; }
        bind "Alt right" { MoveFocusOrTab "right"; SwitchToMode "normal"; }
        bind "e" { EditScrollback; SwitchToMode "normal"; }
        bind "Alt h" { MoveFocusOrTab "left"; SwitchToMode "normal"; }
        bind "Alt j" { MoveFocus "down"; SwitchToMode "normal"; }
        bind "Alt k" { MoveFocus "up"; SwitchToMode "normal"; }
        bind "Alt l" { MoveFocusOrTab "right"; SwitchToMode "normal"; }
        bind "s" { SwitchToMode "entersearch"; SearchInput 0; }
    }
    search {
        bind "c" { SearchToggleOption "CaseSensitivity"; }
        bind "n" { Search "down"; }
        bind "o" { SearchToggleOption "WholeWord"; }
        bind "p" { Search "up"; }
        bind "w" { SearchToggleOption "Wrap"; }
    }
    session {
        bind "c" {
            LaunchOrFocusPlugin "configuration" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "normal"
        }
        bind "Ctrl o" { SwitchToMode "normal"; }
        bind "p" {
            LaunchOrFocusPlugin "plugin-manager" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "normal"
        }
        bind "w" {
            LaunchOrFocusPlugin "session-manager" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "normal"
        }
    }
    shared_except "locked" {
        bind "Alt +" { Resize "Increase"; }
        bind "Alt -" { Resize "Decrease"; }
        bind "Alt =" { Resize "Increase"; }
        bind "Alt [" { PreviousSwapLayout; }
        bind "Alt ]" { NextSwapLayout; }
        bind "Alt f" { ToggleFloatingPanes; }
        bind "Ctrl g" { SwitchToMode "locked"; }
        bind "Alt i" { MoveTab "left"; }
        bind "Alt n" { NewPane; }
        bind "Alt o" { MoveTab "right"; }
        bind "Ctrl q" { Quit; }
        bind "Alt p" {CloseFocus; SwitchToMode "normal";}
    }
    shared_except "locked" "move" {
        bind "Ctrl h" { SwitchToMode "move"; }
    }
    shared_except "locked" "session" {
        bind "Ctrl o" { SwitchToMode "session"; }
    }
    shared_except "locked" "scroll" {
        bind "Alt left" { MoveFocusOrTab "left"; }
        bind "Alt down" { MoveFocus "down"; }
        bind "Alt up" { MoveFocus "up"; }
        bind "Alt right" { MoveFocusOrTab "right"; }
        bind "Alt h" { MoveFocusOrTab "left"; }
        bind "Alt j" { MoveFocus "down"; }
        bind "Alt k" { MoveFocus "up"; }
        bind "Alt l" { MoveFocusOrTab "right"; }
    }
    shared_except "locked" "scroll" "search" "tmux" {
        bind "Ctrl b" { SwitchToMode "tmux"; }
    }
    shared_except "locked" "scroll" "search" {
        bind "Ctrl s" { SwitchToMode "scroll"; }
    }
    shared_except "locked" "tab" {
        bind "Ctrl t" { SwitchToMode "tab"; }
    }
    shared_except "locked" "pane" {
        bind "Ctrl p" { SwitchToMode "pane"; }
    }
    shared_except "locked" "resize" {
        bind "Ctrl n" { SwitchToMode "resize"; }
    }
    shared_except "normal" "locked" "entersearch" {
        bind "enter" { SwitchToMode "normal"; }
    }
    shared_except "normal" "locked" "entersearch" "renametab" "renamepane" {
        bind "esc" { SwitchToMode "normal"; }
    }
    shared_among "pane" "tmux" {
        bind "x" { CloseFocus; SwitchToMode "normal"; }
    }
    shared_among "scroll" "search" {
        bind "PageDown" { PageScrollDown; }
        bind "PageUp" { PageScrollUp; }
        bind "left" { PageScrollUp; }
        bind "down" { ScrollDown; }
        bind "up" { ScrollUp; }
        bind "right" { PageScrollDown; }
        bind "Ctrl b" { PageScrollUp; }
        bind "Ctrl c" { ScrollToBottom; SwitchToMode "normal"; }
        bind "d" { HalfPageScrollDown; }
        bind "Ctrl f" { PageScrollDown; }
        bind "h" { PageScrollUp; }
        bind "j" { ScrollDown; }
        bind "k" { ScrollUp; }
        bind "l" { PageScrollDown; }
        bind "Ctrl s" { SwitchToMode "normal"; }
        bind "u" { HalfPageScrollUp; }
    }
    entersearch {
        bind "Ctrl c" { SwitchToMode "scroll"; }
        bind "esc" { SwitchToMode "scroll"; }
        bind "enter" { SwitchToMode "search"; }
    }
    renametab {
        bind "esc" { UndoRenameTab; SwitchToMode "tab"; }
    }
    shared_among "renametab" "renamepane" {
        bind "Ctrl c" { SwitchToMode "normal"; }
    }
    renamepane {
        bind "esc" { UndoRenamePane; SwitchToMode "pane"; }
    }
    shared_among "session" "tmux" {
        bind "d" { Detach; }
    }
    tmux {
        bind "left" { MoveFocus "left"; SwitchToMode "normal"; }
        bind "down" { MoveFocus "down"; SwitchToMode "normal"; }
        bind "up" { MoveFocus "up"; SwitchToMode "normal"; }
        bind "right" { MoveFocus "right"; SwitchToMode "normal"; }
        bind "space" { NextSwapLayout; }
        bind "\"" { NewPane "down"; SwitchToMode "normal"; }
        bind "%" { NewPane "right"; SwitchToMode "normal"; }
        bind "," { SwitchToMode "renametab"; }
        bind "[" { SwitchToMode "scroll"; }
        bind "Ctrl b" { Write 2; SwitchToMode "normal"; }
        bind "c" { NewTab; SwitchToMode "normal"; }
        bind "h" { MoveFocus "left"; SwitchToMode "normal"; }
        bind "j" { MoveFocus "down"; SwitchToMode "normal"; }
        bind "k" { MoveFocus "up"; SwitchToMode "normal"; }
        bind "l" { MoveFocus "right"; SwitchToMode "normal"; }
        bind "n" { GoToNextTab; SwitchToMode "normal"; }
        bind "o" { FocusNextPane; }
        bind "p" { GoToPreviousTab; SwitchToMode "normal"; }
        bind "z" { ToggleFocusFullscreen; SwitchToMode "normal"; }
    }
}

// Plugin aliases - can be used to change the implementation of Zellij
// changing these requires a restart to take effect
plugins {
    compact-bar location="zellij:compact-bar"
    configuration location="zellij:configuration"
    filepicker location="zellij:strider" {
        cwd "/"
    }
    plugin-manager location="zellij:plugin-manager"
    session-manager location="zellij:session-manager"
    status-bar location="zellij:status-bar"
    strider location="zellij:strider"
    tab-bar location="zellij:tab-bar"
    welcome-screen location="zellij:session-manager" {
        welcome_screen true
    }
}

// Plugins to load in the background when a new session starts
// eg. "file:/path/to/my-plugin.wasm"
// eg. "https://example.com/my-plugin.wasm"
load_plugins {
}
 
// Use a simplified UI without special fonts (arrow glyphs)
// Options:
//   - true
//   - false (Default)
// 
// simplified_ui true
 
// Choose the theme that is specified in the themes section.
// Default: default
// 
// theme "dracula"
 
// Choose the base input mode of zellij.
// Default: normal
// 
default_mode "normal"
 
// Choose the path to the default shell that zellij will use for opening new panes
// Default: $SHELL
// 
// default_shell "fish"
 
// Choose the path to override cwd that zellij will use for opening new panes
// 
// default_cwd "/tmp"
 
// The name of the default layout to load on startup
// Default: "default"
// 
// default_layout "compact"
 
// The folder in which Zellij will look for layouts
// (Requires restart)
// 
// layout_dir "/tmp"
 
// The folder in which Zellij will look for themes
// (Requires restart)
// 
// theme_dir "/tmp"
 
// Toggle enabling the mouse mode.
// On certain configurations, or terminals this could
// potentially interfere with copying text.
// Options:
//   - true (default)
//   - false
// 
// mouse_mode false
 
// Toggle having pane frames around the panes
// Options:
//   - true (default, enabled)
//   - false
// 
// pane_frames false
 
// When attaching to an existing session with other users,
// should the session be mirrored (true)
// or should each user have their own cursor (false)
// (Requires restart)
// Default: false
// 
// mirror_session true
 
// Choose what to do when zellij receives SIGTERM, SIGINT, SIGQUIT or SIGHUP
// eg. when terminal window with an active zellij session is closed
// (Requires restart)
// Options:
//   - detach (Default)
//   - quit
// 
// on_force_close "quit"
 
// Configure the scroll back buffer size
// This is the number of lines zellij stores for each pane in the scroll back
// buffer. Excess number of lines are discarded in a FIFO fashion.
// (Requires restart)
// Valid values: positive integers
// Default value: 10000
// 
// scroll_buffer_size 10000
 
// Provide a command to execute when copying text. The text will be piped to
// the stdin of the program to perform the copy. This can be used with
// terminal emulators which do not support the OSC 52 ANSI control sequence
// that will be used by default if this option is not set.
// Examples:
//
// copy_command "xclip -selection clipboard" // x11
// copy_command "wl-copy"                    // wayland
// copy_command "pbcopy"                     // osx
// 
// copy_command "pbcopy"
 
// Choose the destination for copied text
// Allows using the primary selection buffer (on x11/wayland) instead of the system clipboard.
// Does not apply when using copy_command.
// Options:
//   - system (default)
//   - primary
// 
// copy_clipboard "primary"
 
// Enable automatic copying (and clearing) of selection when releasing mouse
// Default: true
// 
// copy_on_select true
 
// Path to the default editor to use to edit pane scrollbuffer
// Default: $EDITOR or $VISUAL
// scrollback_editor "/usr/bin/vim"
 
// A fixed name to always give the Zellij session.
// otherwise this will error if such a session exists.
// Default: <RANDOM>
// 
// session_name "My singleton session"
 
// 
// attach_to_session true
 
// Toggle between having Zellij lay out panes according to a predefined set of layouts whenever possible
// Options:
//   - true (default)
//   - false
// 
// auto_layout false
 
// Whether sessions should be serialized to the cache folder (including their tabs/panes, cwds and running commands) so that they can later be resurrected
// Options:
//   - true (default)
//   - false
// 
// session_serialization false
 
// Whether pane viewports are serialized along with the session, default is false
// Options:
//   - true
//   - false (default)
// 
// serialize_pane_viewport false
 
// Scrollback lines to serialize along with the pane viewport when serializing sessions, 0
// defaults to the scrollback size. If this number is higher than the scrollback size, it will
// 
// scrollback_lines_to_serialize 10000
 
// Enable or disable the rendering of styled and colored underlines (undercurl).
// May need to be disabled for certain unsupported terminals
// (Requires restart)
// Default: true
// 
// styled_underlines false
 
// How often in seconds sessions are serialized
// 
// serialization_interval 10000
 
// Enable or disable writing of session metadata to disk (if disabled, other sessions might not know
// metadata info on this session)
// (Requires restart)
// Default: false
// 
// disable_session_metadata false
 
// Enable or disable support for the enhanced Kitty Keyboard Protocol (the host terminal must also support it)
// (Requires restart)
// Default: true (if the host terminal supports it)
// 
// support_kitty_keyboard_protocol fajlse
EOF
)

yazi_yazi=$(cat << EOF
[manager]
  ratio = [2,3,4]
  show_hidden = true
[opener]
edit = [
  {run = 'zellij run -- lvim "$@"', block = true}
]
EOF
)

yazi_theme=$(cat << EOF
[flavor]
  use = "kanagawa"
EOF
)
echo
echo "${spacer}Select setup for keyd (capslock <-> esc)"
echo "${spacer}  w: if you run in WSL"
echo "${spacer}  c: Chromebook (with SEARCH instead of CapsLock)"
echo "${spacer}  l: For bare-metal linux"
echo
read -p "${spacer}Enter your choice: " choice
echo

#keyd making problems like always (DONT FORMAT IT)
case "$choice" in 
  w)
    echo "[▓▓░░░] You gotta figure this one out on your own (in the host system)"
    keyd_config="You can delete this file. Check what "keyd" is. -f"
    handle_keyd=0
    ;;
  c)
    echo "[▓▓░░░] Chromebook it is (poor you)"
    keyd_config=$(cat << EOF
[ids]
  *
[main]
  esc = layer(meta)
  meta = esc
EOF
)       
    ;;
  l)
    echo "[▓▓░░░] Normal linux it is. (i've not tested it yet)"
    keyd_config=$(cat << EOF
[ids]
  *
[main]
esc = layer(capslock)
capslock = esc
EOF
)
    ;;
  *)
    echo "[▓▓░░░] Wrong input man."
    echo "${spacer}  Handle keyd urlsf or rerun"
    echo "${spacer}DONT WORRY the rest of the setup will finish just fine" 
    keyd_config="You can delete this. Check what keyd is. -f"
    handle_keyd=0
    ;; 
esac
#------------------------------------------------------------------------------
echo
echo "[▓▓▓░░] Writting configs:"

  echo "${spacer}  ⋅ alacritty"
    echo "$alacritty_config" > "$alacritty_path/alacritty.toml"

  echo "${spacer}  ⋅ zellij"
    echo "$zellij_config" > "$zellij_path/config.kdl"

  echo "${spacer}  ⋅ yazi"
    echo "$yazi_yazi" > "$yazi_path/yazi.toml"
    echo "$yazi_theme" > "$yazi_path/theme.toml"

    if [[ $handle_keyd -eq 1 ]]; then
      echo "${spacer}  -keyd (it needs sudo)"
      sudo mkdir -vp $keyd_path
      sudo echo "$keyd_config" > "$keyd_path/default.conf"
    else
      echo
      echo "${spacer}Skippin keyd.."
    fi

echo
echo "[▓▓▓▓░] Gitting stuff over here..├────┐"
 
for ((i=0; i < $tw; i++)); do
  printf "─"
done

echo "${spacer}  ⋅ yazi flavor (kanagawa)"
  echo
    cd $yazi_path/flavors
    git clone https://github.com/dangooddd/kanagawa.yazi.git
    cd $start_dir

    for ((i=0; i < $tw; i++)); do
      printf "-"
    done
    echo

  echo "${spacer}  ⋅ font: GohuFont uni 14 Nerd Font Mono"
  echo
    wget -P $fonts_path https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Gohu/uni-14/GohuFontuni14NerdFontMono-Regular.ttf


for ((i=0; i < $tw; i++)); do
  printf "─"
done
echo

echo "[▓▓▓▓▓▓] The rest is up to you."
