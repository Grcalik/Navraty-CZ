
instance DIA_Brutus_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_AFTER_FIGHT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 1;
	condition = DIA_Brutus_AFTER_FIGHT_Condition;
	information = DIA_Brutus_AFTER_FIGHT_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Brutus_AFTER_FIGHT_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && Npc_IsInState(self,ZS_Talk) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_AFTER_FIGHT_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//У тебя еще все зубы на месте?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Да, я знаю, ты крутой! Я не хотел бы сразиться с тобой в бою.
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//Мне кажется, ты мне все ребра переломал.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//А я даже не бил тебя в полную силу. Ладно, забудь, мне нравятся парни, способные выдержать несколько моих ударов подряд.
		if(Brutus_einmalig == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//Вот это зелье поможет тебе встать на ноги. Также оно сотворит чудеса с твоими внутренностями!
			CreateInvItems(self,ItPo_Health_01,1);
			B_GiveInvItems(self,hero,ItPo_Health_01,1);
			Brutus_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//Я ничего не имею против хорошей драки. Но когда я начинаю драку, я же ее и заканчиваю.
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Brutus_PRISONER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_PRISONER_Condition;
	information = DIA_Brutus_PRISONER_Info;
	description = "Чем ты занимаешься здесь?";
};


func int DIA_Brutus_PRISONER_Condition()
{
	if((Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PRISONER_Info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//Чем ты занимаешься здесь?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//Чем занимаюсь? Я тренирую парней. Я учу их, как накачать стальные мускулы.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//Также я присматриваю за заключенными. Я для них как отец родной, черт меня побери.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//Но моя настоящая работа - заставлять их говорить. И поверь мне, я знаю способы разговорить кого угодно.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//Звучит ужасно мило...
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//Но этим блохастым болванам, что сейчас сидят за решеткой, все равно особенно нечего сказать.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//А к этому Горну меня не подпускают.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Brutus_PERM(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 90;
	condition = DIA_Brutus_PERM_Condition;
	information = DIA_Brutus_PERM_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};


func int DIA_Brutus_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM_Info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//Есть что-нибудь новенькое?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//Все спокойно. Новых заключенных нет - нет никого, кому нужно было бы помочь подобрать правильные слова. Очень жаль.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_Kasse(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Kasse_Condition;
	information = DIA_Brutus_Kasse_Info;
	permanent = FALSE;
	description = "Ты не мог бы потренировать меня?";
};


func int DIA_Brutus_Kasse_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Kasse_Info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Ты не мог бы потренировать меня?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Конечно. Я могу помочь тебе стать сильнее, но это будет не бесплатно.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Хммм... ты ведь бегаешь вокруг замка, да? Вот что я предлагаю.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//Мой помощник, Ден, слинял во время последней атаки орков. Вот подлец!
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//Но он улизнул не с пустыми руками. Он забрал с собой содержимое нашей кассы.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//Что за кассы?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//Ну, у нас был сундучок, где мы держали вещи, которые мы... э-э... собрали за все это время.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//Это была приличная сумма! В сундуке было двести золотых монет, а также ценные ювелирные изделия.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//Если ты вернешь мне это золото, драгоценности можешь оставить себе. И тогда я буду готов обучить тебя.
	Log_CreateTopic(TopicBrutusKasse,LOG_MISSION);
	Log_SetTopicStatus(TopicBrutusKasse,LOG_Running);
	B_LogEntry(TopicBrutusKasse,"Партнер Брутуса Ден скрылся с двумя сотнями золотых монет и кое-какими драгоценностями. Если я верну ему двести золотых монет, он поможет мне стать сильнее.");
};


instance DIA_Brutus_Den(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Den_Condition;
	information = DIA_Brutus_Den_Info;
	permanent = FALSE;
	description = "Ты знаешь, куда направился этот Ден?";
};


func int DIA_Brutus_Den_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Den_Info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Ты знаешь, куда направился этот Ден?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//Как можно дальше отсюда, как я понимаю. Я думаю, он мог попытаться пробраться через Проход.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//Спасибо. Исчерпывающая информация.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//А что я еще могу сказать? Я понятия не имею, куда он направился.
	B_LogEntry(TopicBrutusKasse,"Брутус не знает куда отправился Ден.");
};


instance DIA_Brutus_Gold(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Gold_Condition;
	information = DIA_Brutus_Gold_Info;
	permanent = TRUE;
	description = "У меня есть кое-что для тебя.";
};


func int DIA_Brutus_Gold_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (NpcObsessedByDMT_Brutus == FALSE) && (Brutus_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Gold_Info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//У меня есть кое-что для тебя.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//Превосходно. Теперь я могу потренировать тебя, если хочешь.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"Брутус может помочь мне стать сильнее.");
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//Послушай, просто принеси мне двести монет. Меня не интересует, где ты возьмешь их, только бы это было золото.
	};
};

instance DIA_Brutus_Baby(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Baby_Condition;
	information = DIA_Brutus_Baby_Info;
	important = TRUE;
};

