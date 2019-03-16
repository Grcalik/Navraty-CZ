
instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = DIA_Torlof_HALLO_Condition;
	information = DIA_Torlof_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//Чего тебе нужно от меня?
};


instance DIA_Torlof_WannaJoin(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = DIA_Torlof_WannaJoin_Condition;
	information = DIA_Torlof_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к наемникам!";
};

func int DIA_Torlof_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Ох? И с чего ты взял, что я поддержу тебя в этом начинании?
};

var int Torlof_Go;

instance DIA_Torlof_Probe(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 3;
	condition = DIA_Torlof_Probe_Condition;
	information = DIA_Torlof_Probe_Info;
	permanent = TRUE;
	description = "Испытай меня!";
};


func int DIA_Torlof_Probe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_WannaJoin) && (hero.guild == GIL_NONE) && (Torlof_Go == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Испытай меня!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Тебя послал ко мне Ли?

	if(Npc_KnowsInfo(other,DIA_Lee_OtherSld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//Он сказал, ты поможешь мне.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//Хорошо...(вздыхает) Тогда слушай! Прежде чем присоединиться к нам, ты должен сделать две вещи.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Во-первых, ты должен доказать, что способен решать задачи, которые входят в обязанности наемников. Я должен испытать тебя.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//И второе: ты должен заслужить уважение других наемников.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
		B_LogEntry(TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен пройти испытание Торлофа и заслужить уважение остальных наемников.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Нет.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Тогда с чего бы это я должен выслушивать твой бред?
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_Respekt(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 4;
	condition = DIA_Torlof_Respekt_Condition;
	information = DIA_Torlof_Respekt_Info;
	permanent = FALSE;
	description = "Как мне заслужить уважение других наемников? ";
};


func int DIA_Torlof_Respekt_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE) && (MIS_SLDRESPEKT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respekt_Info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Как мне заслужить уважение других наемников?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//Для большинства будет достаточно, если ты выполнишь свои задания и пройдешь мое испытание.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//Но чтобы убедить остальных, тебе придется поискать другой подход.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Некоторые попытаются извлечь выгоду из твоего положения, а другим может не понравиться твое лицо.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//Ты должен попытаться уговорить как можно больше наших парней - но если ничего не помогает, ты всегда можешь прибегнуть к дуэли.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Если ты победишь, ты завоюешь уважение большинства из них. Но только смотри, не убей случайно кого-нибудь. Тогда у тебя будут очень большие проблемы.
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	MIS_SLDRESPEKT = LOG_Running;
	B_LogEntry(TOPIC_SLDRespekt,"Чтобы наемники поддержали меня я должен выполнить задание, которое даст мне Торлоф. Чтобы заработать уважение наемников я должен буду чем-нибудь помочь им, либо одержать победу на дуэли.");
};


instance DIA_Torlof_Duellregeln(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = DIA_Torlof_Duellregeln_Condition;
	information = DIA_Torlof_Duellregeln_Info;
	permanent = FALSE;
	description = "Что за правила дуэлей?";
};


func int DIA_Torlof_Duellregeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_Respekt) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duellregeln_Info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Каковы правила дуэли?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Это довольно просто. Оба дуэлянта должны иметь возможность обнажить оружие до нанесения первого удара.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Нельзя просто так взять и напасть на кого-нибудь без предупреждения.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Обязательно должен иметь место устный вызов. Оскорбление, например, или еще какая-нибудь причина для сражения.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//Никто из наблюдателей не имеет права вмешиваться в дуэль. Если только один из дуэлянтов не будет убит.
	B_LogEntry(TOPIC_SLDRespekt,"Правила дуэли: Дуэль должна начаться с вызова, тогда в нее никто не имеет права вмешаться. Противника в дуэли нельзя убивать.");
};


instance DIA_Torlof_DeineStimme(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 6;
	condition = DIA_Torlof_DeineStimme_Condition;
	information = DIA_Torlof_DeineStimme_Info;
	permanent = FALSE;
	description = "А как насчет тебя? Ты проголосуешь за меня?";
};


func int DIA_Torlof_DeineStimme_Condition()
{
	if((Torlof_Go == TRUE) && (other.guild == GIL_NONE) && (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DeineStimme_Info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//А как насчет тебя? Ты проголосуешь за меня?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Если ты сможешь доказать, что можешь выполнять обязанности наемника, то да.
};


var int Points_Sld;

instance DIA_Torlof_RUF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 7;
	condition = DIA_Torlof_RUF_Condition;
	information = DIA_Torlof_RUF_Info;
	permanent = TRUE;
	description = "Как моя репутация среди наемников?";
};


func int DIA_Torlof_RUF_Condition()
{
	if((Torlof_Go == TRUE) && (Torlof_GenugStimmen == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Как моя репутация среди наемников?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Так, посмотрим...
	Points_Sld = 0;
	if(Npc_IsDead(SLD_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_AppleTest == LOG_Success)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Вольф говорит, что ничего не имеет против тебя.
		Points_Sld = Points_Sld + 1;
	};
	if(Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Джарвис полагает, что ты на правильной стороне.
		Points_Sld = Points_Sld + 1;
	}
	else if(Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Джарвис все еще не уверен, что ты на правильной стороне.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Он не хочет, чтобы под дудку Сильвио плясало еще больше людей. Если тебе это интересно, в этом я с ним согласен.
	};
	if(Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord_Approved == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Корд полагает, что ты достаточно хорош, чтобы присоединиться к нам.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//По мнению Корда, тебе нужно сначала научиться лучше владеть оружием.
	};
	if(Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if((MIS_Cipher_Paket == LOG_SUCCESS) || (MIS_Cipher_BringWeed == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Сайфер говорит, что ему абсолютно ясно, что ты достоин присоединиться к нам. Похоже, что-то сделало его безгранично счастливым.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Сайфер говорит, что за тобой должок, и что ты знаешь, о чем идет речь.
	};
	if(Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Rod,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Род просто хочет получить свой меч назад.
	}
	else if((Rod.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Похоже, тебе удалось убедить Рода, что ты достаточно силен.
		if(Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1;
		};
	}
	else if(Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Род считает тебя слабаком.
	};
	if(Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Sentenza,ItMi_Gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Сентенза проголосует за тебя. Он говорит, что ты весьма рассудительный человек.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if(Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Сентенза не проголосует за тебя. Он говорит, что ты должен ему полсотни золотых монет.
	};
	if(Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Рауль против тебя. Мне кажется, он на дух тебя не выносит.
	};
	if(Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//О Сильвио и Булко даже говорить нечего. Эти два кретина всегда против всех и вся.
	};
	if(Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Buster_Duell == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Бастер говорит, что с тобой все в порядке.
		if(Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//Хотя ты и проиграл ему.
		};
	}
	else if(Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Бастер говорит, что ты струсил, когда он вызвал тебя.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//Это не очень хорошо. Возможно, тебе стоит вернуться на аванпост и вызвать его.
	};
	if(Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Dar_LostAgainstCipher == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//Дар говорит, что ты трепач. Но к его голосу здесь не особенно прислушиваются.
	};
	if(Points_Sld > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Остальные наемники ничего не сказали.
	};
	if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Большинство из них просто ждет, пройдешь ли ты испытание.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//Ты убедил большинство из них, пройдя испытание.

		if(Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//(усмехается) Пусть Корд в этом и поучаствовал...
			Points_Sld = Points_Sld + 4;
		}
		else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//Хотя многие считают, что заставить фермера заплатить ренту было слишком легко, чтобы считать это испытанием.
			Points_Sld = Points_Sld + 3;
		}
		else
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//В любом случае ты можешь рассчитывать на мой голос.
		Points_Sld = Points_Sld + 1;
	};
	if(Sld_Duelle_gewonnen >= 3)
	{
		Points_Sld = Points_Sld + 1;
		if(Points_Sld >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//И ты победил в нескольких честных дуэлях.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//Многие наемники уважают это.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//Как бы то ни было, ты уже победил в нескольких честных дуэлях.
		};
	};
	if(Points_Sld >= 9)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Большинство наемников за тебя. И мы считаем, что ты можешь присоединиться к нам в любое время.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//Иди, поговори с Ли. Он объяснит тебе детали.
		Torlof_GenugStimmen = TRUE;
		MIS_SLDRESPEKT = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_SUCCESS);
		B_LogEntry(TOPIC_BecomeSLD,"Теперь я имею достаточное количество голосов наемников. Я должен немедленно поговорить с Ли! ");
	}
	else if(Points_Sld >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//Это довольно много, но пока еще не достаточно.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Тебе нужно еще сразиться с несколькими парнями.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Тебе еще далеко до всеобщего одобрения, парень. Если ты хочешь, чтобы мы приняли тебя в свои ряды, тебе нужно хорошо потрудиться.
	};
};


instance DIA_Torlof_Aufgaben(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 8;
	condition = DIA_Torlof_Aufgaben_Condition;
	information = DIA_Torlof_Aufgaben_Info;
	permanent = FALSE;
	description = "А каковы обязанности наемника?";
};


func int DIA_Torlof_Aufgaben_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//А каковы обязанности наемника?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Онар нанял нас по двум причинам: он хочет, чтобы мы сбросили с его шеи ополчение, и он хочет, чтобы мы поддерживали порядок на его фермах.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//Это включает сбор ренты, когда фермеры отказываются платить.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//Итак, что ты выбираешь?
	Info_ClearChoices(DIA_Torlof_Aufgaben);
	Info_AddChoice(DIA_Torlof_Aufgaben,"Я соберу ренту!",DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice(DIA_Torlof_Aufgaben,"Я разберусь с ополчением, можешь забыть об этой проблеме!",DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Хорошо. Слушай. Фермер Секоб не платит ренту Онару уже несколько недель.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Онар хочет, чтобы тот выложил полсотни золотых монет. Есть вопросы?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Где ферма Секоба?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//На севере этой долины. Если смотреть отсюда, она будет справа от большого перекрестка.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Если у тебя будут проблемы, фермеры на полях помогут тебе нейти дорогу.
	MIS_Torlof_HolPachtVonSekob = LOG_Running;
	Sekob.flags = 0;
	CreateInvItems(Sekob,ItMi_Gold,50);
	Log_CreateTopic(TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_Running);
	B_LogEntry(TOPIC_TorlofPacht,"Торлоф попросил меня собрать ренту с фермера Секоба. Он должен заплатить полсотни золотых монет.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Фермер Бенгар недавно жаловался, что ополчение из города действует ему на нервы.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Они давят на этого фермера - возможно, пытаются заставить его порвать отношения с Онаром.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Я хочу, чтобы ты отправился на его ферму и дал понять этим ополченцам, что там им делать нечего! Есть вопросы?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Как мне найти ферму Бенгара?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//На юго-западе этой долины есть большая лестница, ведущая на плато в горах. На нем и находится ферма Бенгара.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Если ты заблудишься, поспрашивай фермеров на полях, они покажут тебе дорогу.
	MIS_Torlof_BengarMilizKlatschen = LOG_Running;
	Bengar.flags = 0;
	Wld_InsertNpc(Mil_335_Rumbold,"FARM3");
	Wld_InsertNpc(Mil_336_Rick,"FARM3");
	B_InitNpcGlobals();
	Log_CreateTopic(TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofMiliz,LOG_Running);
	B_LogEntry(TOPIC_TorlofMiliz,"Торлоф попросил изгнать ополчение с фермы Бенгара. Она находится на плоскогорье.");
};

func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Я соберу ренту!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Я разберусь с ополчением, можешь забыть об этой проблеме!
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};


var int Torlof_TheOtherMission_Day;

func void B_Torlof_TheOtherMissionDay()
{
	if(Torlof_TheOtherMission_Day < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Ты потратил на это слишком много времени. Онар будет недоволен.
		Torlof_TheOtherMission_TooLate = TRUE;
		if(EnterOW_Kapitel2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//И ему все равно, погибнут паладины в Долине Рудников или нет...
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Отлично! Когда у меня будет что-нибудь новенькое, я дам тебе знать.
	};
};


instance DIA_Torlof_SekobSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 9;
	condition = DIA_Torlof_SekobSuccess_Condition;
	information = DIA_Torlof_SekobSuccess_Info;
	permanent = TRUE;
	description = "Я собрал ренту Секоба.";
};


func int DIA_Torlof_SekobSuccess_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		if((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Я собрал ренту Секоба.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		B_GivePlayerXP(XP_Torlof_SekobsKohlebekommen);
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//И? Он заплатил добровольно?

		if(Npc_IsDead(Sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//Ну, с ним произошел несчастный случай...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Мне пришлось убедить его.
		};
		if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Отлично! Ты прошел испытание. Это убедит большинство наемников, что ты достойный кандидат.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_SUCCESS);
		B_LogEntry(TOPIC_TorlofPacht,"Я принес Торлофу ренту от Секоба.");
		B_LogEntry_Quiet(TOPIC_BecomeSLD,"Я выполнил задачу, которую дал мне Торлоф.");
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//И? Ты что, промотал все деньги? Ты должен принести их мне! И побыстрее!
	};
};


instance DIA_Torlof_BengarSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 10;
	condition = DIA_Torlof_BengarSuccess_Condition;
	information = DIA_Torlof_BengarSuccess_Info;
	permanent = FALSE;
	description = "Я решил проблемы Бенгара с ополчением.";
};


func int DIA_Torlof_BengarSuccess_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Я решил проблемы Бенгара с ополчением.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Ты позаботился, чтобы они не появились у него на пороге завтра утром?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//Чтобы сделать это, им придется очень хорошо постараться...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Отлично!
	if(Torlof_Probe == Probe_Bengar)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Ты прошел испытание. Ты смог разобраться с ополчением, этого достаточно, чтобы заслужить уважение большинства.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry(TOPIC_BecomeSLD,"Я выполнил задачу, которую дал мне Торлоф.");
	Torlof_ProbeBestanden = TRUE;
};


instance DIA_Torlof_Welcome(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_Welcome_Condition;
	information = DIA_Torlof_Welcome_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Welcome_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Добро пожаловать в ряды наемников, парень!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Спасибо!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Как только у меня будет работа для тебя, я дам тебе знать.
};


var int Torlof_KnowsDragons;

func void B_Torlof_Dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Где ты был?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//Я был в Долине Рудников! Там драконы! И паладинам приходится несладко!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Да? Похоже, во всех этих историях действительно есть доля правды!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Ли это будет интересно...
	Torlof_KnowsDragons = TRUE;
};


instance DIA_Torlof_TheOtherMission(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_TheOtherMission_Condition;
	information = DIA_Torlof_TheOtherMission_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_TheOtherMission_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info()
{
	if((Torlof_KnowsDragons == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		B_Torlof_Dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Хорошо, что ты здесь. У меня есть для тебя работа...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//Что такое?
	if(Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else
	{
		B_Torlof_BengarMilizKlatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//И ты должен покончить с этим до завтрашнего утра!
	Torlof_TheOtherMission_Day = Wld_GetDay();
};


instance DIA_Torlof_Dragons(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 12;
	condition = DIA_Torlof_Dragons_Condition;
	information = DIA_Torlof_Dragons_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Dragons_Condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (Kapitel <= 3) && (other.guild == GIL_SLD) && (Torlof_KnowsDragons == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info()
{
	B_Torlof_Dragons();
};


instance DIA_Torlof_WhatCanYouTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 140;
	condition = DIA_Torlof_WhatCanYouTeach_Condition;
	information = DIA_Torlof_WhatCanYouTeach_Info;
	permanent = FALSE;
	description = "Ты можешь помочь мне улучшить мои способности?";
};

func int DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};

func void DIA_Torlof_WhatCanYouTeach_Info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Ты можешь помочь мне улучшить мои способности?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//Я мог бы показать тебе, как лучше использовать силу в ближнем бою.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Многие бойцы проигрывают из-за того, что не умеют правильно применять свою силу.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//То же самое касается ловкости и дальнобойного оружия.
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Торлоф может повысить мою ловкость и силу.");
};

var int Torlof_Merke_STR;
var int Torlof_Merke_DEX;

instance DIA_Torlof_NoTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_NoTeach_Condition;
	information = DIA_Torlof_NoTeach_Info;
	permanent = FALSE;
	description = "Я хочу улучшить свои способности!";
};

func int DIA_Torlof_NoTeach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach) == TRUE) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Torlof_NoTeach_Info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Я хочу улучшить свои способности!
	AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//Я сказал, что я МОГ БЫ помочь тебе, но это не значит, что я БУДУ помогать.
	AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Пока ты не станешь одним из нас, тебе лучше поискать другого учителя!
};

instance DIA_Torlof_Teach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_Teach_Condition;
	information = DIA_Torlof_Teach_Info;
	permanent = TRUE;
	description = "Я хочу улучшить свои способности!";
};

func int DIA_Torlof_Teach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach) == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Teach_Info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Я хочу улучшить свои способности!
	Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
	Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_Back()
{
	if((Torlof_Merke_STR < other.attribute[ATR_STRENGTH]) || (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Хорошо! Теперь ты можешь более эффективно использовать свои способности!
	};
	Info_ClearChoices(DIA_Torlof_Teach);
};

func void DIA_Torlof_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_HIGH);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_HIGH);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void dia_torlof_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void dia_torlof_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};


