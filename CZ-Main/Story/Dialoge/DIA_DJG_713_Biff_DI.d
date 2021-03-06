
instance DIA_Biff_DI_EXIT(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 999;
	condition = DIA_Biff_DI_EXIT_Condition;
	information = DIA_Biff_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_HALLO(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 10;
	condition = DIA_Biff_DI_HALLO_Condition;
	information = DIA_Biff_DI_HALLO_Info;
	important = TRUE;
};


func int DIA_Biff_DI_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_HALLO_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_00");	//Kde je to bohatství, cos mi sliboval?
	if(Npc_KnowsInfo(other,DIA_Biff_DI_ORKS) == FALSE)
	{
		AI_Output(other,self,"DIA_Biff_DI_HALLO_15_01");	//A co jsem říkal předtím, ještě na moři?
	};
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_02");	//Teď tady máš hlídat loď.
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_03");	//Nerad bych celou cestu nazpátek plaval.
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_04");	//Sakra. Kdybych to byl věděl, zůstal bych raděj v Khorinisu.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_perm(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_perm_Condition;
	information = DIA_Biff_DI_perm_Info;
	permanent = TRUE;
	description = "Na palubě všechno v pořádku?";
};


func int DIA_Biff_DI_perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Biff_DI_HALLO) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_perm_Info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//Na palubě všechno v pořádku?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(podrážděně) Jo, jo. Je tu klid.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_ORKS(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_ORKS_Condition;
	information = DIA_Biff_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Biff_DI_ORKS_Condition()
{
	if((Npc_GetDistToWP(self,"DI_SHIP_03") < 1000) && (ORkSturmDI == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_ORKS_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_00");	//Ty zavšivený bestie!
	AI_Output(other,self,"DIA_Biff_DI_ORKS_15_01");	//Co tady nahoře ksakru děláš? Měls hlídat loď.
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_02");	//Ta se jen tak nepotopí, chlape.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Biff_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 4;
	condition = DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important = TRUE;
};


func int DIA_Biff_DI_UNDEADDRGDEAD_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_00");	//A bylo to tak?
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_01");	//Je to tak teď.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_02");	//Můžu teď...
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_03");	//Můžeš vyrabovat celej ostrov, když na to přijde.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_04");	//Skvělý.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PlunderTempel");
};


instance DIA_Biff_DI_plunder(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_plunder_Condition;
	information = DIA_Biff_DI_plunder_Info;
	important = TRUE;
};


func int DIA_Biff_DI_plunder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Biff_DI_plunder) && (UndeadDragonIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_plunder_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_plunder_07_00");	//Sakra! Teď ne.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_PICKPOCKET(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 900;
	condition = DIA_Biff_DI_PICKPOCKET_Condition;
	information = DIA_Biff_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Biff_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(92,450);
};

func void DIA_Biff_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET,Dialog_Back,DIA_Biff_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Biff_DI_PICKPOCKET_DoIt);
};

func void DIA_Biff_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

func void DIA_Biff_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

