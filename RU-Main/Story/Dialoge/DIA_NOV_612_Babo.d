
instance DIA_Babo_Kap1_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Babo_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//Привет, ты тоже новичок здесь, да?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Да. Ты давно здесь?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Четыре недели. Тебе уже выдали боевой посох?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Пока нет.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//Тогда возьми вот этот. Мы, послушники всегда ходим с посохом, чтобы показать, что мы способны защитить себя. Ты умеешь сражаться?
	B_GiveInvItems(self,other,ItMw_1h_Nov_Mace,1);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//Ну, мне случалось пользоваться оружием...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Если хочешь, я могу обучить тебя кое-чему. Но у меня есть просьба...
};


instance DIA_Babo_Anliegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent = FALSE;
	description = "Что за просьба?";
};


func int DIA_Babo_Anliegen_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Что за просьба?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//Ну, один из паладинов, Сержио, сейчас живет в монастыре.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Если ты сможешь убедить его дать мне несколько уроков, тогда я потренирую тебя.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Я посмотрю, что можно сделать.
	Log_CreateTopic(Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboTrain,LOG_Running);
	B_LogEntry(Topic_BaboTrain,"Если я смогу убедить паладина Сержио немного потренироваться с Бабо, он научит меня искусству обращения с двуручным оружием.");
};


instance DIA_Babo_Sergio(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent = FALSE;
	description = "Я поговорил с Сержио.";
};


func int DIA_Babo_Sergio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_Babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Я поговорил с Сержио. Он будет тренировать тебя по два часа каждое утро, с пяти часов.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Спасибо! Какая честь для меня!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Если хочешь, я также могу показать тебе несколько секретов боевого искусства.
	Babo_TeachPlayer = TRUE;
	Babo_Training = TRUE;
	B_GivePlayerXP(XP_Ambient * 2);
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	Npc_ExchangeRoutine(Babo,"Train");
	B_LogEntry(Topic_KlosterTeacher,"Бабо может обучить меня искусству обращения с двуручным оружием.");
};


instance DIA_Babo_Teach(C_Info)
{
	npc = NOV_612_Babo;
	nr = 100;
	condition = DIA_Babo_Teach_Condition;
	information = DIA_Babo_Teach_Info;
	permanent = TRUE;
	description = "Я готов к обучению.";
};


var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;

func int DIA_Babo_Teach_Condition()
{
	if(((Babo_TeachPlayer == TRUE) && (DIA_Babo_Teach_permanent == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void DIA_Babo_Teach_Info()
{
	babo_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Я готов к обучению.
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Ты знаешь больше о двуручном оружии, чем я мог бы научить тебя.
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,75);
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Сражайся за Инноса. Иннос - наша жизнь, и твоя вера придаст тебе силы.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//Слуга Инноса никогда не провоцирует противника - он удивляет его!
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//Куда бы ты ни шел - всегда бери с собой свой посох.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//Слуга Инноса всегда готов к бою. Если у тебя нет никакой магии, твой посох - твой самый важный элемент обороны.
		};
		Babo_Labercount = Babo_Labercount + 1;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,75);
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Слуга Инноса сражается не только своим посохом, но также и своим сердцем.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Ты должен понимать, до какого предела ты можешь отступить.
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Помни, ты хорошо сражаешься, когда ты контролируешь противника и не даешь ему шанса контролировать себя.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Когда ты бросаешь бой, ты только теряешь.
		};
		Babo_Labercount = Babo_Labercount + 1;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

instance DIA_Babo_Wurst(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Wurst_Condition;
	information = DIA_Babo_Wurst_Info;
	permanent = FALSE;
	description = "Вот, держи колбасу.";
};

func int DIA_Babo_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Babo_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Вот, держи колбасу.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Ох, баранья колбаса, отлично! Какой потрясающий вкус - дай мне еще одну колбаску!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Тогда у меня не хватит колбасы для других.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//У тебя все равно на одну колбаску больше, чем нужно. Ну, на ту, что предназначена для тебя. Мы же друзья. Что мы будем делить какую-то колбасу?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Ну же, я дам тебе за нее свиток 'Огненная стрела'.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	Info_ClearChoices(DIA_Babo_Wurst);
	Info_AddChoice(DIA_Babo_Wurst,"Хорошо, держи еще одну колбасу.",DIA_Babo_Wurst_JA);
	Info_AddChoice(DIA_Babo_Wurst,"Нет, я не сделаю этого.",DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Wurst_JA()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//Хорошо, держи еще одну колбасу.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Отлично! Вот твой свиток.
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Нет, я не сделаю этого.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Слушай, ты что, один из тех людей, что очень щепетильно относятся ко всему, а?
	Info_ClearChoices(DIA_Babo_Wurst);
};


instance DIA_Babo_YouAndAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent = FALSE;
	description = "Что произошло между тобой и Агоном?";
};


