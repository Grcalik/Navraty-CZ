
instance DIA_Serpentes_Kap1_EXIT(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 999;
	condition = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Serpentes_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Serpentes_NoEnter_PissOff(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = DIA_Serpentes_NoEnter_PissOff_Condition;
	information = DIA_Serpentes_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Serpentes_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};


instance DIA_Serpentes_NOTALK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOTALK_Condition;
	information = DIA_Serpentes_NOTALK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Serpentes_NOTALK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOTALK_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//Ты осмеливаешься обращаться ко мне, послушник? Возвращайся к своей работе.
	Info_ClearChoices(DIA_Serpentes_NOTALK);
	Info_AddChoice(DIA_Serpentes_NOTALK,"Мне нужно идти.",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice(DIA_Serpentes_NOTALK,"У меня есть еще один вопрос...",DIA_Serpentes_NOTALK_QUESTION);
};

func void DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//У меня есть еще один вопрос...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(в ярости) Похоже, ты не понимаешь. Я решаю, когда говорить с тобой, а когда нет. Что ты о себе вообразил?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//А теперь возвращайся к работе!
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_GOAWAY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_GOAWAY_Condition;
	information = DIA_Serpentes_GOAWAY_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_GOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Serpentes_NOTALK) && Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Твое присутствие здесь говорит не только о недостатке уважения, но также о твоей тупости, послушник!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_YOURSTORY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 24;
	condition = DIA_Serpentes_YOURSTORY_Condition;
	information = DIA_Serpentes_YOURSTORY_Info;
	permanent = FALSE;
	description = "Я слышал, что ты прошел Испытание Огнем.";
};


func int DIA_Serpentes_YOURSTORY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_TEST) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,DIA_Pyrokar_MAGICAN) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_YOURSTORY_Info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//Я слышал, что ты прошел Испытание Огнем.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//Со всей присущей мне скромностью я расскажу тебе об этом. Все остальные, кто пытались пройти это испытание, мертвы.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//Тебе не стоит пытаться пройти это испытание. Твой дух слаб. Лучше служи в монастыре, и, возможно, через несколько лет ты будешь выбран.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Я хочу пройти это испытание.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Если такова воля Инноса, то пройдешь. Но если нет - то ты умрешь.
};



instance DIA_Serpentes_TEST(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_TEST_Condition;
	information = DIA_Serpentes_TEST_Info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, мастер.";
};


func int DIA_Serpentes_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_TEST_Info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Я готов пройти твое испытание, мастер.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Итак, ты хочешь подвергнуться этому испытанию. Только самые мужественные послушники требуют этого. Но мужество - это не все, что тебе понадобится.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Достаточно ли ты умен, чтобы пройти это испытание? А сил у тебя хватит встретить все опасности, что поджидают тебя?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Если нет, ты заплатишь за это своей жизнью.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//А теперь слушай: В Месте Камней, найди того, кто никогда не был рожден - найди того, кто когда-то был вызван.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Одолей того, кого нельзя одолеть - померься силами с живой скалой, сразись с бессмертным камнем - и уничтожь его.
	Wld_InsertNpc(MagicGolem,"FP_MAGICGOLEM");
	Magic_Golem = Hlp_GetNpc(MagicGolem);
	MIS_GOLEM = LOG_Running;
	Log_CreateTopic(TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Golem,LOG_Running);
	B_LogEntry(TOPIC_Golem,"Серпентес дал мне испытание. Он хочет, чтобы я 'нашел ему того, кто когда-то был вызван', живую скалу, и победил его.");
};

instance DIA_Serpentes_NOIDEA(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOIDEA_Condition;
	information = DIA_Serpentes_NOIDEA_Info;
	permanent = FALSE;
	description = "Что за создание это должно быть?";
};

func int DIA_Serpentes_NOIDEA_Condition()
{
	if((MIS_GOLEM == LOG_Running) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOIDEA_Info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//Живой скалой?! Что за создание это должно быть?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Я сказал тебе все...(с издевкой) Или это испытание кажется тебе слишком сложным?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Теперь ты узнаешь, что означает пройти Испытание Огнем - я больше не буду отвечать на твои вопросы.
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOHELP(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOHELP_Condition;
	information = DIA_Serpentes_NOHELP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_NOHELP_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Serpentes_NOIDEA) && (Npc_IsDead(Magic_Golem) == FALSE) && (MIS_GOLEM == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,DIA_Ulthar_TEST) == FALSE) || Npc_KnowsInfo(other,DIA_Serpentes_YOURSTORY)))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOHELP_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(с презрением) Иди и выполняй свою задачу, послушник!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_SUCCESS(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 3;
	condition = DIA_Serpentes_SUCCESS_Condition;
	information = DIA_Serpentes_SUCCESS_Info;
	permanent = FALSE;
	description = "Я победил голема.";
};