instance DIA_Torlof_KAP3_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP3_EXIT_Condition;
	information = DIA_Torlof_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DEMENTOREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DEMENTOREN_Condition;
	information = DIA_Torlof_DEMENTOREN_Info;
	description = "У тебя есть какая-нибудь работа для меня?";
};


func int DIA_Torlof_DEMENTOREN_Condition()
{
	if((Kapitel >= 3) && (CAPITANORDERDIAWAY == FALSE) && (MeetDarkRavenSpeaker == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//У тебя есть какая-нибудь работа для меня?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Ты видел этих парней, одетых в черные робы, которые ошиваются здесь? Меня от них в дрожь бросает, если честно.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Когда я ходил по морю, я видел много странных вещей, но эти парни по-настоящему испугали меня.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//Они пришли со стороны лагеря бандитов, который находится в горах, в южной части этой долины.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Возможно, тебе стоит сходить туда и разобраться с этими парнями!
	MIS_Torlof_Dmt = LOG_Running;
	Log_CreateTopic(TOPIC_Torlof_Dmt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_Running);
	B_LogEntry(TOPIC_Torlof_Dmt,"В южной части долины, в горах, в бандитском лагере, похоже, появились эти люди в черных робах. Торлофа это очень сильно беспокоит! Я должен решить эту проблему для него.");
};

instance DIA_Torlof_DmtSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DmtSuccess_Condition;
	information = DIA_Torlof_DmtSuccess_Info;
	description = "Те люди, в темных робах, больше не будут беспокоить вас!";
};

func int DIA_Torlof_DmtSuccess_Condition()
{
	if((MIS_Torlof_Dmt == LOG_Running) && (CastlemineDMTMasterIsDead == TRUE) && (CastlemineDMTIsDead == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info()
{
	B_GivePlayerXP(XP_Torlof_DMT);
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Те люди, в темных робах, больше не будут беспокоить вас!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Ты смог разобраться с ними? Отлично!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Я сразу не доверял этим парням. За версту было видно, что от них будут одни неприятности!
	MIS_Torlof_Dmt = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_SUCCESS);
	B_LogEntry(TOPIC_Torlof_Dmt,"Я сообщил Торлофу, что о темных странниках можно больше не беспокоиться.");
};

instance DIA_Torlof_KAP4_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP4_EXIT_Condition;
	information = DIA_Torlof_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Torlof_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_WOISTSYLVIO(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 40;
	condition = DIA_Torlof_WOISTSYLVIO_Condition;
	information = DIA_Torlof_WOISTSYLVIO_Info;
	description = "Что, часть наемников ушла отсюда?";
};


func int DIA_Torlof_WOISTSYLVIO_Condition()
{
	if((CAPITANORDERDIAWAY == FALSE) && ((MIS_ReadyforChapter4 == TRUE) || (Kapitel == 4)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Что, часть наемников ушла отсюда?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Сильвио забрал нескольких парней и ушел через проход.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Поговаривают, что там появились драконы. Когда он это услышал, его было не остановить.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Кто знает? Сокровища драконов наверняка можно очень дорого продать.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//Но меня это не касается. Я моряк. Я принадлежу морю, и мне нет дела до душного логова дракона.
};


instance DIA_Torlof_KAP5_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP5_EXIT_Condition;
	information = DIA_Torlof_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 51;
	condition = DIA_Torlof_BEMYCAPTAIN_Condition;
	information = DIA_Torlof_BEMYCAPTAIN_Info;
	permanent = FALSE;
	description = "Ты был моряком?";
};


func int DIA_Torlof_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (TORLOFCANBECAPITAN == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Ты моряк?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//Ты что, только узнал об этом?! (удивленно) Да, черт побери, я моряк! А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Я мог бы найти применение твоим талантам. Мне нужно добраться до острова.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//До острова? (смеется) Да у тебя даже нет корабля, не говоря уже о команде!
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Нет, мой мальчик! Если ты хочешь воспользоваться моими услугами в качестве капитана и учителя силы, ты должен сначала доказать мне, что ты понимаешь, о чем говоришь.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Кроме этого, у меня хватает и других проблем. Паладины не ушли из города, как я ожидал.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Должно произойти что-то очень серьезное, чтобы они убрались оттуда.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN,"Ладно, забудь.",dia_torlof_bemycaptain_no);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN,"А если я позабочусь об этом, тогда ты станешь моим капитаном?",dia_torlof_bemycaptain_yes);
};

func void dia_torlof_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_No_01_00");	//Ладно, забудь.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_No_01_01");	//Вот, вот...(усмехаясь) И я об этом же тебе толкую!
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_08");	//Так что лучше проваливай!
	AI_StopProcessInfos(self);
};

