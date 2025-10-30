{ config, pkgs, ... }:
{
  home.file.".config/hypr/hyprland.conf".text = 
  ''
    # Monitor _____________________________________________________________
    monitor=,preferred,auto,auto

    # Programs ____________________________________________________________
    $terminal = alacritty
    $browser = firefox
    $menu = sherlock
    $fileManager = thunar
    $messagesCenter = swaync-client -t

    # Autostart ___________________________________________________________
    exec-once = swww-daemon
    exec-once = swaync
    exec-once = waybar

    exec-once = hyprctl dispatch workspace 1 && firefox
    exec-once = hyprctl dispatch workspace 2 && discord

    # Keyboard ____________________________________________________________
    input {
      kb_layout = us,ru,sk
      kb_variant =
      kb_model =
      kb_options =grp:alt_shift_toggle
      kb_rules =

      follow_mouse = 1
      sensitivity = 0
    }

    # Binds _______________________________________________________________
    $main = SUPER

    bind = $main, Q, exec, $terminal
    bind = $main, B, exec, $browser
    bind = $main, E, exec, $fileManager
    bind = $main, R, exec, $menu
    bind = $main Alt, L, exec, systemctl suspend
    bind = $main, Tab, exec, $messagesCenter

    bind = $main, S, exec, hyprshot -m region --clipboard-only
    bind = $main, V, exec, hyprpicker -a
    bind = $main, L, exec, hyprlock
    bind = $main, C, killactive,

    bind = $main, F, togglefloating
    bind = $main, W, fullscreen

    bind = $main, left, movefocus, l
    bind = $main, right, movefocus, r
    bind = $main, up, movefocus, u
    bind = $main, down, movefocus, d

    bind = $main, h, movefocus, l
    bind = $main, l, movefocus, r
    bind = $main, j, movefocus, u
    bind = $main, k, movefocus, d
    
    bind = $main, 1, workspace, 1
    bind = $main, 2, workspace, 2
    bind = $main, 3, workspace, 3
    bind = $main, 4, workspace, 4
    bind = $main, 5, workspace, 5
    bind = $main, 6, workspace, 6
    bind = $main, 7, workspace, 7
    bind = $main, 8, workspace, 8
    bind = $main, 9, workspace, 9
    bind = $main, 0, workspace, 10

    bind = $main SHIFT, 1, movetoworkspace, 1
    bind = $main SHIFT, 2, movetoworkspace, 2
    bind = $main SHIFT, 3, movetoworkspace, 3
    bind = $main SHIFT, 4, movetoworkspace, 4
    bind = $main SHIFT, 5, movetoworkspace, 5
    bind = $main SHIFT, 6, movetoworkspace, 6
    bind = $main SHIFT, 7, movetoworkspace, 7
    bind = $main SHIFT, 8, movetoworkspace, 8
    bind = $main SHIFT, 9, movetoworkspace, 9
    bind = $main SHIFT, 0, movetoworkspace, 10

    bindm = $main, mouse:272, movewindow
    bindm = $main, mouse:273, resizewindow

    # Volume ______________________________________________________________
    binde = $main, D, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%+
    binde = $main, A, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%-
    bindl = $main, X, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    # Personalisation _____________________________________________________
    master {
      allow_small_split = true
      smart_resizing = true
    }
    
    general {
      layout = master
      gaps_in = 4
      gaps_out = 7
      border_size = 2
      col.active_border = rgba(999999ff)
    }

    decoration {
      rounding = 4
      rounding_power = 4.0
      
      active_opacity = 1.0
      inactive_opacity = 0.8
      inactive_opacity = 0.9
      shadow {
        enabled = true
        range = 4
        render_power = 3
        color = rgba(1a1a1aee)
      }

      blur {
        enabled = true
        size = 3
        passes = 5

        vibrancy = 10
      }
    }

    animations {
      enabled = yes, please :)

      bezier = easeOutQuint,0.23,1,0.32,1
      bezier = easeInOutCubic,0.65,0.05,0.36,1
      bezier = linear,0,0,1,1
      bezier = almostLinear,0.5,0.5,0.75,1.0
      bezier = quick,0.15,0,0.1,1

      animation = global, 1, 10, default
      animation = border, 1, 5.39, easeOutQuint
      animation = windows, 1, 4.79, easeOutQuint
      animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
      animation = windowsOut, 1, 1.49, linear, popin 87%
      animation = fadeIn, 1, 1.73, almostLinear
      animation = fadeOut, 1, 1.46, almostLinear
      animation = fade, 1, 3.03, quick
      animation = layers, 1, 3.81, easeOutQuint
      animation = layersIn, 1, 4, easeOutQuint, fade
      animation = layersOut, 1, 1.5, linear, fade
      animation = fadeLayersIn, 1, 1.79, almostLinear
      animation = fadeLayersOut, 1, 1.39, almostLinear
      animation = workspaces, 1, 1.94, almostLinear, fade
      animation = workspacesIn, 1, 1.21, almostLinear, fade
      animation = workspacesOut, 1, 1.94, almostLinear, fade
    }

    windowrulev2 = float, size 800x600, class:Thunar
  '';
}
