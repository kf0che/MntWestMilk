#!/bin/bash

# Update package list and upgrade system
sudo apt update && sudo apt upgrade -y

# Install Conky
sudo apt install -y conky

# Create a basic Conky configuration file
cat <<EOL > ~/.conkyrc
conky.config = {
    alignment = 'top_right',
    background = true,
    update_interval = 1.0,
    double_buffer = true,
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    minimum_width = 200, minimum_height = 200,
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = true,
    use_xft = true,
    font = 'DejaVu Sans Mono:size=10',
    xftalpha = 0.8,
    uppercase = false,
    default_color = 'white',
};

conky.text = [[
${time %a, %b %d %Y %H:%M:%S}
$hr
CPU: $cpu%  ${cpubar 4}
RAM: $mem/$memmax $memperc%  ${membar 4}
Disk: ${fs_used /}/${fs_size /} ${fs_bar 4 /}
]];
EOL

# Notify user
echo "Conky has been installed and a basic configuration file has been created at ~/.conkyrc."
echo "You can start Conky by running 'conky' in the terminal."