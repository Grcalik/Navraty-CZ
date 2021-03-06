
instance DIA_Borka_EXIT(C_Info)
{
	npc = VLK_434_Borka;
	nr = 999;
	condition = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Borka_PICKPOCKET(C_Info)
{
	npc = VLK_434_Borka;
	nr = 900;
	condition = DIA_Borka_PICKPOCKET_Condition;
	information = DIA_Borka_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Borka_PICKPOCKET_Condition()
{
	return C_Beklauen(80,120);
};

func void DIA_Borka_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
	Info_AddChoice(DIA_Borka_PICKPOCKET,Dialog_Back,DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Borka_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};

func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};


instance DIA_Borka_PISSOFF(C_Info)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_PISSOFF_Condition;
	information = DIA_Borka_PISSOFF_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Borka_PISSOFF_Condition()
{
	if((Knows_Borka_Dealer != TRUE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Wld_IsTime(17,0,9,0) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Borka_PISSOFF_Info()
{
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_00");	//Hej, ty! Jak se vede? Nezáleží na tom, co máš v plánu - na to bude dost času později.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_01");	//Stojíš přímo před perlou Khorinisu - ČERVENOU LUCERNOU. Je to ten nejkrásnější nevěstinec v celé Myrtaně, to si piš!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_02");	//Kotví tu námořníci ze všech koutů země, jen aby tu mohli strávit pár nocí.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_03");	//A teď máš tuhle šanci - ne, čest - právě ty! Můžeš strávit noc s Nadjou, nejvášnivějším květem, jaký kdy bohové stvořili!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_04");	//Pojď dál a užij si to, o čem se jiným ani nesnilo!
};


instance DIA_Borka_TROUBLE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_TROUBLE_Condition;
	information = DIA_Borka_TROUBLE_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Borka_TROUBLE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Andre_REDLIGHT != LOG_SUCCESS) && (Wld_IsTime(17,0,9,0) == TRUE) && (Npc_IsDead(Nadja) == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Borka_TROUBLE_Info()
{
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_00");	//Proč postáváš takhle stranou? Pojď dál a uvidíš naši vášnivou Nadju.
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_01");	//Plameny, které v tobě tahle noční bytost zažehne, dají tvému životu nový smysl!
};


instance DIA_BORKA_HELLO(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_hello_condition;
	information = dia_borka_hello_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_borka_hello_condition()
{
	return TRUE;
};

func void dia_borka_hello_info()
{
	AI_Output(other,self,"DIA_Borka_Hello_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Borka_Hello_01_01");	//Borka. Pracuji v tomto bordelu. Máš ještě nějakej dotaz?
	AI_Output(other,self,"DIA_Borka_Hello_01_02");	//Myslím, že na to jsem se neptal...
	AI_Output(self,other,"DIA_Borka_Hello_01_03");	//Tak jdi dovnitř, nebo vypadni, protože nemám čas na kecání.
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_WHATNEW(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_whatnew_condition;
	information = dia_borka_whatnew_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_borka_whatnew_condition()
{
	if(Npc_KnowsInfo(hero,dia_borka_hello))
	{
		return TRUE;
	};
};

func void dia_borka_whatnew_info()
{
	AI_Output(other,self,"DIA_Borka_WhatNew_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Borka_WhatNew_01_01");	//Špatně! A neotravuj!... (naštvaně)
	AI_StopProcessInfos(self);
};


instance DIA_Borka_Smoke(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_Smoke_Condition;
	information = DIA_Borka_Smoke_Info;
	permanent = TRUE;
	description = "Nevíš, kde bych si mohl koupit nějaké kuřivo - trávu nebo něco takového?";
};


func int DIA_Borka_Smoke_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_Smoke_Info()
{
	AI_Output(other,self,"DIA_Borka_Smoke_15_00");	//Nevíš, kde bych si mohl koupit nějaké kuřivo - trávu nebo něco takového?
	AI_Output(self,other,"DIA_Borka_Smoke_11_01");	//Ne, jdi do hajzlu!
	AI_StopProcessInfos(self);
};


instance DIA_Borka_BUYHERB(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_BUYHERB_Condition;
	information = DIA_Borka_BUYHERB_Info;
	permanent = TRUE;
	description = "Slyšel jsem, že prodáváš drogy.";
};


func int DIA_Borka_BUYHERB_Condition()
{
	if((Knows_Borka_Dealer == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running) && (Borka_Deal == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Borka_BUYHERB_15_00");	//Slyšel jsem, že prodáváš drogy.

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_01");	//Omlouvám se, pane strážný. To musí být nějaká mýlka, o žádných drogách nic nevím.
	}
	else
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_02");	//To říká kdo?
		Info_ClearChoices(DIA_Borka_BUYHERB);
		Info_AddChoice(DIA_Borka_BUYHERB,"To sem nepatří.",DIA_Borka_BUYHERB_Egal);
		Info_AddChoice(DIA_Borka_BUYHERB,"Nadja.",DIA_Borka_BUYHERB_Nadja);
	};
};

func void DIA_Borka_BUYHERB_Egal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Egal_15_00");	//To sem nepatří.
	AI_Output(self,other,"DIA_Borka_BUYHERB_Egal_11_01");	//Jenom chci vědět, kdo tě posílá, abych měl jistotu, že jsi v pořádku.
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Info_AddChoice(DIA_Borka_BUYHERB,"Nadja.",DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice(DIA_Borka_BUYHERB,"Tak chceš uzavřít obchod, nebo ne?",DIA_Borka_BUYHERB_Deal);
};

func void DIA_Borka_BUYHERB_Nadja()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_NADJA_15_00");	//Nadja.
	AI_Output(self,other,"DIA_Borka_BUYHERB_NADJA_11_01");	//Co ty víš - ptáček si prostě zaštěbetal. Nemůžeš věřit všemu, co ti ta holka nakuká.
	Nadja_Victim = TRUE;
	Undercover_Failed = TRUE;
	Info_ClearChoices(DIA_Borka_BUYHERB);
};

func void DIA_Borka_BUYHERB_Deal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Deal_15_00");	//Tak chceš uzavřít obchod, nebo ne?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_BUYHERB_Deal_11_01");	//No dobře... tak tedy budeme obchodovat. Dej mi 50 zlatých a já ti je vyměním za drogu. A žádné smlouvání.
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};


instance DIA_Borka_SECOND_CHANCE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_SECOND_CHANCE_Condition;
	information = DIA_Borka_SECOND_CHANCE_Info;
	permanent = TRUE;
	description = "Tak dobře, tady je to zlato.";
};

func int DIA_Borka_SECOND_CHANCE_Condition()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if((Borka_Deal == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 50) && (Hlp_IsItem(heroArmor,ITAR_Mil_L) == FALSE) && (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_SECOND_CHANCE_Info()
{
	AI_Output(other,self,"DIA_Borka_SECOND_CHANCE_15_00");	//Tak dobře, tady je to zlato.
	B_GiveInvItems(hero,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//Dobrá...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_02");	//... tady je čerstvý, pryskyřicí vylepšený joint.
	B_GiveInvItems(self,hero,ItMi_Joint,1);
	Borka_Deal = 2;
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_FUCKOFF(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = dia_borka_fuckoff_condition;
	information = dia_borka_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_borka_fuckoff_condition()
{
	if((MIS_Andre_REDLIGHT == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_borka_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

