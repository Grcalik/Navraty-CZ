
instance DIA_Addon_BDT_10027_Buddler_EXIT(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 999;
	condition = DIA_Addon_10027_Buddler_EXIT_Condition;
	information = DIA_Addon_10027_Buddler_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10027_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10027_Buddler_Hi(C_Info)
{
	npc = BDT_10027_Addon_Buddler;
	nr = 2;
	condition = DIA_Addon_10027_Buddler_Hi_Condition;
	information = DIA_Addon_10027_Buddler_Hi_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_10027_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//Как дела?
	if(Sklaven_Flucht == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//Я работаю на рудных баронов уже очень долго! Хорошо, что теперь работают другие.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Черт! Теперь нам снова придется копать самим?!
	};
};