func int DIA_Serpentes_SUCCESS_Condition()
{
	if(Npc_IsDead(MagicGolem) && (MIS_GOLEM == LOG_Running) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SUCCESS_Info()
{
	var C_Npc Garwig;
	Garwig = Hlp_GetNpc(Nov_608_Garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Я победил голема.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Что? Ты действительно сделал это? Но без Молота Инноса ты никогда бы не смог уничтожить этого голема.
	if(Npc_IsDead(Garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(с триумфом) Но ты выдал себя! Это ты убил Гарвига!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//ТЫ ПОНЕСЕШЬ НАКАЗАНИЕ ЗА УБИЙСТВО СЛУГИ ИННОСА!!!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_HumanMurderedHuman,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(с сожалением) Тем не менее, я должен признать, что ты выполнил задание, которое я дал тебе.
	};
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//И будет лучше, если я заберу этот молот.
		Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
		Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP(XP_GOLEM);
};


instance DIA_Serpentes_PERM(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 99;
	condition = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent = TRUE;
	description = "Ты хочешь что-то еще сказать мне?";
};


func int DIA_Serpentes_PERM_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Serpentes_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_PERM_Info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Ты хочешь что-то еще сказать мне?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Нет. Пока нет, брат.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Свободен. Ты знаешь, что тебе нужно делать.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_MinenAnteile(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 30;
	condition = DIA_Serpentes_MinenAnteile_Condition;
	information = DIA_Serpentes_MinenAnteile_Info;
	important = TRUE;
};


func int DIA_Serpentes_MinenAnteile_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_MinenAnteile_Info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Не так быстро. У меня есть еще одно задание для тебя.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(вздыхает) Что еще?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Теперь, когда ты принадлежишь к Братству Огня, ты также должен выполнять обязанности, сопутствующие твоему положению.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Церковь занимается не только вопросами магии - она также, как ты знаешь, является последней инстанцией в вопросе осуществления правосудия.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Последний случай, с которым нам пришлось иметь дело, открывает бездонную пропасть, и с этим нужно разобраться раз и навсегда.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"У меня и так уже много заданий. Найди кого-нибудь еще.",DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Что ты там придумал?",DIA_Serpentes_MinenAnteile_was);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Разве это не работа ополчения?",DIA_Serpentes_MinenAnteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Наемник вроде тебя мог бы очень помочь нам в этом вопросе.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"У меня и так уже много заданий. Найди кого-нибудь еще.",DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Кого я должен убить?",DIA_Serpentes_MinenAnteile_KillSLD);
	};
};

func void DIA_Serpentes_MinenAnteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Разве это не работа ополчения?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Ополчение отвечает только за город. Это дело может иметь далеко идущие последствия.
};

func void DIA_Serpentes_MinenAnteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//У меня и так уже много заданий. Найди кого-нибудь еще.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Я объявляю тебе выговор. Надеюсь, больше этого не повторится - иначе ты плохо кончишь.
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//Ну что там еще?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Кто-то в городе продает фальшивые акции шахт бывшей исправительной колонии.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Эти бумаги абсолютно бесполезны и не имеют особого значения. Но все же, они могут посеять волнения и недовольства среди людей, что мы не можем позволить себе в текущей ситуации.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Этот мошенник предположительно имеет связи со всеми наиболее влиятельными торговцами в городе и сельской местности, и ему уже удалось продать свои поддельные акции некоторым из них.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Найди этого мошенника и приведи его сюда. В такие тяжелые времена мы не потерпим жуликов и грабителей.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Это дело должно стать показательным, чтобы другим было неповадно.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Я попробую прояснить этот вопрос.",DIA_Serpentes_MinenAnteile_was_ja);
};

