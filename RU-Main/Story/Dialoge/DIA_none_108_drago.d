
instance DIA_NONE_108_DRAGO_EXIT(C_Info)
{
	npc = none_108_drago;
	nr = 999;
	condition = dia_none_108_drago_exit_condition;
	information = dia_none_108_drago_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_none_108_drago_exit_condition()
{
	return TRUE;
};

func void dia_none_108_drago_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_108_DRAGO_HALLO(C_Info)
{
	npc = none_108_drago;
	nr = 1;
	condition = dia_none_108_drago_hallo_condition;
	information = dia_none_108_drago_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_none_108_drago_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_none_108_drago_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self,"DIA_NONE_108_Drago_HALLO_01_00");	//Приветствую тебя, маг!
	AI_Output(self,other,"DIA_NONE_108_Drago_HALLO_01_01");	//Да пребудет с тобой Иннос...(мертвым голосом) Что тебе нужно от меня?
	AI_Output(other,self,"DIA_NONE_108_Drago_HALLO_01_02");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_NONE_108_Drago_HALLO_01_03");	//Боюсь, я ничем не смогу тебе помочь...
	AI_Output(self,other,"DIA_NONE_108_Drago_HALLO_01_04");	//Обратись лучше к мастеру Корристо. Возможно, он выслушает твою просьбу.
	AI_StopProcessInfos(self);
};

