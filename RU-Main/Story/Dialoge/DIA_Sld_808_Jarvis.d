
instance DIA_Jarvis_EXIT(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 999;
	condition = DIA_Jarvis_EXIT_Condition;
	information = DIA_Jarvis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jarvis_Hello(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_Hello_Condition;
	information = DIA_Jarvis_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jarvis_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Hello_Info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Эй! Я тебя откуда-то знаю?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//Может быть. Я тоже был в колонии.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Точно... что тебе нужно?
};


instance DIA_Jarvis_DieLage(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_DieLage_Condition;
	information = DIA_Jarvis_DieLage_Info;
	permanent = FALSE;
	description = "Как ситуация?";
};


func int DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_DieLage_Info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//Как ситуация?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Назревают большие проблемы. Наемники раскалываются на две фракции.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Сильвио и его люди сомневаются, что Ли выбрал правильный путь.
};


instance DIA_Jarvis_TwoFronts(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 3;
	condition = DIA_Jarvis_TwoFronts_Condition;
	information = DIA_Jarvis_TwoFronts_Info;
	permanent = FALSE;
	description = "А как случилось, что появились две фракции?";
};


func int DIA_Jarvis_TwoFronts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_TwoFronts_Info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//А как случилось, что появились две фракции?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//Большинство из нас пришло из колонии вместе с Ли.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//Но некоторые наемники присоединились к нам позже.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//Они не из колонии, они были южнее и сражались с орками.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//Они как-то прослышали, что Ли нужны люди. Их лидером был Сильвио.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//Он согласился, что командовать будет Ли, но теперь он пытается подбить наемников против Ли и его плана.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//Большинство из людей Ли не принимает эту проблему всерьез. Но я хорошо знаю таких парней, как Сильвио.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//Он способен дойти до экстремизма, чтобы реализовать свои идеи.
};


instance DIA_Jarvis_LeesPlan(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 4;
	condition = DIA_Jarvis_LeesPlan_Condition;
	information = DIA_Jarvis_LeesPlan_Info;
	permanent = FALSE;
	description = "Ты знаешь, что собирается делать Ли?";
};


func int DIA_Jarvis_LeesPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//Ты знаешь, что собирается делать Ли?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Ли хочет, чтобы мы выжидали и морили голодом паладинов в городе.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//Он планирует вытащить нас всех с этого острова. Иннос свидетель, я не имею ничего против того, чтобы убраться отсюда.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//Я не знаю, как Ли собирается провернуть это, но я доверяю ему. Он всегда был хорошим вожаком.
};


instance DIA_Jarvis_SylviosPlan(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 5;
	condition = DIA_Jarvis_SylviosPlan_Condition;
	information = DIA_Jarvis_SylviosPlan_Info;
	permanent = FALSE;
	description = "Ты знаешь, что планирует Сильвио?";
};


func int DIA_Jarvis_SylviosPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosPlan_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//Ты знаешь, что планирует Сильвио?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Сильвио выяснил, что часть паладинов направилась в бывшую колонию.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//Он говорит, что оставшиеся паладины не осмелятся атаковать нас здесь и хочет воспользоваться этой ситуацией.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Грабить мелкие фермы, устраивать засады на патрули ополчения у города, потрошить путешественников, ну и все такое.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//Но Ли полагает, что это худшее из того, что можно придумать в этой ситуации.
};


instance DIA_Jarvis_WannaJoin(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 6;
	condition = DIA_Jarvis_WannaJoin_Condition;
	information = DIA_Jarvis_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу стать наемником!";
};


func int DIA_Jarvis_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//Я хочу стать наемником!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//Я не уверен, что это хорошая идея...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//В чем проблема?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//Ну, я должен голосовать либо за тебя, либо против.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//А учитывая ситуацию, я проголосую за тебя, только если буду уверен, что ты на стороне Ли!
};


