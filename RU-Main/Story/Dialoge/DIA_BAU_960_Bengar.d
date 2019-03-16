
instance DIA_Bengar_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_HALLO(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 3;
	condition = DIA_Bengar_HALLO_Condition;
	information = DIA_Bengar_HALLO_Info;
	description = "Ты здешний фермер?";
};


func int DIA_Bengar_HALLO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//Ты здешний фермер?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Можно сказать и так, хотя на самом деле, я простой арендатор.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Вся земля здесь принадлежит одному крупному землевладельцу.
};


instance DIA_Bengar_WOVONLEBTIHR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Bengar_WOVONLEBTIHR_Condition;
	information = DIA_Bengar_WOVONLEBTIHR_Info;
	description = "Как ты зарабатываешь на жизнь?";
};


func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//Как ты зарабатываешь на жизнь?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//В основном охотой и рубкой леса. Ну и, конечно же, мы также выращиваем овец и работаем в поле.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Онар навязал мне всех этих работников и мне приходится чем-то занимать их. Всего несколько из них хорошие охотники, понимаешь?
};


instance DIA_Bengar_TAGELOEHNER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 6;
	condition = DIA_Bengar_TAGELOEHNER_Condition;
	information = DIA_Bengar_TAGELOEHNER_Info;
	description = "Ты нанимаешь поденных рабочих?";
};


func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Ты нанимаешь поденных рабочих?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Онар увольняет работников, которые не нужны на его ферме.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Затем он посылает их ко мне. Я кормлю их и они работают на меня.
};


instance DIA_Addon_Bengar_MissingPeople(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_MissingPeople_Condition;
	information = DIA_Addon_Bengar_MissingPeople_Info;
	description = "Не случалось ли здесь в последнее время что-нибудь необычное?";
};


func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Не случалось ли здесь в последнее время что-нибудь необычное?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//В последние дни происходит много необычных вещей.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//Но самым необычным было исчезновение Пардоса.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//Это один из моих рабочих. Понимаешь, он не из тех, кто способен в один прекрасный момент все бросить и сбежать в неизвестном направлении.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"У фермера Бенгара пропал его работник - Пардос.");
	MIS_Bengar_BringMissPeopleBack = LOG_Running;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,Dialog_Back,DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Есть какие-нибудь мысли?",DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Может быть, ему просто все надоело.",DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Что именно в его исчезновении показалось тебе странным?",DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//Что именно в его исчезновении показалось тебе странным?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Пардос довольно труслив. Самое большое расстояние, на которое он уходил от фермы - граница дальнего поля.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//Он трясется от страха даже при виде мясного жука.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Я понимаю, выглядят они довольно неприятно, но считать их опасными...
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(с отвращением) А еще говорят, кто-то их жрет. Мерзость.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//Человек ко всему привыкает.
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Может быть, ему просто все надоело.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Работа на полях была всей его жизнью. Я не могу даже представить себе, чтобы он ушел работать к другому фермеру.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//У меня он получал все, что хотел.
};

var int Bengar_ToldAboutRangerBandits;

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//Есть какие-нибудь мысли?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//Думаю, его похитили бандиты. В последнее время они повадились здесь шастать.
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};


instance DIA_Addon_Bengar_ReturnPardos(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_ReturnPardos_Condition;
	information = DIA_Addon_Bengar_ReturnPardos_Info;
	description = "Пардос вернулся?";
};


