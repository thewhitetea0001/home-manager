{ pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  home.file.".config/waybar/style.css".text = ''
    @define-color white      #F2F2F2;
    @define-color black      #000203;
    @define-color text       #BECBCB;
    @define-color lightgray  #686868;
    @define-color darkgray   #353535;
    @define-color red        #F38BA8;

    *{
      font-family:
        Iosevka,
        "Material Design Icons Desktop";
      font-size: 17px;
      padding: 0;
      margin: 0;

      background: rgba(23, 23, 23, 0.9);
      border-radius: 4px;
    }

    #battery {
      margin-bottom: 7px;
    }

    #custom-split {
      margin-bottom: 12px;
    }

    #pulseaudio {
      margin-top: 4px;
    }

    #pulseaudio-slider {
      margin-top: 6px;
    }

    #pulseaudio-slider slider {
      min-height: 0px;
      min-width: 0px;
      opacity: 0;
      background-image: none;
      border: none;
      box-shadow: none;
    }

    #pulseaudio-slider trough {
      min-height: 40px;
      min-width: 5px;
      border-radius: 5px;
      background-color: black;
    }

    #pulseaudio-slider highlight {
      min-width: 5px;
      border: 1px solid @text;
      border-radius: 5px;
      background-color: @text;
    }
  '';
}
