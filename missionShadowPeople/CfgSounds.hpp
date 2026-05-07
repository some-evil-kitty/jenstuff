class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class jen_whispers
	{
		name = "Whispers";						// display name
		sound[] = { "snd\whispers.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = {};			// subtitles
	};
    class jen_heartBeat
    {
		name = "Heartbeat";						// display name
		sound[] = { "snd\heartbeat.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = {};			// subtitles 
    }
};