func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if((MIS_Bengar_BringMissPeopleBack == LOG_Running) && (Npc_GetDistToWP(Pardos_NW,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//Пардос вернулся?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Да, он в доме, отдыхает. Спасибо за все...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Не стоит.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Я хотел бы наградить тебя, но у меня ничего нет...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Забудь об этом.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Bengar_FernandosWeapons(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_FernandosWeapons_Condition;
	information = DIA_Addon_Bengar_FernandosWeapons_Info;
	description = "Когда бандиты здесь проходили, у них было оружие?";
};


func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if((Bengar_ToldAboutRangerBandits == TRUE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//Когда бандиты здесь проходили, у них было оружие?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//Что за глупый вопрос? Когда это бандиты ходили без оружия?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//Я имею в виду, МНОГО оружия. Большой груз.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//А, понимаю. Да, после того как ты об этом сказал, я вспоминаю, что оружия действительно было много.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//Часть была в бочках, часть - в мешках, а еще часть они везли на телеге.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_REBELLIEREN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 8;
	condition = DIA_Bengar_REBELLIEREN_Condition;
	information = DIA_Bengar_REBELLIEREN_Info;
	description = "Что ты думаешь об Онаре?";
};


func int DIA_Bengar_REBELLIEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Что ты думаешь об Онаре?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Это жадный ублюдок. Из-за него нас всех повесят.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Однажды придут паладины из города и заставят нас, мелких фермеров, расплачиваться за все, что он наделал.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Но у меня нет выбора. Ополчение приходит сюда только затем, чтобы собирать налоги, а не затем, чтобы защищать мою ферму.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Если я буду проявлять лояльность к городу, я останусь совсем один.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//А так, Онар хотя бы иногда присылает наемников посмотреть, как мы тут живем.
};


instance DIA_Bengar_PALADINE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 9;
	condition = DIA_Bengar_PALADINE_Condition;
	information = DIA_Bengar_PALADINE_Info;
	description = "А что ты имеешь против королевских войск?";
};


func int DIA_Bengar_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_REBELLIEREN) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//А что ты имеешь против королевских войск?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//Это очевидно. С тех пор, как паладины прибыли в город, не видно никаких улучшений. Скорее наоборот.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Теперь это чертово ополчение стало появляться у нас даже чаще. Они воруют все, что только могут, а паладины ничего не делают с этим.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Единственные паладины, что я вообще когда-либо видел, это вон те два стражника у Прохода.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//Они не пошевелятся, даже если ополчение вырежет нас всех.
};


instance DIA_Bengar_PASS(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 10;
	condition = DIA_Bengar_PASS_Condition;
	information = DIA_Bengar_PASS_Info;
	description = "У Прохода?";
};


func int DIA_Bengar_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//У Прохода?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Да. Проход в старую Долину Рудников находится у водопада в другом конце этого плоскогорья.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Спроси Малака о нем. Он там бывает пару раз в неделю.
};


instance DIA_Bengar_MILIZ(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_MILIZ_Condition;
	information = DIA_Bengar_MILIZ_Info;
	permanent = FALSE;
	description = "Я должен решить твою проблему с ополчением.";
};


func int DIA_Bengar_MILIZ_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//Я должен решить твою проблему с ополчением.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Что?! Я сказал Онару, чтобы он прислал своих НАЕМНИКОВ.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//Это мой шанс проявить себя.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//Ужас! Да ты знаешь, что ополчение сделает со мной, если у тебя ничего не получится?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Я уж думал, что никто не придет.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//Я сказал об этом Онару еще пару дней назад. И за что я плачу свою ренту?!
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Эти ублюдки заявляются сюда каждую неделю и собирают налоги в пользу города.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Ты как раз вовремя пришел.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//Они могут появиться в любую минуту.
};


instance DIA_Bengar_Selber(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_Selber_Condition;
	information = DIA_Bengar_Selber_Info;
	permanent = FALSE;
	description = "Почему вы не можете справиться с ополчением сами?";
};


func int DIA_Bengar_Selber_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && (Bengar_MilSuccess == FALSE) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Вас тут так много! Почему вы не можете справиться с ополчением сами?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//Да, нас много. Но мы не сможем противостоять хорошо обученным бойцам ополчения.
};


instance DIA_Bengar_MILIZKLATSCHEN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZKLATSCHEN_Condition;
	information = DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent = FALSE;
	description = "Ну и где твое ополчение, я готов разобраться с ними!";
};