func void dia_torlof_bemycaptain_yes()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_Yes_01_00");	//А если я позабочусь о том, чтобы паладины покинули город - тогда ты станешь моим капитаном?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_Yes_01_01");	//Хммм...(задумчиво) Да, тогда пожалуй я действительно смог бы помочь тебе добраться до острова.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_Yes_01_02");	//Но не раньше чем ты исполнишь, что обещал!
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Прежде чем Торлоф примет должность капитана, я должен буду позаботиться о том, чтобы паладины покинули город. Интересно, как мне это сделать?");
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN2(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 52;
	condition = DIA_Torlof_BEMYCAPTAIN2_Condition;
	information = DIA_Torlof_BEMYCAPTAIN2_Info;
	description = "Ворота замка в Долине Рудников открыты.";
};


func int DIA_Torlof_BEMYCAPTAIN2_Condition()
{
	if((MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Ворота в замке Долины Рудников открыты, и их заклинило. Теперь ничто не сдерживает орков, и они берут этот замок приступом.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Паладины в замке несут тяжелые потери.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//И я думаю, не пройдет много времени, когда паладины из города выступят в Долину Рудников, чтобы выручить парней, осажденных в замке.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//Это хорошие новости! Теперь ничто не мешает мне покинуть это богом проклятое место.
};


instance DIA_Torlof_BEMYCAPTAIN3(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 53;
	condition = DIA_Torlof_BEMYCAPTAIN3_Condition;
	information = DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent = TRUE;
	description = "Теперь ты поможешь мне добраться до острова?";
};


var int Torlof_PaidToBeCaptain;

func int DIA_Torlof_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN2) && (Torlof_PaidToBeCaptain == FALSE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Теперь ты поможешь мне добраться до острова?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//Ох, да. Ты хотел добраться до острова. Ммм. Вот мои условия.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Ты заплатишь мне две с половиной тысячи золотом, и я готов стать капитаном твоего корабля.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//А также я готов повышать твою силу и ловкость, когда ты только этого захочешь.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3,"Это чертовски большая сумма.",DIA_Torlof_BEMYCAPTAIN3_zuViel);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3,"Хорошо. Вот твое золото.",DIA_Torlof_BEMYCAPTAIN3_ok);
};

func void DIA_Torlof_BEMYCAPTAIN3_zuViel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//Это чертовски большая сумма.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//Да. Помощь профессионала стоит дорого. Но у тебя нет другого выбора. Тебе не найти другого капитана для своего корабля.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Так что плати денежки и не создавай проблем.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry(Topic_Captain,"Торлоф теперь готов командовать кораблем. Правда, он хочет получить за эту работу две с половиной тысячи золотых монет.");
};