instance DIA_Jarvis_MissionKO(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_MissionKO_Condition;
	information = DIA_Jarvis_MissionKO_Info;
	permanent = FALSE;
	description = "И что я должен сделать?";
};


func int DIA_Jarvis_MissionKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_WannaJoin) && Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_MissionKO_Info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//И что я должен сделать?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//Это просто. Отдубась нескольких парней Сильвио! Так обе стороны сразу поймут, с кем ты.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//А если ты будешь придерживаться правил дуэли, ты даже сможешь завоевать уважение остальных.
	MIS_Jarvis_SldKO = LOG_Running;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic(TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarvisSLDKo,LOG_Running);
	B_LogEntry(TOPIC_JarvisSLDKo,"Джарвис хочет, чтобы я вырубил парочку парней Сильвио, тогда он отдаст свой голос за меня.");
};


instance DIA_Jarvis_DuellRegeln(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_DuellRegeln_Condition;
	information = DIA_Jarvis_DuellRegeln_Info;
	permanent = FALSE;
	description = "Что за правила дуэлей?";
};


func int DIA_Jarvis_DuellRegeln_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_DuellRegeln_Info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//Что за правила дуэлей?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//Поговори с Торлофом, он все объяснит, если тебе это интересно.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//Я хочу, чтобы между нами не было недопонимания: меня не волнует, будешь ты придерживаться этих правил или нет. Если только тебе удастся извалять этих парней в грязи!
	B_LogEntry(TOPIC_JarvisSLDKo,"И мне даже не нужно придерживаться этих дурацких правил дуэли...");
};


instance DIA_Jarvis_SylviosMen(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_SylviosMen_Condition;
	information = DIA_Jarvis_SylviosMen_Info;
	permanent = FALSE;
	description = "Кто из наемников люди Сильвио?";
};


func int DIA_Jarvis_SylviosMen_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosMen_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Кто из наемников люди Сильвио?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//Их шестеро. Прежде всего, сам Сильвио и его правая рука Булко.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//Также есть Род, Сентенза, Фестер и Рауль.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//Остальные занимают либо нейтральную позицию, либо на стороне Ли.
	B_LogEntry(TOPIC_JarvisSLDKo,"Люди Сильвио - это сам Сильвио, его правая рука Булко, Род, Сентенза, Фестер и Рауль.");
};


instance DIA_Jarvis_HowMany(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowMany_Condition;
	information = DIA_Jarvis_HowMany_Info;
	permanent = FALSE;
	description = "И сколько людей Сильвио я должен победить?";
};


func int DIA_Jarvis_HowMany_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowMany_Info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//И сколько людей Сильвио я должен победить?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//Если ты вырубишь троих из них, ты докажешь, на чьей ты стороне.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Кого ты выберешь - это твое дело.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Дам одну подсказку: Не стоит пытаться проявить мужество. Не выступай против самого Сильвио - он сделает из тебя котлету.
	B_LogEntry(TOPIC_JarvisSLDKo,"Вполне достаточно, если я вырублю троих людей Сильвио. Впрочем, с самим Сильвио мне лучше пока не связываться.");
};


instance DIA_Jarvis_HowManyLeft(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowManyLeft_Condition;
	information = DIA_Jarvis_HowManyLeft_Info;
	permanent = TRUE;
	description = "Сколько людей Сильвио мне еще нужно уложить?";
};

