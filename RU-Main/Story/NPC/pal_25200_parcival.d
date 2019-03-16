
instance PAL_25200_PARCIVAL(Npc_Default)
{
	name[0] = "Парсиваль";
	guild = GIL_PAL;
	id = 25200;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ITKE_TWOSTORE,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_Tough_Drago,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_25200;
};


func void rtn_start_25200()
{
	TA_Stand_Guarding(8,0,21,0,"PLFT_PERCIVAL");
	TA_Stand_Guarding(21,0,8,0,"PLFT_PERCIVAL");
};

func void rtn_tot_25200()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