func void DIA_Torlof_BEMYCAPTAIN3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//Хорошо. Вот твое золото.
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//Превосходно. Теперь тебе остается только рассказать подробно, что я должен делать.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry(Topic_Captain,"После того, как Торлоф получил свои деньги, он, наконец, готов идти со мной.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Ты пытаешься надуть меня? Сначала добудь деньги. Тогда и поговорим.
	};
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
};


instance DIA_Torlof_BEMYCAPTAIN4(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 54;
	condition = DIA_Torlof_BEMYCAPTAIN4_Condition;
	information = DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent = TRUE;
	description = "Будь моим капитаном.";
};


func int DIA_Torlof_BEMYCAPTAIN4_Condition()
{
	if((SCGotCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Будь моим капитаном.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//Хорошо. Дай мне корабль и крепкую команду, и я доставлю тебя на этот проклятый остров.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//У тебя есть морская карта? Без нее мы далеко не уплывем.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//Я позабочусь обо всем. Увидимся в порту.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//Мне не терпится увидеть, как это все у тебя получится.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	TorlofIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Torlof_LOSFAHREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_LOSFAHREN_Condition;
	information = DIA_Torlof_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Мы отправляемся к острову.";
};


func int DIA_Torlof_LOSFAHREN_Condition()
{
	if((TorlofIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Мы отправляемся к острову.
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Хорошо! Дай мне морскую карту - и мы поднимаем паруса!
		AI_Output(other,self,"DIA_Torlof_LOSFAHREN_01_07");	//Вот, держи.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(громко кричит) Поднять паруса!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Проверь - успел ли ты взять все необходимое. Возврата не будет!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Если ты во всем уверен, иди вздремни в капитанской каюте. Это путешествие будет долгим!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//Без корабля, команды и морской карты никакого путешествия не будет, приятель.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Мне нужно, по крайней мере, 5 человек, готовых встать под мое начало.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_PERM5_NOTCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "Я решил взять другого капитана.";
};


func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition()
{
	if((SCGotCaptain == TRUE) && (TorlofIsCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Я решил взять другого капитана. Верни мне мои деньги.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//Черта с два! Если ты заплатил мне вперед, а затем отказался от моих услуг, это твои проблемы.
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_KAP6_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP6_EXIT_Condition;
	information = DIA_Torlof_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_PICKPOCKET(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 900;
	condition = DIA_Torlof_PICKPOCKET_Condition;
	information = DIA_Torlof_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Torlof_PICKPOCKET_Condition()
{
	return C_Beklauen(76,120);
};

func void DIA_Torlof_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,Dialog_Back,DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};

func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};


instance DIA_TORLOF_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_torlof_nw_kapitelorcattack_condition;
	information = dia_torlof_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "У меня для тебя плохие новости.";
};


func int dia_torlof_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (TORLOFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_01_00");	//У меня для тебя плохие новости - Хоринис захвачен орками!
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_01_01");	//Когда мы еще только подходили к гавани - я уже тогда почувствовал что-то неладное.
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_01_04");	//Думаю, что при нашей теперешней ситуации нам может помочь только одно.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_01_05");	//Что именно?
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_01_06");	//Чудо, конечно!
	Info_ClearChoices(dia_torlof_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_torlof_nw_kapitelorcattack,"Предложить руну телепортации на ферму Онара.",dia_torlof_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_torlof_nw_kapitelorcattack,"Ладно, как скажешь.",dia_torlof_nw_kapitelorcattack_nogiverune);
};

func void dia_torlof_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_01");	//Подожди! У меня с собой есть руна телепортации на ферму Онара.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_02");	//Можешь ею воспользоваться.
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_03");	//Руна?!
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_05");	//Твоя идея пробиваться с боем через город, доверху набитый орками - чистое безумие.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_06");	//Эти твари из тебя фарш сделают! И ты это знаешь не хуже меня.
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_09");	//Ладно, давай ее сюда.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_10");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_11");	//Эх! Надеюсь, после нее меня не будет опять неделю мутить, как после бутылки старого шнапса.
	TORLOFNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Торлофу руну телепортации на ферму Онара. Теперь я спокоен за его судьбу.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_torlof_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Ладно, не буду тебя отговаривать.
	B_LogEntry(TOPIC_HELPCREW,"Торлоф будет пробиваться через город с боем. Думаю, у него есть на это шансы.");
	TORLOFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_FUCKOFF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = dia_sld_801_torlof_fuckoff_condition;
	information = dia_sld_801_torlof_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_801_torlof_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_801_TORLOF_YOURFREE(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_yourfree_condition;
	information = dia_sld_801_torlof_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_801_torlof_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_yourfree_info()
{
	AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_08");	//Чего тебе еще надо?!
	AI_Output(other,self,"DIA_SLD_801_Torlof_YourFree_01_00");	//Ты свободен!
	AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_01");	//Хммм...(удивленно) Ты что, перебил всех орков в городе?
	AI_Output(other,self,"DIA_SLD_801_Torlof_YourFree_01_02");	//Да, именно так.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_03");	//Что же, отлично приятель! А то мы уж думали, что нам всем пришел конец.
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_04");	//Только открой сначала решетки, чтобы мы смогли выйти отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_05");	//Что же, отлично приятель! А то я уж думал, что мне пришел конец.
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_06");	//Только открой сначала решетку, чтобы я смог выйти отсюда.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_OPENGATENOW(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_opengatenow_condition;
	information = dia_sld_801_torlof_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_801_torlof_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (TORLOFISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_opengatenow_info()
{
	AI_Output(self,other,"DIA_SLD_801_Torlof_OpenGateNow_01_00");	//(непонимающе) Ты так и будешь стоять тут?!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_AGAINCAPITAN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = dia_sld_801_torlof_againcapitan_condition;
	information = dia_sld_801_torlof_againcapitan_info;
	permanent = FALSE;
	description = "Мне нужен капитан!";
};


func int dia_sld_801_torlof_againcapitan_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_needcapitan) && (TORLOFISFREE == TRUE) && (GREGISCAPITAN != TRUE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_againcapitan_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SLD_801_Torlof_AgainCapitan_01_00");	//Мне нужен капитан!
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_01");	//Да?! И куда это ты вновь собрался, приятель?
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_02");	//Да?! И зачем же он тебе вдруг понадобился?
	};
	AI_Output(other,self,"DIA_SLD_801_Torlof_AgainCapitan_01_03");	//Мне нужно немедленно отплыть на материк.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_04");	//(удивленно) На материк?
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_06");	//Считай, что ты нашел себе капитана.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_07");	//В конце концов это лучше, чем целую вечность торчать на этой проклятой ферме.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_08");	//И когда мы снимаемся с якоря?
	AI_Output(other,self,"DIA_SLD_801_Torlof_AgainCapitan_01_09");	//Прямо сейчас.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_10");	//Хорошо...(решительно) Тогда я отправляюсь в гавань, чтобы подготовить корабль к отплытию.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_11");	//Да, и не забудь: мне понадобятся еще несколько человек, чтобы каким-то образом управляться с этой посудиной.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_12");	//Полагаю, что пяти или шести человек будет вполне достаточно!
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_14");	//Встретимся на корабле!
	B_LogEntry(TOPIC_SALETOBIGLAND,"Теперь Торлоф мой капитан. Однако чтобы отплыть, мне необходимо найти еще пять-шесть человек.");
	WHOTRAVELONBIGLAND = TRUE;
	TORLOFISAGAINCAPITAN = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AllOnBoard");
};


