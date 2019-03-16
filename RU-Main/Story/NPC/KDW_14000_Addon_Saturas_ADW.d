
instance KDW_14000_Addon_Saturas_ADW(Npc_Default)
{
	name[0] = "Сатурас";
	guild = GIL_KDW;
	id = 14000;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Saturas,BodyTex_B,ItAr_KDW_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_PreStart_14000;
};


func void Rtn_PreStart_14000()
{
	TA_Study_WP(8,25,21,35,"ADW_SATURAS_START");
	TA_Study_WP(21,35,8,25,"ADW_SATURAS_START");
};

func void Rtn_Start_14000()
{
	TA_Study_WP(8,25,9,35,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP(9,35,10,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP(10,45,11,55,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP(11,55,12,5,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP(12,5,13,15,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP(13,15,14,25,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP(14,25,15,35,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP(15,35,16,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP(16,45,17,55,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP(17,55,18,5,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Sit_Bench(18,5,19,15,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(19,15,20,25,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(20,25,21,35,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(21,35,22,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(22,45,1,15,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(1,15,3,25,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(3,25,5,35,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP(5,35,7,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench(7,45,8,25,"ADW_ENTRANCE_BUILDING2_02A");
};

func void rtn_golddragon_14000()
{
	TA_Study_WP(8,25,21,35,"ADW_SATURAS_2_GOLDDRAGON");
	TA_Study_WP(21,35,8,25,"ADW_SATURAS_2_GOLDDRAGON");
};

func void rtn_orcinvasion_14000()
{
	TA_Stand_Guarding(8,25,21,35,"ADW_PORTALTEMPEL_01");
	TA_Stand_Guarding(21,35,8,25,"ADW_PORTALTEMPEL_01");
};

func void rtn_waterritual_14000()
{
	ta_waterritual(8,0,20,0,"ADW_ADANOSTEMPEL_RAVEN_05");
	ta_waterritual(20,0,8,0,"ADW_ADANOSTEMPEL_RAVEN_05");
};

func void rtn_waittempel_14000()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"ADW_ADANOSTEMPEL_RAVEN_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"ADW_ADANOSTEMPEL_RAVEN_01");
};

func void rtn_tot_14000()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

