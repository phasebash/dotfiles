Server.program ="/usr/bin/supernova -S 96000";

"SC_JACK_DEFAULT_OUTPUTS".setenv(
    "firewire_pcm:0001f20000012db2_pbk_Phones-L_out,firewire_pcm:0001f20000012db2_pbk_Phones-R_out"
);

"SC_JACK_DEFAULT_INPUTS".setenv(
    "firewire_pcm:0001f20000012db2_cap_Mix-L_in,firewire_pcm:0001f20000012db2_cap_Mix-R_in"
);

Server.local.boot;