func int DIA_Babo_YouAndAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Что произошло между тобой и Агоном?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Ох, мы поспорили о том, как нужно ухаживать за огненной крапивой.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Агон поливал ее так, что корни бедного растения почти совсем сгнили.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//А когда они сгнили совсем, он обвинил в этом меня.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Теперь меня постоянно заставляют подметать двор в наказание.
};


instance DIA_Babo_WhyDidAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 4;
	condition = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent = FALSE;
	description = "Зачем Агон сделал это?";
};


func int DIA_Babo_WhyDidAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Зачем Агон сделал это?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Тебе лучше самому спросить его об этом. Я думаю, он просто не выносит, когда кто-то оказывается лучше его.
};


instance DIA_Babo_PlantLore(C_Info)
{
	npc = NOV_612_Babo;
	nr = 5;
	condition = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent = FALSE;
	description = "Похоже ты хорошо разбираешься в растениях?";
};


func int DIA_Babo_PlantLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Похоже ты хорошо разбираешься в растениях?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//У нас в семье была делянка, где мы выращивали различные травы, и я научился кое-чему у дедушки.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Я бы так хотел опять работать в саду.
	MIS_HelpBabo = LOG_Running;
	Log_CreateTopic(Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner,LOG_Running);
	B_LogEntry(Topic_BaboGaertner,"Бабо предпочел бы пропалывать травы, чем подметать двор.");
};


instance DIA_Babo_Fegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent = FALSE;
	description = "Я должен подметать кельи послушников.";
};


func int DIA_Babo_Fegen_Condition()
{
	if(MIS_ParlanFegen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Я должен подметать кельи послушников.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Ты взвалил на себя слишком много работы. Знаешь что - я помогу тебе. Тебе ни за что не справиться одному.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Но мне очень нужен свиток с заклинанием 'Кулак Ветра'. Знаешь, мне повезло, и мне было позволено прочесть книгу о нем.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//И теперь, естественно, я хочу испытать это заклинание. Так что если ты принесешь мне этот свиток, я помогу тебе.
	B_LogEntry(Topic_ParlanFegen,"Бабо поможет мне подмести кельи послушников, если я принесу ему свиток с заклинанием Кулак ветра.");
	Wld_InsertItem(ItSc_Windfist,"NW_PATH_TO_MONASTER_AREA_07");
};


instance DIA_Babo_Windfaust(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent = TRUE;
	description = "Насчет свитка с заклинанием...";
};


var int DIA_Babo_Windfaust_permanent;

func int DIA_Babo_Windfaust_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && Npc_KnowsInfo(other,DIA_Babo_Fegen) && (DIA_Babo_Windfaust_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Насчет свитка...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//У тебя есть свиток 'Кулак Ветра' для меня?
	if(B_GiveInvItems(other,self,ItSc_Windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Вот свиток, который ты хотел получить.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//Отлично. Тогда я помогу тебе подметать кельи.
		NOV_Helfer = NOV_Helfer + 1;
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		B_LogEntry(Topic_ParlanFegen,"Бабо поможет мне подмести кельи послушников.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Нет, пока нет.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//Ничего, я подожду.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Life(C_Info)
{
	npc = NOV_612_Babo;
	nr = 10;
	condition = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent = TRUE;
	description = "Как жизнь в монастыре?";
};


func int DIA_Babo_Life_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Как жизнь в монастыре?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Не хочу жаловаться, но я никогда не думал, что здесь такие жесткие правила. Если ты не нарушаешь правила, тебя наказывают.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Конечно, многие послушники хотят изучать учения Инноса в библиотеке, чтобы подготовиться стать избранными.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Но я думаю, что лучшая подготовка к испытанию магией - это тщательно выполнять нашу работу.
	if(Npc_KnowsInfo(other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//Что ты там говорил об избранных, и что за испытание?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Поговори с братом Игарацем. Он больше знает об этом.
	};
};


instance DIA_Babo_HowIsIt(C_Info)
{
	npc = NOV_612_Babo;
	nr = 1;
	condition = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent = TRUE;
	description = "Как ты?";
};


func int DIA_Babo_HowIsIt_Condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Babo_XPgiven;

func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Как дела?
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//Я благодарю магов за данные мне поручения.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Мне нравится работать в саду, и я надеюсь, что маги довольны мной, Мастер.
		if(Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//Х... х... хорошо, Мастер.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//Я, я усердно работаю и пытаюсь не разочаровать магов.
	};
	AI_StopProcessInfos(self);
};


var int babomageplantday;

instance DIA_BABO_KDF_HAVEDOCS(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = dia_babo_kdf_havedocs_condition;
	information = dia_babo_kdf_havedocs_info;
	permanent = FALSE;
	description = "Не расскажешь мне - что это за документы?";
};


func int dia_babo_kdf_havedocs_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_NOV)) && ((Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >= 1) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >= 1))))
	{
		return TRUE;
	};
};

