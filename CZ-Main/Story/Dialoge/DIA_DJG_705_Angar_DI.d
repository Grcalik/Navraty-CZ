
instance DIA_Angar_DI_EXIT(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 999;
	condition = DIA_Angar_DI_EXIT_Condition;
	information = DIA_Angar_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_DI_HALLO(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 10;
	condition = DIA_Angar_DI_HALLO_Condition;
	information = DIA_Angar_DI_HALLO_Info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int DIA_Angar_DI_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//Jak se máš?

	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_01");	//Od tý doby, co jsme na ostrově, je ta bolest čím dál tím nesnesitelnější.
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_02");	//Sakra! Už by to snad mohlo skončit.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_03");	//Nedělej si se mnou starosti. Prostě odsud vypadni.
	};
};

instance DIA_Angar_DI_ORKS(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_ORKS_Condition;
	information = DIA_Angar_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Angar_DI_ORKS_Condition()
{
	if((ORkSturmDI == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_ORKS_Info()
{
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_00");	//Měli bychom sebou zatraceně mrsknout. Další skřetí útok nás bude stát život.
	AI_Output(other,self,"DIA_Angar_DI_ORKS_15_01");	//Dělám, co můžu.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_02");	//To nestačí.
	Info_ClearChoices(DIA_Angar_DI_ORKS);
	Info_AddChoice(DIA_Angar_DI_ORKS,"Klídek.",DIA_Angar_DI_ORKS_no);
	Info_AddChoice(DIA_Angar_DI_ORKS,"Tak mi pomoz...",DIA_Angar_DI_ORKS_follow);
};

func void DIA_Angar_DI_ORKS_follow()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_follow_15_00");	//Tak mi pomoz a přestaň skučet.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_follow_04_01");	//Jo. Jdi první. Hni se!
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"FollowDI");
	Angar_DI_Party = LOG_Running;
};

func void DIA_Angar_DI_ORKS_no()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_no_15_00");	//Klídek.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_no_04_01");	//To se ti snadno řekne. Nejspíš se tady z toho zblázním.
	AI_StopProcessInfos(self);
};


instance DIA_Angar_DI_FOLLOW(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOW_Condition;
	information = DIA_Angar_DI_FOLLOW_Info;
	permanent = TRUE;
	description = "Zůstaň vzadu.";
};


func int DIA_Angar_DI_FOLLOW_Condition()
{
	if(Angar_DI_Party == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOW_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_00");	//Zůstaň vzadu.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_01");	//O zbytek se postarám sám.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//Hodně štěstí.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		Angar_DI_Party = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//Jasná věc.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"Start");
		}
		else if(Npc_IsDead(FireDragonIsland))
		{
			Npc_ExchangeRoutine(self,"FireDragonIsland");
		}
		else if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		else if(Npc_IsDead(Troll_DI))
		{
			Npc_ExchangeRoutine(self,"Troll_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	Angar_DI_Party = LOG_OBSOLETE;
};


instance DIA_Angar_DI_FOLLOWAGAIN(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information = DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent = TRUE;
	description = "Pojď za mnou.";
};


func int DIA_Angar_DI_FOLLOWAGAIN_Condition()
{
	if(Angar_DI_Party == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOWAGAIN_15_00");	//Pojď za mnou.
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWAGAIN_04_01");	//Jdi první.
	Angar_DI_Party = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowDI");
};


instance DIA_Angar_DI_FOLLOWSTOP(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWSTOP_Condition;
	information = DIA_Angar_DI_FOLLOWSTOP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Angar_DI_FOLLOWSTOP_Condition()
{
	if((Angar_DI_Party == LOG_Running) && (((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON") < 3000) && (Npc_IsDead(FireDragonIsland) == FALSE)) || (Npc_GetDistToWP(self,"SKELETTE") < 3000)))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info()
{
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWSTOP_04_00");	//Aaaa! Ta bolest mě přivádí k šílenství!
};


instance DIA_Angar_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 2;
	condition = DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Angar_DI_UNDEADDRGDEAD_Info;
	description = "Dostal ses z toho.";
};


func int DIA_Angar_DI_UNDEADDRGDEAD_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_00");	//Dostal ses z toho.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_01");	//Můžeme už odsud konečně vypadnout?
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_02");	//Jo. Nepřítel byl poražen.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_03");	//Tak to nesmíme dál ztrácet čas. Zajdi kapitánovi říct, aby zvednul kotvy.
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_04");	//Doufám, že vás, odpadlých členů sekty, není víc.
		AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_05");	//Všechno je možné. I když Pátrači byli velmi důkladní. Dokonce málem dostali i mě. Kdo ví?
	};
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_06");	//Co budeš dělat dál?
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_07");	//Možná se usadím na venkově a začnu farmařit. Válčení už mě dost unavuje.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_DI_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 900;
	condition = DIA_Angar_DI_PICKPOCKET_Condition;
	information = DIA_Angar_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(47,45);
};

func void DIA_Angar_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET,Dialog_Back,DIA_Angar_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_DI_PICKPOCKET_DoIt);
};

func void DIA_Angar_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};

func void DIA_Angar_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};


instance DIA_Angar_DI_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 7;
	condition = DIA_Angar_DI_FOUNDAMULETT_Condition;
	information = DIA_Angar_DI_FOUNDAMULETT_Info;
	description = "Našel jsem tvůj amulet.";
};

func int DIA_Angar_DI_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};