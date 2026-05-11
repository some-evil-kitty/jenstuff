class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class jen_bleeding
	{
		name = "Bleeding";						// display name
		sound[] = { "snd\bloodFeedback.wss", 1, 1, 150 };	// file, volume, pitch, maxDistance
		titles[] = {};			// subtitles
	};
};