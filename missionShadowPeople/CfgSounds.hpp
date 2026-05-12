class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class jen_whispers
	{
		name = "Whispers";						// display name
		sound[] = { "snd\whispers.wss", 1, 2, 150 };	// file, volume, pitch, maxDistance
		titles[] = {};			// subtitles
	};
	class jen_demonScream
	{
		name = "Demon Scream";						// display name
		sound[] = { "snd\demonscream.wss", 1, 2, 150 };	// file, volume, pitch, maxDistance
		titles[] = {};			// subtitles
	};
    class jen_heartBeat
    {
		name = "Heartbeat";						// display name
		sound[] = { "snd\heartbeat.wss", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = {};			// subtitles 
    }
};