func void dia_babo_kdf_havedocs_info()
{
	AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_00");	//Не расскажешь мне - что это за документы?
	AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_01");	//(испуганно) Я... я...
	AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_02");	//Да успокойся.

	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_03");	//Послушники ведь должны помогать друг другу.
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_04");	//Письмо забери, оно адресовано тебе. А картинку я выброшу.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_05");	//Ты ничего не скажешь магам?
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_06");	//Нет, конечно нет, успокойся.
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_07");	//Я не буду говорить об этом мастеру Парлану.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_08");	//Ооох...
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_09");	//Но ты выполнишь обет послушания. Собери за два дня десять растений огненной крапивы.
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_10");	//И немедленно уничтожь письмо, которое адресовано тебе. Вот оно.
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_11");	//А картинку я уничтожу сам.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_12");	//Благодарю вас, мастер. Я обязательно выполню обет.
		BABOMAGEPLANTDAY = Wld_GetDay() + 2;
	};
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		Npc_RemoveInvItems(other,ItWr_BabosDocs_MIS,1);
		CreateInvItems(other,ItWr_BabosPinUp_MIS,1);
		CreateInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_GiveInvItems(other,self,ItWr_BabosLetter_MIS,1);
	Npc_RemoveInvItems(self,ItWr_BabosLetter_MIS,1);
	B_GivePlayerXP(XP_BabosDocs);
};


instance DIA_BABO_KDF_PLANTS(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = dia_babo_kdf_plants_condition;
	information = dia_babo_kdf_plants_info;
	permanent = FALSE;
	description = "Ты выполнил обет?";
};


func int dia_babo_kdf_plants_condition()
{
	if((other.guild == GIL_KDF) && (BABOMAGEPLANTDAY <= Wld_GetDay()) && (BABOMAGEPLANTDAY != 0))
	{
		return TRUE;
	};
};

func void dia_babo_kdf_plants_info()
{
	AI_Output(other,self,"DIA_Babo_KDF_Plants_15_00");	//Ты выполнил обет?
	AI_Output(self,other,"DIA_Babo_KDF_Plants_03_01");	//Конечно, мастер.
	CreateInvItems(self,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(dia_babo_kdf_plants);
	Info_AddChoice(dia_babo_kdf_plants,"Я заберу их",dia_babo_kdf_plants_takeall);
	Info_AddChoice(dia_babo_kdf_plants,"Оставь пять растений себе...",dia_babo_kdf_plants_takehalf);
};

func void dia_babo_kdf_plants_takehalf()
{
	AI_Output(other,self,"DIA_Babo_KDF_Plants_15_02");	//Оставь пять растений себе и иди к мастеру Неорасу практиковаться в алхимии.
	AI_Output(self,other,"DIA_Babo_KDF_Plants_03_02");	//Благодарю вас, мастер.
	B_GivePlayerXP(XP_Ambient * 2);
	Npc_ExchangeRoutine(self,"ALCHEMY");
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,5);
	Info_ClearChoices(dia_babo_kdf_plants);
};

