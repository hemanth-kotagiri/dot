//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"🧠 ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"🔊 ", "volume",					                                1,		0},
	{"🌡️ ", "temperature",				                            	5,		0},
	{"📅 ", "date '+%A %d-%m-%y | ⌛%I:%M:%S %p'",		         			1,		0},
	{" ", "diskusage",		         			60,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
//static char delim[] = " | ";
static char delim[] = "  ";
static unsigned int delimLen = 5;
