randomize();

enum Faces {
	Angry,
	Happy,
	Sad,
	Smile
}

enum Colors {
	Gray,
	CoolGray,
	Blue,
	Red
}

enum Shapes {
	Circle,
	Box
}


bodyHelp = [
	"Circle Shape\nIt makes it easy to roll.",
	"Square Shape\nLife isn't easy for squares, but the crowd loves an underdog.\n+2 style",
]

facesHelp = [
	"Angry Face\nYour anger makes you faster, but less stylish.\n-1 style",
	"Happy Face\nA happy rock is a good rock. The happiness makes you bouncy. \n+1 jump height\n-1 defense",
	"Sad Face\nSadness makes you not care about the things that hurt you.\n+1 defense",
	"Smile\nThe default state of PetRock. Doesn't do anything good but not anything bad."
];

colorsHelp = [
	"Gray\nA good iron rich gray. Keeps you healthy\n+1 defense",
	"Light Gray\nDefault rocky life. It's the best.\n+1 style",
	"Blue\nA very cool color. But going fast isn't cool.\n+2 style\n-1 speed",
	"Red\nRed ones go fastah\n+1 speed"
];

hatsHelp = [
	"Nothing\nYou're a rock, you don't need a helmet",
	"Top Hat\nNice.\n+1 double jump\n+2 style",
	"Plum Hat\nIt's no top hat, but it's still cool\n+1 style\n+1 speed"
]

helps = [bodyHelp, facesHelp, colorsHelp, hatsHelp];

colors = [ 0x707070,  0x9F9884, 0xDED150, 0x694EC3];
hatSprites = [noone, spr_tophat, spr_plumhat];

maxBody = sprite_get_number(spr_body);
maxFace = sprite_get_number(spr_face);
maxColor = array_length_1d(colors);
maxHat = array_length_1d(hatSprites);

selectedFace = irandom(maxFace-1)
selectedBody = irandom(maxBody-1);
selectedColor = irandom(maxColor-1);
selectedHat = irandom(maxHat-1)

selectedCategory = 0;
