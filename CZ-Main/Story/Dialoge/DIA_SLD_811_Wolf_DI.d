
instance DIA_Wolf_DI_EXIT(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 999;
	condition = DIA_Wolf_DI_EXIT_Condition;
	information = DIA_Wolf_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wolf_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_DI_HALLO(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 4;
	condition = DIA_Wolf_DI_HALLO_Condition;
	information = DIA_Wolf_DI_HALLO_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Wolf_DI_HALLO_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_HALLO_OneTime;

func void DIA_Wolf_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_00");	//Jak se vede?
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(Bennet_DI) == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//Tos MUSEL brát s sebou Benneta, chlape?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//V čem je problém?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//Ále, vlastně nic. Jen si udělej, co myslíš že je správné.
	}
	else if(DIA_Wolf_DI_HALLO_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//Tahle kovárna není zrovna nejlepší, ale myslím, že ji trochu vyzkouším.
		B_GivePlayerXP(XP_Ambient);
		DIA_Wolf_DI_HALLO_OneTime = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//Mohl bys mi ukout nějakou zbroj?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//Je mi líto, chlape, ale s tímhle nářadím nic nepořídím. To bude muset počkat, až dorazíme na pevninu.
	};
};


instance DIA_Wolf_DI_Training(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 10;
	condition = DIA_Wolf_DI_Training_Condition;
	information = DIA_Wolf_DI_Training_Info;
	permanent = TRUE;
	description = "Vycvič mě prosím v boji na dálku.";
};


func int DIA_Wolf_DI_Training_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_DI_Training_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Uč mě střílet.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//S čím?
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//Luk je na rozdíl od kuše dost neskladný, a proto vyžaduje spoustu místa. Vždycky si proto dávej pozor, abys měl při boji okolo sebe dostatek volného prostoru.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Při výstřelu ti musí tětiva v prstech klouzat - když ji budeš držet křečovitě, můžeš tím šíp úplně vychýlit z dráhy.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Zkus nestřílet proti větru, počkej až přejde.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Chytrý kušiník si také všímá, kudy zrovna vane vítr, a nesnaží se střílet přímo proti němu.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_Training);
};


instance DIA_Wolf_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 2;
	condition = DIA_Wolf_DI_UndeadDragonDead_Condition;
	information = DIA_Wolf_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int DIA_Wolf_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_UndeadDragonDead_OneTime;

func void DIA_Wolf_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//Jasně. A co ty? Bylo to drsné, co?
	if(DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//Kam teď půjdeš?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//Kamkoliv, jen ne zpátky. Khorinisu už mám plné zuby.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//Je jedno kam poplujeme, jenom když odsud konečně vypadneme.
		DIA_Wolf_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_DI_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 900;
	condition = DIA_Wolf_DI_PICKPOCKET_Condition;
	information = DIA_Wolf_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wolf_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(32,45);
};

func void DIA_Wolf_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET,Dialog_Back,DIA_Wolf_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_DI_PICKPOCKET_DoIt);
};

func void DIA_Wolf_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

func void DIA_Wolf_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