func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && !Npc_IsDead(Rick) && !Npc_IsDead(Rumbold) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Ну и где твое ополчение, я готов разобраться с ними!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Вон, они уже идут. Видишь, я же говорил тебе.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Только не подведи!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//Удачи тебе! Покажи им, где раки зимуют.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"MilComing");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Rumbold) && !Npc_IsDead(Rumbold))
	{
		Npc_ExchangeRoutine(Rumbold,"MilComing");
		AI_ContinueRoutine(Rumbold);
	};
};

instance DIA_Bengar_MILIZWEG(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZWEG_Condition;
	information = DIA_Bengar_MILIZWEG_Info;
	permanent = TRUE;
	description = "Твои проблемы с ополчением уже в прошлом.";
};


func int DIA_Bengar_MILIZWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && (Bengar_MilSuccess == FALSE))
	{
		if((Npc_IsDead(Rick) && Npc_IsDead(Rumbold)) || (Rumbold_Bezahlt == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Твои проблемы с ополчением уже в прошлом.

	if((Rumbold_Bezahlt == TRUE) && (Npc_IsDead(Rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Ты с ума сошел? Да ты знаешь, что они сделают со мной, когда ты уйдешь?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Они все еще стоят вон там. Скажи им, чтобы они исчезли СОВСЕМ!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//Неплохо! Может быть, хотя бы этот месяц я буду не в убытке. Спасибо!

		if(Rumbold_Bezahlt == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Ты даже готов был заплатить за меня?! Это очень благородно с твоей стороны.
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_77_01");	//Вот, возьми это золото! Ты был очень великодушен.
			B_GiveInvItems(self,other,ItMi_Gold,100);
		}
		else
		{
			B_GivePlayerXP(100);
		};

		Bengar_MilSuccess = TRUE;
	};
};


instance DIA_Bengar_BALTHASAR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 13;
	condition = DIA_Bengar_BALTHASAR_Condition;
	information = DIA_Bengar_BALTHASAR_Info;
	description = "Пастуху Бальтазару запрещено появляться на твоих пастбищах?";
};


func int DIA_Bengar_BALTHASAR_Condition()
{
	if((MIS_Balthasar_BengarsWeide == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Пастуху Бальтазару запрещено появляться на твоих пастбищах?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//Ох, да. Это долгая история. Я сказал ему, что Секоб должен платить деньги, если хочет пасти своих овец на моих пастбищах.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//По правде говоря, это всего лишь отговорка. Я просто на дух не переношу Бальтазара.
	B_LogEntry(TOPIC_BalthasarsSchafe,"Чтобы убедить Бенгара позволить Бальтазару вернуться на его пастбища, я должен оказать ему услугу. Я уверен, что такая возможность обязательно подвернется.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_BALTHASARDARFAUFWEIDE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 14;
	condition = DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information = DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description = "Ополчение ушло, и Бальтазар может опять использовать твои пастбища.";
};


func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASAR) && (MIS_Balthasar_BengarsWeide == LOG_Running) && (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS) && (Bengar_MilSuccess == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Ополчение ушло, и Бальтазар может опять использовать твои пастбища.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Почему?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(угрожающе) Потому что я так сказал.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Ммм. Хорошо, как скажешь.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//Только пусть он пасет своих овец где-нибудь за полем.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_SUCCESS);
	B_LogEntry(TOPIC_BalthasarsSchafe,"Фермер Бенгар разрешил пастуху Бальтазару пасти овец на его высокогорных пастбищах.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_PERMKAP1(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 15;
	condition = DIA_Bengar_PERMKAP1_Condition;
	information = DIA_Bengar_PERMKAP1_Info;
	permanent = TRUE;
	description = "Береги себя.";
};


func int DIA_Bengar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASARDARFAUFWEIDE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Береги себя.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ты тоже.
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP3_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP3_EXIT_Condition;
	information = DIA_Bengar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_ALLEIN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 30;
	condition = DIA_Bengar_ALLEIN_Condition;
	information = DIA_Bengar_ALLEIN_Info;
	description = "Как дела?";
};


func int DIA_Bengar_ALLEIN_Condition()
{
	if((Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLEIN_Info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Как дела?

	if((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Малак ушел от меня и забрал с собой всех, кто работал на меня. Он сказал, что направляется в горы.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//Он больше не мог находиться здесь.
		MIS_GetMalakBack = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Времена настали суровые. Я даже не знаю, сколько я так смогу продержаться.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Новые орды монстров каждый день приходят через Проход. Скоро они всех нас сожрут.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Если бы только меня защищали хотя бы несколько наемников...
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//Один из них даже был готов работать на меня. Но он передумал, впрочем. Мне кажется, его звали Вольф.
	MIS_BengarsHelpingSLD = LOG_Running;
	Log_CreateTopic(TOPIC_BengarALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN,LOG_Running);
	B_LogEntry(TOPIC_BengarALLEIN,"Бенгар остался один на своей ферме. Малак ушел и увел с собой всех остальных. Бенгар думает, что они направились в горы.");
	B_LogEntry_Quiet(TOPIC_BengarALLEIN,"Теперь его ферма абсолютно беззащитна. Ему нужна помощь. Он говорит что-то о наемнике, которого зовут Вольф. Может быть, я знаю этого парня?");
};

instance DIA_Bengar_MALAKTOT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_MALAKTOT_Condition;
	information = DIA_Bengar_MALAKTOT_Info;
	description = "Малак мертв.";
};

func int DIA_Bengar_MALAKTOT_Condition()
{
	if(Npc_IsDead(Malak) && (Malak_isAlive_Kap3 == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Малак мертв.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//Теперь все станет еще хуже.
};


instance DIA_Bengar_SLDDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_SLDDA_Condition;
	information = DIA_Bengar_SLDDA_Info;
	description = "Я нашел тебе наемника, как ты и хотел.";
};


func int DIA_Bengar_SLDDA_Condition()
{
	if((Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Npc_IsDead(SLD_Wolf) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Я нашел тебе наемника, как ты и хотел.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//У моей фермы еще никогда не было таких защитников. Надеюсь, он сможет помочь нам.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Вот, возьми. Я думаю, это тебе пригодится.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};


instance DIA_Bengar_MALAKWIEDERDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = DIA_Bengar_MALAKWIEDERDA_Condition;
	information = DIA_Bengar_MALAKWIEDERDA_Info;
	description = "Малак вернулся.";
};


func int DIA_Bengar_MALAKWIEDERDA_Condition()
{
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (DarkPathStart == FALSE) && ((MIS_GetMalakBack == LOG_SUCCESS) || (NpcObsessedByDMT_Malak == TRUE)) && (Npc_IsDead(Malak) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKWIEDERDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Малак вернулся.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//Очень хорошо! А я уж боялся, что больше никогда не увижу его.
	B_GivePlayerXP(XP_GetMalakBack);

	if(RhetorikSkillValue[1] >= 30)
	{
		AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_66_01");	//А как насчет небольшого вознаграждения?
		AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_66_02");	//Почему бы и нет. Вот, держи. Ты это заработал.
		B_GiveInvItems(self,hero,ItMi_Gold,150);
	};
};


instance DIA_Bengar_PERM(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 80;
	condition = DIA_Bengar_PERM_Condition;
	information = DIA_Bengar_PERM_Info;
	permanent = TRUE;
	description = "Все будет хорошо.";
};


func int DIA_Bengar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_ALLEIN) && (Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//Все будет в порядке.

	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (Npc_IsDead(Malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Малак опять здесь, но ситуация почти не изменилась.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Если только не произойдет чудо, всем нам скоро настанет конец.
	}
	else if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) && (Npc_IsDead(SLD_Wolf) == FALSE) && (Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Вольф странный парень, но я надеюсь, он все же сможет помочь нам.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Без Малака этой ферме скоро придет конец. Если ничего не переменится в ближайшее время, боюсь, мне придется бросить ее.
		if((Malak_isAlive_Kap3 == TRUE) && (Npc_IsDead(Malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Надеюсь, он скоро вернется.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SLD_Wolf) && (MIS_BengarsHelpingSLD == LOG_SUCCESS))
	{
		B_StartOtherRoutine(SLD_815_Soeldner,"Start");
		B_StartOtherRoutine(SLD_817_Soeldner,"Start");
	};
};


instance DIA_Bengar_KAP4_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP4_EXIT_Condition;
	information = DIA_Bengar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP5_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP5_EXIT_Condition;
	information = DIA_Bengar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP6_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP6_EXIT_Condition;
	information = DIA_Bengar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_PICKPOCKET(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 900;
	condition = DIA_Bengar_PICKPOCKET_Condition;
	information = DIA_Bengar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bengar_PICKPOCKET_Condition()
{
	return C_Beklauen(28,50);
};

func void DIA_Bengar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,Dialog_Back,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};


instance DIA_BENGAR_LUTEROLETTER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = dia_bengar_luteroletter_condition;
	information = dia_bengar_luteroletter_info;
	description = "Я принес письмо от Лютеро.";
};


func int dia_bengar_luteroletter_condition()
{
	if((MIS_BENGARORDER == LOG_Running) && (Npc_HasItems(other,itwr_bengarorderletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_bengar_luteroletter_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_00");	//Я принес письмо от Лютеро на новый заказ.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_01");	//Самое время.
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_02");	//Вот.
	B_GiveInvItems(other,self,itwr_bengarorderletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_03");	//Хммм. Ну что же, думаю, это мне не составит проблем достать для него.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_04");	//Что-нибудь еще?
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_05");	//Он также просил меня забрать прошлую партию товара.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_06");	//Ах да, конечно. Я уже все подготовил - вот, возьми этот пакет...
	B_GiveInvItems(self,other,itmi_bengarpacket,1);
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_07");	//... и пожалуйста, не потеряй его!
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_08");	//Постараюсь.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_09");	//Будем надеяться. Если встретишь Лютеро, передай ему, что новая партия будет готова недели через две.
	B_LogEntry(TOPIC_BENGARORDER,"Я передал письмо Бенгару, а он отдал мне пакет с товаром для Джоры.");
};


instance DIA_BENGAR_PSICAMP(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 1;
	condition = dia_bengar_psicamp_condition;
	information = dia_bengar_psicamp_info;
	description = "Что это за лагерь рядом с твоей фермой?";
};


func int dia_bengar_psicamp_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO) && !Npc_KnowsInfo(other,dia_tpl_8014_templer_first))
	{
		return TRUE;
	};
};

func void dia_bengar_psicamp_info()
{
	AI_Output(other,self,"DIA_Bengar_Psicamp_01_00");	//Что это за лагерь рядом с твоей фермой?
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_01");	//Я точно не знаю, но, кажется, его обитатели называют свою общину каким-то Братством!
	AI_Output(other,self,"DIA_Bengar_Psicamp_01_02");	//Братством? Интересно. И кто же эти люди?
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_03");	//Вообще-то довольно странные типы! Ходят практически все наголо бритые и постоянно курят болотник.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_04");	//Честно говоря, на одного такого посмотришь и как-то уже даже не по себе становится.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_05");	//Хотя, правда, с другой стороны, проблем от них тоже мало.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_06");	//У них в лагере все всегда достаточно тихо. А для меня это, как ты сам понимаешь, самое главное.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_07");	//Так что я особо не возражаю насчет их здешнего присутствия. Пусть живут - мне не жалко.
	AI_Output(other,self,"DIA_Bengar_Psicamp_01_08");	//Понятно.
};