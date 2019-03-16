
instance MENU_AST_CONSOLE(C_MENU_DEF)
{
	items[0] = "MENUITEM_GAME_DYNAMICBARS";
	items[1] = "MENUITEM_GAME_DYNAMICBARS_CHOICE";
	items[2] = "MENUITEM_GAME_REMOVEEMPTYBODY";
	items[3] = "MENUITEM_GAME_REMOVEEMPTYBODY_CHOICE";
	items[4] = "MENUITEM_GAME_NUMLOCK";
	items[5] = "MENUITEM_GAME_NUMLOCK_CHOICE";
	items[6] = "MENUITEM_GAME_SHOWPOCKET";
	items[7] = "MENUITEM_GAME_SHOWPOCKET_CHOICE";
	items[8] = "MENUITEM_GAME_SHOWBAG";
	items[9] = "MENUITEM_GAME_SHOWBAG_CHOICE";
	items[10] = "MENUITEM_GAME_SHOWNOTICE";
	items[11] = "MENUITEM_GAME_SHOWNOTICE_CHOICE";
	items[12] = "MENUITEM_GAME_FIRESHIELD";
	items[13] = "MENUITEM_GAME_FIRESHIELD_CHOICE";
	items[14] = "MENUITEM_GAME_COLORNAMES";
	items[15] = "MENUITEM_GAME_COLORNAMES_CHOICE";
	items[16] = "MENUITEM_GAME_CONSOLEPOS";
	items[17] = "MENUITEM_GAME_CONSOLEPOS_CHOICE";
	items[18] = "MENUITEM_CONSOLEX";
	items[19] = "MENUITEM_CONSOLEX_SLIDER";
	items[20] = "MENUITEM_CONSOLEY";
	items[21] = "MENUITEM_CONSOLEY_SLIDER";
	items[22] = "MENUITEM_GAME_CONSOLEARRAY";
	items[23] = "MENUITEM_GAME_CONSOLEARRAY_CHOICE";
	items[24] = "MENUITEM_GAME_CONSOLESPEED";
	items[25] = "MENUITEM_GAME_CONSOLESPEED_CHOICE";
	items[26] = "MENUITEM_GAME_CONSOLEFPS";
	items[27] = "MENUITEM_GAME_CONSOLEFPS_CHOICE";
	items[28] = "MENUITEM_GAME_RENDERITEM";
	items[29] = "MENUITEM_GAME_RENDERITEM_CHOICE";
	items[30] = "MENUITEM_SUB_ASTBACK";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENUITEM_GAME_DYNAMICBARS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Skrývat ukazatele";
	text[1] = "Skrývat dynamické ukazatele ve hře";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 7);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_DYNAMICBARS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 7)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bViewStatusBars";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_REMOVEEMPTYBODY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Skrýt mrtvé NPC";
	text[1] = "Skrýt mrtvoly NPC a monster s prázdným inventářem";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 6);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_REMOVEEMPTYBODY_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 6)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bRemoveEmptyBodys";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_NUMLOCK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Vypnout Numlock";
	text[1] = "Vypnout Numlock (vyžadováno pro DX11!)";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 5);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_NUMLOCK_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 5)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bNumlockOff";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SHOWHELM(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Skrýt helmu";
	text[1] = "Vypnout zobrazení modelu hrdinovy helmy";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 5);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT | IT_ONLY_IN_GAME;
};

instance MENUITEM_GAME_SHOWHELM_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 5)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bHideHelm";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};

instance MENUITEM_GAME_SHOWPOCKET(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zobrazit měšec";
	text[1] = "Zapnout zobrazení modelu měšce u hrdinova opasku";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 4);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SHOWPOCKET_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 4)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowPocket";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SHOWBAG(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zobrazit brašnu";
	text[1] = "Zapnout zobrazení modelu brašny u hrdinova opasku";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SHOWBAG_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 3)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowBag";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SHOWNOTICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Označení lokace";
	text[1] = "Zapnout oznámení o lokaci, ve které se hrdina nachází";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SHOWNOTICE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 2)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowNotice";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_FIRESHIELD(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Efekty magických štítů";
	text[1] = "Zapnout vizuální efekty ochranných kouzel hrdiny";
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIRESHIELD_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 1)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowFireShield";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_COLORNAMES(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zabarvení jmen NPC";
	text[1] = "Zapnout barevné vyznačení vztahu NPC k hrdinovi";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_COLORNAMES_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bSetColorNames";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLEPOS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Pozice okna hlášení";
	text[1] = "Umístění okna hlášení na obrazovce vůči bodu X,Y";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLEPOS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Nalevo|Na střed|Napravo";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "nCslAlignment";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CONSOLEX(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Pozice X";
	text[1] = "Horizontální pozice okna hlášení na obrazovce";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_CONSOLEX_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	text[0] = "";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "fCslPositionX";
	onchgsetoptionsection = "AST";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_CONSOLEY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Pozice Y";
	text[1] = "Vertikální pozice okna hlášení na obrazovce";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_CONSOLEY_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	text[0] = "";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "fCslPositionY";
	onchgsetoptionsection = "AST";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLEARRAY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Maximum zpráv";
	text[1] = "Maximální počet zpráv v okně hlášení";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLEARRAY_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "1|2|3|4|5|6|7|8|9|10|15|20|30";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "nCslSize";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLESPEED(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Rychlost zmizení zpráv";
	text[1] = "Rychlost animace zmizení zpráv v okně hlášení";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLESPEED_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Pomalu|Středně|Rychle";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "fCslInterval";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLEFPS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zobrazit FPS";
	text[1] = "Zapnout zobrazení aktuální hodnoty FPS na obrazovce";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLEFPS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bToggleFPS";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_RENDERITEM(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Renderovat předměty";
	text[1] = "Zapnout renderování předmětů v inventáři";
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 7);
	dimx = 7000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_RENDERITEM_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ne|Ano";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 7) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowInvRender";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_SUB_ASTBACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	text[1] = "";
	posx = 1000;
	posy = 7000;
	dimx = 6192;
	dimy = MENU_SOUND_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