func int DIA_Brutus_Baby_Condition()
{
	if((Kapitel < 3) && (Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Baby_Info()
{
	AI_Output(self,other,"DIA_Brutus_Baby_01_00");	//Постой!
	AI_Output(other,self,"DIA_Brutus_Baby_01_01");	//Что еще?
	AI_Output(self,other,"DIA_Brutus_Baby_01_02");	//Слушай, я долго сомневался, просить тебя об этом или нет...(замявшись) Но, пожалуй, спрошу.
	AI_Output(other,self,"DIA_Brutus_Baby_01_03");	//Слушаю.
	AI_Output(self,other,"DIA_Brutus_Baby_01_04");	//Похоже, мы тут застряли надолго. Ты, должно быть, заметил, что замок осаждают эти проклятые орки.
	AI_Output(other,self,"DIA_Brutus_Baby_01_05");	//Нет, что-то я не заметил.
	AI_Output(self,other,"DIA_Brutus_Baby_01_06");	//Ох, прекрати. Дай мне договорить. Так вот, торчать нам в этом замке придется долго...
	AI_Output(self,other,"DIA_Brutus_Baby_01_07");	//...если нам вообще удастся отсюда выбраться - в чем я иногда сильно сомневаюсь.
	AI_Output(other,self,"DIA_Brutus_Baby_01_08");	//Ты можешь говорить по существу?
	AI_Output(self,other,"DIA_Brutus_Baby_01_09");	//Хорошо, хорошо! Спокойнее. На чем я там остановился?... Ах да. Я уже давным-давно не был с женщиной.
	AI_Output(self,other,"DIA_Brutus_Baby_01_10");	//А потому у меня есть просьба. Ну, точнее, не только у меня - я прошу от имени многих парней здесь.
	AI_Output(other,self,"DIA_Brutus_Baby_01_11");	//И ты хочешь, чтобы я привел вам в замок женщину? Ты в своем уме?
	AI_Output(self,other,"DIA_Brutus_Baby_01_12");	//Да нет же, ясное дело - нет! Но вот Милтен наверняка может нас выручить.
	AI_Output(other,self,"DIA_Brutus_Baby_01_13");	//А при чем тут Милтен?
	AI_Output(self,other,"DIA_Brutus_Baby_01_14");	//Ну, он же все-таки маг... и твой приятель. Может, если ты попросишь его наколдовать нам бабу, он тебя послушает.
	AI_Output(other,self,"DIA_Brutus_Baby_01_15");	//Думаешь, это возможно?
	AI_Output(self,other,"DIA_Brutus_Baby_01_16");	//Не знаю. А что мешает это проверить? Если все получится, то поверь: ты не пожалеешь. Ну, что скажешь?
	Info_ClearChoices(DIA_Brutus_Baby);
	Info_AddChoice(DIA_Brutus_Baby,"Ты прав. Я спрошу у него.",DIA_Brutus_Baby_Yes);
	Info_AddChoice(DIA_Brutus_Baby,"Нет.",DIA_Brutus_Baby_No);
};

func void DIA_Brutus_Baby_Yes()
{
	AI_Output(other,self,"DIA_Brutus_Baby_Yes_01_01");	//Ты прав. Я спрошу у него.
	AI_Output(self,other,"DIA_Brutus_Baby_Yes_01_02");	//Спасибо, приятель. Мы в тебя верим!
	MIS_BrutusBaby = LOG_Running;
	Log_CreateTopic(TOPIC_BrutusBaby,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Running);
	B_LogEntry(TOPIC_BrutusBaby,"Брутус попросил меня о необычном одолжении. Он и другие парни в замке порядочно в нем засиделись, и хотели бы немного расслабиться. Брутус хочет, чтобы я попросил Милтена наколдовать им здесь в замке женщину, а лучше две. Я решил помочь ребятам.");
	AI_StopProcessInfos(self);
};

func void DIA_Brutus_Baby_No()
{
	AI_Output(other,self,"DIA_Brutus_Baby_No_01_01");	//Нет. То, о чем ты просишь, - просто бред ненормального. Милтен меня засмеет.
	AI_Output(self,other,"DIA_Brutus_Baby_No_01_02");	//(сердито) Не хочешь - как хочешь. Придется нам самим как-нибудь справляться.
	AI_StopProcessInfos(self);
};

instance DIA_Brutus_Baby_Wait(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 101;
	condition = DIA_Brutus_Baby_Wait_Condition;
	information = DIA_Brutus_Baby_Wait_Info;
	permanent = FALSE;
	description = "Насчет твоей просьбы...";
};

func int DIA_Brutus_Baby_Wait_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Baby_Wait_Info()
{
	AI_Output(other,self,"DIA_Brutus_Baby_Wait_01_00");	//Насчет твоей просьбы...
	AI_Output(self,other,"DIA_Brutus_Baby_Wait_01_01");	//Что? Милтен уже наколдовал для нас бабу? Так быстро?!
	AI_Output(other,self,"DIA_Brutus_Baby_Wait_01_02");	//Еще нет. Ему нужно немного времени для этого. Загляните к нему в келью завтра вечером.
	AI_Output(self,other,"DIA_Brutus_Baby_Wait_01_05");	//Отлично, приятель! Ты сделал нас самыми счастливыми людьми в этом замке.
	AI_Output(self,other,"DIA_Brutus_Baby_Wait_01_06");	//Мы обязательно придем.
	BrutusBabyDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Brutus_Teach(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 7;
	condition = DIA_Brutus_Teach_Condition;
	information = DIA_Brutus_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Brutus_Teach_Condition()
{
	if((Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Teach_Info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_Back()
{
	Info_ClearChoices(DIA_Brutus_Teach);
};

func void DIA_Brutus_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};


instance DIA_Brutus_KAP3_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP3_EXIT_Condition;
	information = DIA_Brutus_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_DUSCHONWIEDER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 30;
	condition = DIA_Brutus_DUSCHONWIEDER_Condition;
	information = DIA_Brutus_DUSCHONWIEDER_Info;
	permanent = TRUE;
	description = "Пытал кого-нибудь сегодня?";
};


func int DIA_Brutus_DUSCHONWIEDER_Condition()
{
	if((Kapitel == 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Пытал кого-нибудь сегодня?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Ты не видишь, я занят?! Заходи попозже.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_KAP4_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP4_EXIT_Condition;
	information = DIA_Brutus_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_WARUMNICHTARBBEIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 40;
	condition = DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information = DIA_Brutus_WARUMNICHTARBBEIT_Info;
	description = "Почему ты не работаешь?";
};


func int DIA_Brutus_WARUMNICHTARBBEIT_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Почему ты не работаешь?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(огорченно) Это ужасно!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Ты не заглядывал в мою комнату? Эти грязные мясные жуки там повсюду.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//Я не знаю, кто жил там раньше, но ноги моей не будет в этом грязном хлеву.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//Я ненавижу этих тварей. И хватит ржать, как идиот.
	Log_CreateTopic(TOPIC_BrutusMeatbugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs,LOG_Running);
	B_LogEntry(TOPIC_BrutusMeatbugs,"Брутус, палач замка, говорит, что от безобидных мясных жуков в его комнате, у него мурашки по коже. А он казался мне таким крепким парнем.");
};


instance DIA_Brutus_MEATBUGSWEG(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 31;
	condition = DIA_Brutus_MEATBUGSWEG_Condition;
	information = DIA_Brutus_MEATBUGSWEG_Info;
	description = "С мясными жуками покончено.";
};


func int DIA_Brutus_MEATBUGSWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_WARUMNICHTARBBEIT) && Npc_IsDead(Meatbug_Brutus1) && Npc_IsDead(Meatbug_Brutus2) && Npc_IsDead(Meatbug_Brutus3) && Npc_IsDead(Meatbug_Brutus4) && (Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_MEATBUGSWEG_Info()
{
	B_GivePlayerXP(XP_BrutusMeatbugs);
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//С мясными жуками покончено. Ты можешь продолжать полировать свои орудия для пыток или чем ты там занимался.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//Ты действительно уверен, что ни одного из этих монстров не осталось?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Абсолютно.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//Хорошо. Вот, возьми это золото в знак моей благодарности.
	B_GiveInvItems(self,other,ItMi_Gold,150);
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//Ах, не заставляй меня плакать.
	TOPIC_END_BrutusMeatbugs = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_PERM4(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 32;
	condition = DIA_Brutus_PERM4_Condition;
	information = DIA_Brutus_PERM4_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Brutus_PERM4_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Brutus_MEATBUGSWEG) || (MIS_OCGateOpen == TRUE)) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM4_Info()
{
	if((MIS_OCGateOpen == TRUE) || ((hero.guild == GIL_KDF) && (Kapitel >= 5)))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Все в порядке?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(нерешительно) Ты уверен, что со всеми мясными жуками покончено?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ах... смотри, вон один сзади тебя.
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(ревет) Чтооо?
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Flee,0,"");
	};
};


instance DIA_Brutus_BESSEN(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 55;
	condition = DIA_Brutus_BESSEN_Condition;
	information = DIA_Brutus_BESSEN_Info;
	permanent = TRUE;
	description = "Да ты одержим!";
};


func int DIA_Brutus_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Brutus == TRUE) && (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//Да ты одержим!

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDW))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//Отправляйся в монастырь, пусть они вылечат тебя.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//Мне никто не может помочь. Убирайся!
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//Кто-нибудь должен выбить демонов из твоей головы.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(вопит) НЕЕТ!
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_xardasritual_xardas,0,"");
	};
};


instance DIA_Brutus_KAP5_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP5_EXIT_Condition;
	information = DIA_Brutus_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_PICKPOCKET(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 900;
	condition = DIA_Brutus_PICKPOCKET_Condition;
	information = DIA_Brutus_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Brutus_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Brutus_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,Dialog_Back,DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};

func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};
