
instance PAL_9118_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9118;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Weak_Cipher_alt,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9118;
};


func void rtn_start_9118()
{
	TA_Stand_Eating(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_02");
	TA_Sleep(21,0,8,0,"LGR_HAUS06_03");
};

func void rtn_tot_9118()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

