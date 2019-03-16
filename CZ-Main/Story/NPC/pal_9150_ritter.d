
instance PAL_9150_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9150;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal08,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_9150;
};


func void rtn_start_9150()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"LGR_SCHWERTT_03");
	TA_Stand_ArmsCrossed(21,0,8,0,"LGR_SCHWERTT_03");
};

func void rtn_tot_9150()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