func int DIA_Jarvis_HowManyLeft_Condition()
{
	if((MIS_Jarvis_SldKO == LOG_Running) && Npc_KnowsInfo(other,DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowManyLeft_Info()
{
	var int victories;

	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//Сколько людей Сильвио мне еще нужно уложить?
	victories = 0;

	if((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) || (Bullco.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//Я отдубасил Булко.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//Я слышал. Неплохо!
		victories = victories + 1;
	};
	if((Rod.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Род теперь ходит сильно потрепанным.
		victories = victories + 1;
	};
	if((Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE) || (Sentenza.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if(Npc_KnowsInfo(other,DIA_Sentenza_Hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Сентенза пытался вытрясти из меня золото - не самая лучшая идея.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//Я вырубил Сентензу.
		};

		victories = victories + 1;
	};
	if((Fester.aivar[AIV_DefeatedByPlayer] == TRUE) || (Fester.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Фестер получил по заслугам.
		victories = victories + 1;
	};
	if((Raoul.aivar[AIV_DefeatedByPlayer] == TRUE) || (Raoul.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//Что касается Рауля...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//Я пошел поговорить с Раулем...
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//И?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//Оказалось, что ему крайне необходима взбучка.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//Ты пока не вырубил ни одного из людей Сильвио.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Хорошо, продолжай в том же духе.
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//Я хочу, чтобы ты вырубил как минимум троих из них.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//Этого достаточно, вполне достаточно.

		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//Ты им всем начистил физиономию, Да?
		};

		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//Я поражен - если Ли спросит мое мнение, я проголосую за тебя без колебаний.
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		B_GivePlayerXP(XP_Ambient * victories);
		B_LogEntry(TOPIC_SLDRespekt,"Джарвис проголосует за меня, если я решу присоединиться к наемникам.");
	};
};

instance DIA_Jarvis_ShieldTeach(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_ShieldTeach_Condition;
	information = DIA_Jarvis_ShieldTeach_Info;
	permanent = TRUE;
	description = "Ты можешь меня чему-нибудь научить?";
};

func int DIA_Jarvis_ShieldTeach_Condition()
{
	if((JarvisShieldTeach == FALSE) && ((MIS_Jarvis_SldKO == LOG_SUCCESS) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_ShieldTeach_Info()
{
	AI_Output(other,self,"DIA_Jarvis_ShieldTeach_01_00");	//Ты можешь меня чему-нибудь научить?

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_01");	//Раз ты теперь один из нас, то я могу показать тебе, как управляться со щитом в бою.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_02");	//Это довольно непростое дело, как может показаться на первый взгляд.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_03");	//Но когда ты немного разберешься, что к чему, то поймешь - оно того действительно стоит!
		AI_Output(other,self,"DIA_Jarvis_ShieldTeach_01_04");	//Звучит заманчиво. Когда начнем?
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_05");	//(посмеиваясь) Не так быстро, приятель! Сначала тебе придется мне заплатить.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_06");	//Просто так, по доброте душевной, я ничему учить тебя не стану.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_07");	//А еще ты должен иметь хотя бы немного опыта, чтобы мои уроки не стали для тебя абсолютно бесполезным занятием.
		AI_Output(other,self,"DIA_Jarvis_ShieldTeach_01_08");	//Я все понимаю. Можешь не продолжать.
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_09");	//Тогда просто скажи, когда будешь готов, и мы начнем тренировки.
		JarvisShieldTeach = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Джарвис может показать мне, как обращаться с щитом.");
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_ShieldTeach_01_10");	//Нет! Пока ты не один из нас, я не стану этого делать.
	};
};

instance DIA_Jarvis_Shield_Teach(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_Shield_Teach_Condition;
	information = DIA_Jarvis_Shield_Teach_Info;
	permanent = TRUE;
	description = "Научи меня обращаться с щитом. (Очки обучения: 10, Цена: 1000 монет)";
};

func int DIA_Jarvis_Shield_Teach_Condition()
{
	if((JarvisShieldTeach == TRUE) && (hero.attribute[ATR_REGENERATEMANA] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Shield_Teach_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Shield_Teach_15_00");	//Научи меня обращаться с щитом.

	if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		B_GiveInvItems(other,self,ItMi_Gold,1000);
		Npc_RemoveInvItems(self,ItMi_Gold,1000);
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_01");	//Хорошо! Слушай внимательно.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_02");	//Щит - это то, что в трудную минуту сможет прикрыть твою задницу от смертельного удара.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_03");	//Обращаться со щитом умеет далеко не каждый! Но эти знания того стоят.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_04");	//Самое главное - старайся держать щит на уровне глаз. Не ниже и не выше.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_05");	//Это одновременно поможет тебе видеть своего противника и надежно прикрыть тело от удара.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_06");	//Удары меча должны быть быстрыми и короткими. Открылся, ударил и снова прикрылся щитом!
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_07");	//Противнику придется изрядно поломать свою голову над тем, как пройти твою оборону.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_08");	//И рано или поздно он допустит ошибку, которой ты должен будешь воспользоваться.
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_09");	//Если делать все правильно, то когда-нибудь ты обязательно станешь мастером-щитоносцем!
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_10");	//И вот еще что... Возьми это деревянный щит в качестве небольшого подарка.
		B_GiveInvItems(self,other,ItAr_Shield_01,1);
		AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_11");	//Сойдет для первых тренировок. Теперь можешь идти практиковаться.
		AI_Print("Бой с щитом - обучен!");
		Snd_Play("LevelUP");
		hero.attribute[ATR_REGENERATEMANA] = TRUE;
		Npc_SetTalentSkill(hero,NPC_TALENT_RHETORIKA,1);
		Npc_SetTalentValue(hero,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);
	}
	else
	{
		if(hero.lp < 10)
		{
			AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_16");	//У тебя не хватает опыта, приятель! Извини.
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 1000)
		{
			AI_Output(self,other,"DIA_Jarvis_Shield_Teach_01_17");	//У тебя не хватает золота, приятель! Извини.
		};
	};
};

instance DIA_Jarvis_Shield_Teach_More(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_Shield_Teach_More_Condition;
	information = DIA_Jarvis_Shield_Teach_More_Info;
	permanent = TRUE;
	description = "Покажи мне, как сражаться со щитом.";
};

func int DIA_Jarvis_Shield_Teach_More_Condition()
{
	if((JarvisShieldTeach == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] <= 100))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Shield_Teach_More_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Shield_Teach_More_15_00");	//Покажи мне, как сражаться со щитом.
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

func void DIA_Jarvis_Shield_Teach_More_Back()
{
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
};

func void DIA_Jarvis_Shield_Teach_More_1()
{
	B_TeachShield(self,other,1,100);
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

func void DIA_Jarvis_Shield_Teach_More_5()
{
	B_TeachShield(self,other,5,100);
	Info_ClearChoices(DIA_Jarvis_Shield_Teach_More);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,Dialog_Back,DIA_Jarvis_Shield_Teach_More_Back);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield1,DIA_Jarvis_Shield_Teach_More_1);
	Info_AddChoice(DIA_Jarvis_Shield_Teach_More,PRINT_Shield5,DIA_Jarvis_Shield_Teach_More_5);
};

var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_PERM_Condition;
	information = DIA_Jarvis_PERM_Info;
	permanent = TRUE;
	description = "Есть новости?";
};

func int DIA_Jarvis_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_PERM_Info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Есть новости?

	if(Kapitel <= 3)
	{
		if(Jarvis_GuildComment == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Теперь ты один из нас. Это хорошо.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//Ты сделал неверный выбор, ты мог бы стать одним из нас.
			};
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Последнее время, люди Сильвио ходят какие-то подавленные.
		};
	};
	if(Kapitel >= 4)
	{
		if(Jarvis_SylvioComment == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Сильвио наконец-то свалил! После того, как он услышал о драконах, он со своими парнями отправился в колонию.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//Он, вероятно, думает, что там будет лучше.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Нет, пока все спокойно. Мне очень интересно, чем все это кончится.
		};
	};
};


instance DIA_Jarvis_PICKPOCKET(C_Info)
{
	npc = Sld_808_Jarvis;
	nr = 900;
	condition = DIA_Jarvis_PICKPOCKET_Condition;
	information = DIA_Jarvis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jarvis_PICKPOCKET_Condition()
{
	return C_Beklauen(41,55);
};

func void DIA_Jarvis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET,Dialog_Back,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};

func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};