instance DIA_SLD_801_TORLOF_TRAVELONBIGLAND(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_travelonbigland_condition;
	information = dia_sld_801_torlof_travelonbigland_info;
	permanent = TRUE;
	description = "Мой корабль готов?";
};


func int dia_sld_801_torlof_travelonbigland_condition()
{
	if((TORLOFISAGAINCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE) && (WHOTRAVELONBIGLAND == TRUE) && (COUNTTRAVELONBIGLAND > 0) && (ALLSAYGOODBUY == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_travelonbigland_info()
{
	AI_Output(other,self,"DIA_SLD_801_Torlof_TravelOnBigLand_01_00");	//Мой корабль готов?
	if(COUNTTRAVELONBIGLAND >= 5)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_01");	//Конечно. Все в полном порядке! Как же иначе.
		AI_Output(other,self,"DIA_SLD_801_Torlof_TravelOnBigLand_01_02");	//Ну раз так, тогда мы можем отплывать.
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_03");	//Хммм. Ты в этом полностью уверен?
		AI_Output(other,self,"DIA_SLD_801_Torlof_TravelOnBigLand_01_04");	//Да. Время не ждет.
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_05");	//Хорошо. Будь по-твоему.
		AI_TurnToNPC(self,DiegoNW);
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_06");	//...(кричит) Эй вы все, крысы сухопутные!
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_07");	//...(кричит) Поднять якорь, отдать швартовые, ставить паруса!
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_08");	//...(кричит) Закрепить узлы и лебедку!
		ALLSAYGOODBUY = TRUE;
		MIS_SALETOBIGLAND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_SUCCESS);
		B_LogEntry(TOPIC_SALETOBIGLAND,"Мы покидаем Хоринис и отправляемся на материк. Кто знает, что нас там ждет...");
		Info_ClearChoices(dia_sld_801_torlof_travelonbigland);
		Info_AddChoice(dia_sld_801_torlof_travelonbigland,Dialog_Ende,dia_sld_801_torlof_travelonbigland_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_09");	//Конечно. Все в полном порядке! Как же иначе.
	};
};

func void dia_sld_801_torlof_travelonbigland_ok()
{
	AI_StopProcessInfos(self);
	b_end_avi();
};