func void DIA_Serpentes_MinenAnteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Я попробую прояснить этот вопрос.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Еще одно. Когда ты будешь разговаривать с этими торговцами, важно, чтобы они не поняли, что ты ищешь именно эти акции.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Я думаю, они захотят продать их, но наверняка откажутся иметь с тобой дело, если поймут, что ты действуешь по поручению Церкви, понимаешь?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Да.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Тогда за работу. Я желаю тебе успеха, брат.
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	MIS_Serpentes_MinenAnteil_KDF = LOG_Running;
	if(Npc_IsDead(Salandril) == FALSE)
	{
		CreateInvItems(Salandril,ItWr_MinenAnteil_Mis,2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};
	if(Npc_IsDead(VLK_416_Matteo) == FALSE)
	{
		CreateInvItems(VLK_416_Matteo,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(VLK_413_Bosper) == FALSE)
	{
		CreateInvItems(VLK_413_Bosper,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(VLK_409_Zuris) == FALSE)
	{
		CreateInvItems(VLK_409_Zuris,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(BAU_911_Elena) == FALSE)
	{
		CreateInvItems(BAU_911_Elena,ItWr_MinenAnteil_Mis,2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};
	if(Npc_IsDead(BAU_970_Orlan) == FALSE)
	{
		CreateInvItems(BAU_970_Orlan,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(VLK_407_Hakon) == FALSE)
	{
		CreateInvItems(VLK_407_Hakon,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(BAU_936_Rosi) == FALSE)
	{
		CreateInvItems(BAU_936_Rosi,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if((Npc_IsDead(VLK_468_Canthar) == FALSE) && (CANTHAR_AUSGELIEFERT2 == FALSE))
	{
		CreateInvItems(VLK_468_Canthar,ItWr_MinenAnteil_Mis,3);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	};
	SalandrilVerteilteMinenAnteil = SalandrilMinenAnteil_MAINCounter;
	Log_CreateTopic(TOPIC_MinenAnteile,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteile,"Кто-то продает фальшивые акции шахты и обогащается таким незаконным способом. Я должен найти того, кто продает эти акции торговцам. Серпентес хочет заполучить все эти поддельные документы.");
};

func void DIA_Serpentes_MinenAnteile_KillSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Кого я должен убить?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//О, Иннос. Никого, конечно же. Это дело требует изящности, ты, грубый мужлан.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Саландрил, алхимик из верхнего квартала, виновен в серьезном преступлении и его нужно наказать за это.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Однако он отказывается прибыть в монастырь для суда. Приведи его сюда.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Как ты сделаешь это, меня не волнует. Но ты, конечно же, будешь вознагражден.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Разве это не работа ополчения?",DIA_Serpentes_MinenAnteile_miliz);
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Нет проблем. Я сделаю это.",DIA_Serpentes_MinenAnteile_was_jaSLD);
};


var int MIS_Serpentes_BringSalandril_SLD;

func void DIA_Serpentes_MinenAnteile_was_jaSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//Нет проблем. Я сделаю это.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Хорошо. Мы ожидаем услышать от тебя новости через несколько дней.
	MIS_Serpentes_BringSalandril_SLD = LOG_Running;
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	Log_CreateTopic(TOPIC_MinenAnteile,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteile,"Я должен доставить Саландрила, алхимика из верхней части Хориниса, в монастырь для суда. Мне не особенно интересует, что он там натворил, пока мне хорошо платят за это.");
};


instance DIA_Serpentes_MinenAnteileBringen(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 2;
	condition = DIA_Serpentes_MinenAnteileBringen_Condition;
	information = DIA_Serpentes_MinenAnteileBringen_Info;
	permanent = TRUE;
	description = "Насчет поддельных акций...";
};


func int DIA_Serpentes_MinenAnteileBringen_Condition()
{
	if((MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_HasItems(other,ItWr_MinenAnteil_Mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int SerpentesMinenAnteilCounter;

func void DIA_Serpentes_MinenAnteileBringen_Info()
{
	var int SerpentesMinenAnteilCount;
	var int XP_BringSerpentesMinenAnteils;
	var int SerpentesMinenAnteilOffer;
	var int SerpentesMinenAnteilGeld;
	var string MinenAnteilText;
	var string MinenAnteilLeft;
	SerpentesMinenAnteilCount = Npc_HasItems(other,ItWr_MinenAnteil_Mis);
	SerpentesMinenAnteilOffer = 200;
	if(SerpentesMinenAnteilCount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Я смог найти акции шахт.
		B_GivePlayerXP(XP_BringSerpentesMinenAnteil);
		B_GiveInvItems(other,self,ItWr_MinenAnteil_Mis,1);
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Я смог найти несколько акций шахт.
		B_GiveInvItems(other,self,ItWr_MinenAnteil_Mis,SerpentesMinenAnteilCount);
		XP_BringSerpentesMinenAnteils = SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil;
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount;
		B_GivePlayerXP(XP_BringSerpentesMinenAnteils);
	};
	SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
	MinenAnteilLeft = IntToString(SalandrilMinenAnteil_MAINCounter);
	MinenAnteilText = ConcatStrings(MinenAnteilLeft,PRINT_NumberLeft);
	AI_Print(MinenAnteilText);

	if(SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Очень хорошо. Ты должен изъять из обращения все акции. Это отрава для наших людей. Принеси их все мне.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Вот. Это компенсирует твои расходы.
	}
	else if(SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Это все акции, как мне кажется.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Отлично. Ты заслужил награду.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Возьми этот защитный амулет. Он поможет тебе пройти по пути, который еще только ожидает тебя.
		CreateInvItems(self,ItAm_Prot_Mage_01,1);
		B_GiveInvItems(self,other,ItAm_Prot_Mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//Это действительно последняя акция, да?
	};
	SerpentesMinenAnteilGeld = SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer;
	CreateInvItems(self,ItMi_Gold,SerpentesMinenAnteilGeld);
	B_GiveInvItems(self,other,ItMi_Gold,SerpentesMinenAnteilGeld);
};


instance DIA_Serpentes_GOTSalandril(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 32;
	condition = DIA_Serpentes_GOTSalandril_Condition;
	information = DIA_Serpentes_GOTSalandril_Info;
	description = "Я знаю, кто ввел эти акции в обращение.";
};


func int DIA_Serpentes_GOTSalandril_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOTSalandril_Info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Я знаю, кто ввел эти акции в обращение. Это Саландрил, алхимик из верхнего квартала города.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Тогда приведи его сюда. Нам есть, что обсудить с ним.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_SalandrilHERE(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilHERE_Condition;
	information = DIA_Serpentes_SalandrilHERE_Info;
	description = "Саландрил здесь, в монастыре.";
};


func int DIA_Serpentes_SalandrilHERE_Condition()
{
	if(Npc_GetDistToWP(Salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};

func void DIA_Serpentes_SalandrilHERE_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Саландрил здесь, в монастыре.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Отлично. Мы разберемся с ним позже.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Вот твоя награда. И никому ни слова об этом, понятно?
		CreateInvItems(self,ItMi_Gold,400);
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_SalandrilInKloster);
};


instance DIA_Serpentes_SalandrilDEAD(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilDEAD_Condition;
	information = DIA_Serpentes_SalandrilDEAD_Info;
	description = "Саландрил мертв.";
};


func int DIA_Serpentes_SalandrilDEAD_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_Serpentes_BringSalandril_SLD == LOG_Running))) && Npc_IsDead(Salandril))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SalandrilDEAD_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Саландрил мертв.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Что ж, значит, его дела не остались безнаказанными. Да сжалится Иннос над его бедной душой.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_PICKPOCKET(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 900;
	condition = DIA_Serpentes_PICKPOCKET_Condition;
	information = DIA_Serpentes_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Serpentes_PICKPOCKET_Condition()
{
	return C_Beklauen(86,380);
};

func void DIA_Serpentes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET,Dialog_Back,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 70)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,50);
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

func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
};


instance DIA_SERPENTES_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = dia_serpentes_runemagicnotwork_condition;
	information = dia_serpentes_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_serpentes_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_serpentes_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Serpentes_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Serpentes_RuneMagicNotWork_01_01");	//Еще вчера я бы плюнул в лицо любому, кто сказал бы, что сегодня я не смогу сотворить магию. Но руны и вправду перестали меня слушаться!
	AI_Output(other,self,"DIA_Serpentes_RuneMagicNotWork_01_02");	//А что насчет остальных?
	AI_Output(self,other,"DIA_Serpentes_RuneMagicNotWork_01_03");	//Ты хочешь сказать, что я - один из лучших магов - единственный, кто этому подвергся? Если Я ничего не могу, другие и подавно не могут!
	AI_Output(other,self,"DIA_Serpentes_RuneMagicNotWork_01_04");	//Понятно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};

