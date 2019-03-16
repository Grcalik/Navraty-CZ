
instance DIA_Jorgen_KAP3_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP3_EXIT_Condition;
	information = DIA_Jorgen_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_PICKPOCKET(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 900;
	condition = DIA_Jorgen_PICKPOCKET_Condition;
	information = DIA_Jorgen_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jorgen_PICKPOCKET_Condition()
{
	return C_Beklauen(59,70);
};

func void DIA_Jorgen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET,Dialog_Back,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};

func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};


instance DIA_Jorgen_Hallo(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 4;
	condition = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jorgen_Hallo_Condition()
{
	if((Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Hallo_Info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Эй, ты!

	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Я вижу, ты из монастыря магов.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Да, и что?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Вам не нужен еще один работник там?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Эй, ты когда-нибудь был в монастыре?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Может быть, а что?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//Они все еще набирают людей?
	};

	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Я просто не знаю, куда еще идти.
};


instance DIA_Jorgen_Novice(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 6;
	condition = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent = FALSE;
	description = "Мимо тебя не проходил послушник?";
};

func int DIA_Jorgen_Novice_Condition()
{
	if((MIS_NovizenChase == LOG_Running) && (Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Novice_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Мимо тебя не проходил послушник?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//Да, конечно, он побежал туда.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//Он прыгнул в воду с моста и поплыл так, как будто за ним гналась акула.
	AI_StopPointAt(self);
};

instance DIA_Jorgen_Milten(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 5;
	condition = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent = FALSE;
	description = "Если ты идешь в монастырь, тебе нужно поговорить с Милтеном.";
};

func int DIA_Jorgen_Milten_Condition()
{
	if((Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Milten_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Если ты идешь в монастырь, тебе нужно поговорить с Милтеном. Он, наверняка, сможет помочь тебе.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Как ты думаешь, меня примут туда?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Возможно. Но мне почему-то тяжело представить тебя в робе послушника.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Хватит нести чепуху - роба так роба. Мне прежде всего нужна еда, а то мне скоро придется обгладывать кору с деревьев.
};


instance DIA_Jorgen_Home(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 7;
	condition = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;
	description = "Откуда ты?";
};

func int DIA_Jorgen_Home_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Home_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Откуда ты?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//Я был капитаном большого китобойного судна, парень. Мой дом - море.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//Мой корабль, 'Магдалена', был потоплен пиратами несколько месяцев назад, и вот теперь я на мели здесь.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//Я очень хотел поскорее опять выйти в море, но с тех пор как я прибыл сюда, ни одной шхуны не зашло в этот проклятый порт.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Единственный корабль, пришвартовавшийся в Хоринисе, - это чертова военная галера короля, а они никого не берут.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//И что мне теперь делать? В городе для меня нет работы. Я пробовал уже все.
};


instance DIA_Jorgen_BeCarefull(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 8;
	condition = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent = TRUE;
	description = "Тебе лучше держаться подальше от дорог.";
};


func int DIA_Jorgen_BeCarefull_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BeCarefull_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Тебе лучше держаться подальше от дорог.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//Не волнуйся. Я уже заметил, что здешние места стали чертовски опасными последние пару дней.
};


instance DIA_Jorgen_KAP4_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP4_EXIT_Condition;
	information = DIA_Jorgen_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_NEUHIER(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 41;
	condition = DIA_Jorgen_NEUHIER_Condition;
	information = DIA_Jorgen_NEUHIER_Info;
	description = "Как жизнь в монастыре?";
};


func int DIA_Jorgen_NEUHIER_Condition()
{
	if((Kapitel >= 4) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Как жизнь в монастыре?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Я сойду здесь с ума!
	if(Npc_KnowsInfo(other,DIA_Jorgen_Milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Но все же, спасибо за совет. Милтен действительно помог мне получить место здесь.
		B_GivePlayerXP(XP_Ambient);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//Я чувствую себя идиотом среди этих всегда ворчащих благодетелей.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//Ну. А что еще мне делать? Чем помирать с голоду в городе, лучше уж выполнять работу, которую дают мне послушники.
};


instance DIA_Jorgen_PERM4(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 400;
	condition = DIA_Jorgen_PERM4_Condition;
	information = DIA_Jorgen_PERM4_Info;
	permanent = TRUE;
	description = "Я верю, что у тебя все будет в порядке.";
};


func int DIA_Jorgen_PERM4_Condition()
{
	if((Kapitel >= 4) && (CAPITANORDERDIAWAY == FALSE) && Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Jorgen_NEUHIER) && (JorgenIsCaptain == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM4_OneTime;

func void DIA_Jorgen_PERM4_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Я верю, что у тебя все будет в порядке.
	if((DIA_Jorgen_PERM4_OneTime == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Только представь: я должен пропалывать их огород. Если так будет продолжаться и дальше, я сойду с ума.
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Я так хочу опять почувствовать палубу под моими ногами.
};


instance DIA_Jorgen_KAP5_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP5_EXIT_Condition;
	information = DIA_Jorgen_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_BEMYCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 51;
	condition = DIA_Jorgen_BEMYCAPTAIN_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = "Может быть, я смогу предложить тебе работу капитана.";
};


func int DIA_Jorgen_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (CAPITANORDERDIAWAY == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_PyrokarClearDemonTower != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_BEMYCAPTAIN_OneTime;

func void DIA_Jorgen_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Может быть, я смогу предложить тебе работу капитана.
	if(DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Ты не издеваешься надо мной, парень? Если ты скажешь, что это правда, я всегда готов.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Эээ... есть только одна маленькая проблема. Я съел половину кладовки послушников.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Они чуть не сошли с ума от злости, когда узнали. Я не думаю, что главный маг позволит мне вот так просто уйти.
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Сначала мне нужно отработать мой долг перед Пирокаром. Извини.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Йорген готов стать моим капитаном, но я сначала должен оплатить его долг перед монастырем.");
};


instance DIA_Jorgen_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 52;
	condition = DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN2_Info;
	description = "Я расплатился с твоими долгами.";
};


func int DIA_Jorgen_BEMYCAPTAIN2_Condition()
{
	if((MIS_PyrokarClearDemonTower == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Я расплатился с твоими долгами. Ты свободен.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Правда? Как тебе удалось это?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Тебе лучше не знать.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//Ох, ладно. Меня это, действительно, не очень волнует. Тысяча благодарностей!

	if(SCGotCaptain == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//Как теперь насчет твоего предложения? У тебя еще есть место для меня?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//Отлично. Теперь я могу убраться отсюда!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_Jorgen_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 53;
	condition = DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN3_Info;
	description = "Будь моим капитаном.";
};


func int DIA_Jorgen_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Будь моим капитаном.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Это большая честь для меня, но у тебя есть корабль и команда?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//Должен заметить, нам нужно по крайней мере пять человек.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Хорошо. Я посмотрю, что можно сделать. Жди меня в гавани.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Есть, сэр.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jorgen_LOSFAHREN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_LOSFAHREN_Condition;
	information = DIA_Jorgen_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Ты готов доставить меня на остров?";
};


func int DIA_Jorgen_LOSFAHREN_Condition()
{
	if((JorgenIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Ты готов доставить меня на остров?
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Конечно! Давай сюда свою карту.
		AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_07_07");	//Вот, держи.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Отлично! (серьезно) Тогда мы сейчас же снимаемся с якоря.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Только перед тем как взойти на борт, еще раз хорошенько проверь свои запасы! Когда мы окажемся в море, дороги назад не будет.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//Потом можешь отправляться в капитанскую каюту и вздремнуть там немного. Мы скоро отправимся!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Тебе нужен корабль, команда из пяти человек и морская карта, чтобы я мог ориентироваться по ней.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Мы не сможем поднять паруса, пока у нас не будет всего необходимого.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Jorgen_PERM5_NOTCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "Как ты?";
};


func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == TRUE) && (JorgenIsCaptain == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;

func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Как ты?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Отлично! Это не самое плохое место.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Они дают мне идиотские поручения, типа пасти овец, но все же люди здесь далеко не такие ограниченные и тупые, как в монастыре.
		if(DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Мне нужно поискать для себя другое место. Посмотрим, куда еще меня занесет попутным ветром.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_Jorgen_KAP6_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP6_EXIT_Condition;
	information = DIA_Jorgen_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 1;
	condition = dia_jorgen_nw_kapitelorcattack_condition;
	information = dia_jorgen_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Что скажешь, капитан?";
};


func int dia_jorgen_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JORGENBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_01_00");	//Что скажешь, капитан?
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_01_01");	//Да что тут говорить...(печально) Я слышал, что в Хоринисе во всю орудуют орки!
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_01_02");	//Я слышал, что несколько парней все-таки хотят попробовать прорваться через город с боем.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_01_04");	//Многие из них опытные воины, и им не впервой сражаться против орков.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_01_03");	//Эх... Что нельзя сказать обо мне...(испуганно) Я ведь даже и меч толком держать не умею. Куда мне против этих тварей?
	Info_ClearChoices(dia_jorgen_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_jorgen_nw_kapitelorcattack,"(предложить руну телепортации к таверне)",dia_jorgen_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_jorgen_nw_kapitelorcattack,"Придется тебе попробовать.",dia_jorgen_nw_kapitelorcattack_nogiverune);
};

func void dia_jorgen_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_01");	//Подожди! У меня с собой есть руна телепортации к таверне 'Мертвая Гарпия'.
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_02");	//Можешь ею воспользоваться!
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_03");	//Руна? Хммм...(задумчиво) Ну, даже не знаю, надо подумать - а стоит ли?
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_05");	//Пробиваться с боем через город, доверху набитый орками - это для тебя верная смерть!
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_06");	//Эти твари из тебя фарш сделают! И ты это знаешь не хуже меня.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_08");	//Да уж... умеешь ты все-таки уговаривать. Ладно, давай ее сюда!
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_09");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_10");	//Эх! Надеюсь, после нее меня не будет опять неделю мутить, как после бутылки старого шнапса.
	JORGENNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Йоргену руну телепортации к таверне 'Мертвая Гарпия'. Теперь я спокоен за его судьбу.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_jorgen_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Другой возможности убраться отсюда нет!
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Не думаю, что у меня получится...(обреченно) Но придется попробовать.
	AI_Output(other,self,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Тогда удачи! Он тебе понадобится.
	AI_Output(self,other,"DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Спасибо.
	B_LogEntry(TOPIC_HELPCREW,"Йорген будет пробиваться с боем из захваченного города. Думаю, у него нет никаких шансов остаться в живых.");
	JORGENBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NW_AGAINCAPITAN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 1;
	condition = dia_jorgen_nw_againcapitan_condition;
	information = dia_jorgen_nw_againcapitan_info;
	permanent = FALSE;
	description = "Мне снова нужен капитан на корабль.";
};


func int dia_jorgen_nw_againcapitan_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_needcapitan) && (WHOTRAVELONBIGLAND == FALSE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_nw_againcapitan_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_00");	//Мне снова нужен капитан на корабль.
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_01");	//Хммм...(ехидно) Ты что-то задумал опять, приятель?
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_02");	//Я плыву на материк. У меня есть очень важное сообщение для короля! Ты поможешь мне?
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_03");	//Что же, если и есть такое - то тогда попутного тебе ветра в паруса! Извини, но я тебе больше не помощник.
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_04");	//Почему?
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_05");	//С меня хватит всего этого дерьма! Орки, драконы, демоны - я простой человек и хочу жить спокойно.
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_06");	//Лучше я останусь здесь и буду простым овцепасом в монастыре, чем буду плавать с тобой и постоянно трястись за свою жизнь.
	AI_Output(self,other,"DIA_Jorgen_NW_AgainCapitan_01_07");	//Так что извини, ничем помочь не могу!
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_08");	//Очень жаль. Я на тебя рассчитывал.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Йорген отказался быть капитаном на моем корабле. Мне стоит поискать кого-то другого, кто мне поможет.");
};