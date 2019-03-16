
instance PAL_9111_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9111;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9111;
};


func void rtn_start_9111()
{
	TA_Smalltalk(6,0,22,0,"LGR_ZUMBANVIERTEL_01");
	TA_Sleep(22,0,6,0,"LGR_HAUS01_05");
};

func void rtn_tot_9111()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