func void dia_babo_kdf_plants_takeall()
{
	AI_Output(other,self,"DIA_Babo_KDF_Plants_15_02");	//Оставь пять растений себе и иди к мастеру Неорасу практиковаться в алхимии.
	AI_Output(self,other,"DIA_Babo_KDF_Plants_03_03");	//Благодарю вас, мастер.
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(dia_babo_kdf_plants);
};


instance DIA_Babo_Kap2_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Babo_Kap3_Hello_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Что ты делаешь здесь?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//Я пытаюсь выполнить задания, данные мне, так, чтобы маги монастыря остались довольны.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Я не должен говорить с тобой. Вряд ли это послужит мне на пользу, если заметят, что я говорю с чужаком.
	};
};


instance DIA_Babo_Kap3_KeepTheFaith(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent = FALSE;
	description = "Ты не должен терять веры.";
};


func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Ты не должен терять веры.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//Нет... Я хочу сказать, это больше не повторится. Клянусь!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//Мы все проходим через суровые испытания.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Да, Мастер. Я буду всегда помнить это. Спасибо.
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Babo_Kap3_Unhappy(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent = FALSE;
	description = "Ты не выглядишь особенно веселым.";
};

func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if((Kapitel > 2) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//Ты не выглядишь особенно веселым.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//Эээ...(застигнутый врасплох) Я хочу сказать, со мной все в порядке, правда.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Только... Ох, я не хочу жаловаться.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Тогда прекрати хныкать.",DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Да ладно, мне-то ты можешь сказать.",DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Тогда прекрати хныкать.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//Я...(испуганно) Я... пожалуйста, не говори магам.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Я не хочу, чтобы меня опять наказали.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Я подумаю над этим.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//Да ладно, мне-то ты можешь сказать.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//А ты правда не скажешь магам?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Я похож на того, кто сразу бежит докладывать?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//Ну, хорошо. У меня проблемы с одним из послушников. Он шантажирует меня.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//Давай, выкладывай.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Игарац, так зовут этого послушника, нашел мои личные записи.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Он угрожает передать их магам, если я не буду делать то, что он говорит.
	MIS_BabosDocs = LOG_Running;
	Log_CreateTopic(Topic_BabosDocs,LOG_MISSION);
	Log_SetTopicStatus(Topic_BabosDocs,LOG_Running);
	B_LogEntry(Topic_BabosDocs,"Игарац шантажирует послушника Бабо какими-то документами.");
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Я думаю, что мне не стоит влезать в эти дрязги.",DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Что ты должен делать для него?",DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Что это были за записи?",DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Может быть, я могу помочь тебе?",DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//Я думаю, что мне не стоит влезать в эти дрязги.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Я понимаю, тебе не нужны проблемы. Я сам с этим как-нибудь разберусь.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//Я верю, ты справишься.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Что ты должен делать для него?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Мне так стыдно говорить. Это все не понравится Инносу.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Мне даже думать не хочется, что будет, если все раскроется.
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Что это были за записи?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(неуверенно) Это никого не касается. Это мое личное дело.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//Да ладно, говори.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//Они... это... абсолютно нормальные записи. Ничего особенного.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Я больше не буду спрашивать.
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Может быть, я могу помочь тебе?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Ты сделаешь это?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//Ну... возможно... это зависит от...
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(поспешно) Конечно же, я заплачу тебе за это.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Сколько?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Ну, у меня не так много денег, но я мог бы дать тебе свиток с заклинанием. У меня есть лечебное заклинание.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Я лучше не буду связываться с этим.",DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Я попробую.",DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Я лучше не буду связываться с этим.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//Тогда у меня нет выбора, мне придется выпутываться самому.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//Правда?! Я знаю, у тебя получится. Я верю!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Тебе нужно только выяснить, где Игарац держит свои вещи. Затем ты выкрадешь их у него, и все будет в порядке.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Расслабься. Продолжай работать. А я позабочусь об остальном.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

instance DIA_Babo_Kap3_HaveYourDocs(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent = FALSE;
	description = "Я нашел твои записки.";
};


func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if(((MIS_BabosDocs == LOG_Running) && (Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >= 1) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Я нашел твои записки.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Правда? Спасибо, ты спас меня. Я даже не знаю, как благодарить тебя.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Да, да, просто успокойся.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//Это действительно мои?...(нервно) Ты уверен?! Покажи мне.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Я подержу их пока у себя.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);

	if(BabosDocsOpen == TRUE)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Теперь, учитывая все обстоятельства, цена выросла.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};

	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Вот, держи.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Я подержу их пока у себя.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//Что?! Что это все значит? Что ты задумал?
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Просто шучу.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Это мое дело!",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Просто шучу.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//Ха-ха, но мне что-то не смешно. Где же они?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Здесь.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Я не хотел обидеть тебя, но я просто очень переживаю.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//Все хорошо. Наслаждайся своими записками.
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs,"Я отдал Бабо его документы.");
	B_GivePlayerXP(XP_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//Это мое дело.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Эти записи принадлежат мне! Ты не имеешь права забирать их себе.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Придержи язык!
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Я все понимаю, но, поверь мне, ты пожалеешь об этом.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Еще увидимся.
	MIS_BabosDocs = LOG_FAILED;
	B_LogEntry_Failed(Topic_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Теперь, учитывая все обстоятельства, цена выросла.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Ты не лучше остальных. Чего ты хочешь?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//А что у тебя есть?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Я могу дать тебе сотню монет - это все, что у меня есть.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Этого недостаточно!",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Договорились!",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Но у меня нет больше денег. Если бы я знал об этом раньше, ноги бы моей не было в монастыре.
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	B_GivePlayerXP(XP_BabosDocs);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Договорились!
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Вот деньги.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Вот, держи.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Да, все на месте.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Ты читал их?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Это имеет какое-то значение?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Нет, когда они у меня в руках.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Теперь я надеюсь, что смогу опять спать спокойно.
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs,"Я отдал Бабо его документы.");
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	B_GivePlayerXP(XP_BabosDocs);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Вот, держи.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Да, все на месте.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Ты читал их?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Это имеет какое-то значение?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Нет, когда они у меня в руках.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Теперь я надеюсь, что смогу опять спать спокойно.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs,"Я отдал Бабо его документы.");
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

instance DIA_Babo_Kap3_Perm(C_Info)
{
	npc = NOV_612_Babo;
	nr = 39;
	condition = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent = TRUE;
	description = "Ты доволен своей работой?";
};

func int DIA_Babo_Kap3_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Ты доволен своей работой?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//(неубедительно) Да, конечно. Моя вера в мудрость и силу Инноса придает мне силы.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//(уклончиво) Я не хочу показаться невежливым, но у меня много дел сегодня.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Можешь продолжать.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(облегченно) Спасибо.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Все хорошо, но мне нужно возвращаться к работе, иначе мне ни за что не закончить ее сегодня.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Я не хочу опять трудиться до полуночи, чтобы выполнить свою работу и не быть наказанным.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap4_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap5_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_PICKPOCKET(C_Info)
{
	npc = NOV_612_Babo;
	nr = 900;
	condition = DIA_Babo_PICKPOCKET_Condition;
	information = DIA_Babo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Babo_PICKPOCKET_Condition()
{
	return C_Beklauen(17,25);
};

func void DIA_Babo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
	Info_AddChoice(DIA_Babo_PICKPOCKET,Dialog_Back,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};


instance DIA_BABO_KAP6_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = dia_babo_kap6_exit_condition;
	information = dia_babo_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_babo_kap6_exit_condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void dia_babo_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

