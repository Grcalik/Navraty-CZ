
instance DIA_Addon_AlligatorJack_Exit(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 999;
	condition = DIA_Addon_AlligatorJack_Exit_Condition;
	information = DIA_Addon_AlligatorJack_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;
};


var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;

func void DIA_Addon_AlligatorJack_Exit_Info()
{
	if((MIS_KrokoJagd == LOG_SUCCESS) && (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//Если я тебе понадоблюсь, ты сможешь найти меня у моего лагеря рядом с частоколом.
		if(PIR_1354_Addon_Henry.aivar[AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Частоколом?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//Продолжай идти на запад, и ты увидишь, о чем я говорю.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_AlligatorJack_PICKPOCKET(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 900;
	condition = DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information = DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	return C_Beklauen(100,333);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,Dialog_Back,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};


instance DIA_Addon_AlligatorJack_Hello(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Hello_Condition;
	information = DIA_Addon_AlligatorJack_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_Hello_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//Кто, черт возьми, ты такой? Ты не похож на остальных.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//Каких еще остальных?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Ну, магов, которые здесь обосновались.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Ты ведь из их компании, так?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//Довольно смело с твоей стороны разгуливать здесь в одиночку.
};


instance DIA_Addon_AlligatorJack_WerBistDu(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information = DIA_Addon_AlligatorJack_WerBistDu_Info;
	description = "Кто ты?";
};


func int DIA_Addon_AlligatorJack_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Кто ты такой?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//Уверен, ты обо мне слышал.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(гордо) Я - Аллигатор Джек.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Меня боятся моряки всей страны. Я - один из самых опасных пиратов в этих водах.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Вместе с капитаном Грэгом мы ограбили больше купеческих кораблей, чем я могу сосчитать.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//Так что сейчас ты разговариваешь с живой легендой.
};


instance DIA_Addon_AlligatorJack_Vorschlag(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information = DIA_Addon_AlligatorJack_Vorschlag_Info;
	description = "Ты знаешь человека по имени Ворон?";
};


func int DIA_Addon_AlligatorJack_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Ты знаешь человека по имени Ворон?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Конечно. Он командует бандитами, живущими на востоке.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//А что тебе от него надо?
	B_LogEntry(TOPIC_Addon_RavenKDW,"Ворона и его бандитов можно найти в восточной части долины.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"Я хочу присоединиться к Ворону.",DIA_Addon_AlligatorJack_Vorschlag_join);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"Я должен убить Ворона.",DIA_Addon_AlligatorJack_Vorschlag_tot);
};

func void B_AlligatorJack_Besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//Ладно, у меня к тебе есть лучшее предложение.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//Присоединяйся к нам.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//У тебя будет время все обдумать.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//А когда ты попробуешь наш ром, у тебя поменяются взгляды на жизнь.
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
};

func void DIA_Addon_AlligatorJack_Vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//Я должен убить Ворона.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(смеется) Что? Ты? И как же ты собираешься это сделать?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Разве он тебе по силам?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//Ты к нему и близко не подойдешь. Его бандиты с тебя живьем шкуру сдерут.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//Ты даже через первый их пост не пройдешь.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_05");	//Выглядишь ты так, что у них при виде тебя сразу руки зачешутся.
	B_AlligatorJack_Besser();
};

func void DIA_Addon_AlligatorJack_Vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//Я хочу присоединиться к Ворону.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//Действительно?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//А выглядишь ты не так, как человек, готовый присоединиться к этому отребью.
	B_AlligatorJack_Besser();
};


instance DIA_Addon_AlligatorJack_BDTRuestung(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information = DIA_Addon_AlligatorJack_BDTRuestung_Info;
	description = "Мне нужны доспехи бандитов.";
};


func int DIA_Addon_AlligatorJack_BDTRuestung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Vorschlag) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//Мне нужны бандитские доспехи.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//Зачем это они тебе понадобились?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//Если тебя в них увидят, ты можешь попасть в беду.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Тебя примут за бандита и попытаются убить.
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"Ты не знаешь, где мне найти такие доспехи?",DIA_Addon_AlligatorJack_BDTRuestung_wo);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"Звучит неплохо...",DIA_Addon_AlligatorJack_BDTRuestung_gut);
};

func void DIA_Addon_AlligatorJack_BDTRuestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//Звучит неплохо...
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Да, для того, кто задумал покончить жизнь самоубийством.
};

func void DIA_Addon_AlligatorJack_BDTRuestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//Ты не знаешь, где мне найти такие доспехи?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//У нас в пиратском лагере был один комплект.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//Не знаю, остался ли он до сих пор.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"У пиратов должны быть доспехи бандитов. Но Аллигатор Джек не может сказать мне, так ли это.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
};


instance DIA_Addon_AlligatorJack_Greg(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Greg_Condition;
	information = DIA_Addon_AlligatorJack_Greg_Info;
	description = "Вашего капитана зовут Грэг?";
};


func int DIA_Addon_AlligatorJack_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Вашего капитана зовут Грэг?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Да. И это самый величайший пират, когда-либо бороздивший море.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//Думаю, я знаю вашего капитана. Я встречал его в Хоринисе.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(смеется) Грэга? В Хоринисе? Чепуха!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Грэг с частью команды отправился в море за добычей.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//В Хоринис он может попасть только на королевской тюремной галере.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//Это же один из самых известных преступников в стране.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//Он ни за что не зайдет в город по своей воле. Первый же стражник задержит его и бросит в тюрьму.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//Ну, если ты так говоришь...
};


instance DIA_Addon_AlligatorJack_PIRLager(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_PIRLager_Condition;
	information = DIA_Addon_AlligatorJack_PIRLager_Info;
	description = "Где находится ваш лагерь?";
};


func int DIA_Addon_AlligatorJack_PIRLager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Где находится ваш лагерь?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//Видишь этот проход? Иди через него и направляйся на запад. Рано или поздно ты дойдешь до нашего берега.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//Там и стоят наши дома.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//Я мог бы тебя проводить, но ты должен оказать мне одну услугу.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//Какую же?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//Прежде чем возвращаться в лагерь, я должен добыть ребятам еды.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//Судя по виду, ты сильный человек.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//Ты мог бы помочь мне охотиться. Согласен?
	Log_CreateTopic(TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RatHunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_RatHunt,"Аллигатору Джеку нужна помощь в охоте.");
};


instance DIA_Addon_AlligatorJack_WasJagen(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WasJagen_Condition;
	information = DIA_Addon_AlligatorJack_WasJagen_Info;
	description = "На кого ты охотишься?";
};


func int DIA_Addon_AlligatorJack_WasJagen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//На кого ты охотишься?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Чаще всего на аллигаторов. Но их мясо несъедобно.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//К тому же их здесь уже не осталось.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//Поэтому мне приходится ловить болотных крыс.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Что?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//Мясо большинства местных зверей либо имеет вкус старых носков, либо жесткое, как подметки.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Более-менее съедобно только мясо этих жирных болотных крыс.
	B_LogEntry(TOPIC_Addon_RatHunt,"Единственное животное здесь, мясо которого можно есть, - это болотная крыса.");
};


instance DIA_Addon_AlligatorJack_Pirates(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Pirates_Condition;
	information = DIA_Addon_AlligatorJack_Pirates_Info;
	permanent = FALSE;
	description = "Расскажи мне больше о пиратах.";
};


func int DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//Расскажи мне больше о пиратах.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//Мы живем здесь уже много лет. До начала войны нас знали везде, от Хориниса до континента.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Один вид нашего флага вселял ужас в сердца матросов на торговых кораблях.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//Но те времена прошли. Уже несколько недель нам не встречались корабли с добычей.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Капитан Грэг с горсткой людей отправился на поиски кораблей.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//А остальные просто сидят в лагере и ждут, когда он вернется.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//Надеюсь, он привезет солидный куш.
};


instance DIA_Addon_AlligatorJack_LetsGoHunting(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information = DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent = TRUE;
	description = "Пойдем на охоту.";
};


func int DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if((MIS_KrokoJagd == FALSE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WasJagen) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Пойдем на охоту.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//Отлично. Вдвоем мы с легкостью с этим справимся.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Ты готов?
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Еще нет.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Да.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};


const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;

func void DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Да.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Прекрасно. Держись рядом со мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	MIS_KrokoJagd = LOG_Running;
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Еще нет.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Давай быстрее.
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter1(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Низины.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//Здесь эти крысы водятся.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//Следуй за мной.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


instance DIA_Addon_AlligatorJack_TheHunt(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_TheHunt_Condition;
	information = DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TheHunt_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Kessel) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//Этого я и боялся.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Чего?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//Здесь только половина от того количества дичи, что нам нужно.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Теперь нам придется отправиться в каньон.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//Будь осторожен. Углубляться в каньон крайне опасно.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//Если тебе дорога жизнь, не отходи от меня.
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"А что там, в каньоне?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"Хорошо, пойдем.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

func void DIA_Addon_AlligatorJack_TheHunt_Enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//А что там, в каньоне?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//Мы стараемся избегать этого места.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//Там живут бритвозубы. Мерзкие твари. Если хочешь жить - держись от них подальше.
};

func void DIA_Addon_AlligatorJack_TheHunt_Running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Хорошо, пойдем.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//Замечательно.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter2(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Вперед.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};


instance DIA_Addon_AlligatorJack_HuntEnd(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information = DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_HuntEnd_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Canyon) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info()
{
	if(AlligatorJack_KrokosKilled == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Не напомнишь мне, зачем я тебя взял?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//Ты не убил ни одной болотной крысы!
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Ну ладно. Возможно, из тебя и выйдет какой-нибудь толк.
	}
	else if(AlligatorJack_KrokosKilled == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Неплохо. Такой человек, как ты, может нам пригодиться.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//На первой же охоте ты добыл одного зверя. Очень хорошо.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//А ты - хороший охотник.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//Боги! Если ты и дальше будешь так охотиться, в следующий раз я смогу остаться в лагере.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//Отнеси это мясо болотных крыс старому лентяю Моргану.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//Ты найдешь его в нашем лагере.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//Он наверняка нежится на солнышке. Отдай ему мясо, он ждет.
	if(PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//Вход в лагерь обычно охраняет Генри. Его задача - не пропускать бандитов.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//Если он откажется тебя впустить, скажи, что послал тебя я.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//Возможно, это сделает его более сговорчивым.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Генри иногда увлекается ролью начальника...
	};
	MIS_AlligatorJack_BringMeat = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_Addon_BringMeat,"Аллигатор Джек дал мне десять кусков мяса. Я должен передать их Моргану.");
	B_LogEntry_Quiet(TOPIC_Addon_RatHunt,"Охота была удачной. Мы убили несколько болотных крыс.");
	B_GiveInvItems(self,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_KrokoJagd);
};


instance DIA_Addon_AlligatorJack_Angus(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Angus_Condition;
	information = DIA_Addon_AlligatorJack_Angus_Info;
	permanent = FALSE;
	description = "Ты знаешь Ангуса и Хэнка?";
};


func int DIA_Addon_AlligatorJack_Angus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_AngusnHank) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Angus_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Ты знаешь Ангуса и Хэнка?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//Я их уже довольно давно не видел.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//И я не буду плакать, если эти бродяги и вовсе не вернутся.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Почему?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Эта парочка постоянно шатается у озера и пугает дичь.
};

instance DIA_Addon_AlligatorJack_Lake(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Lake_Condition;
	information = DIA_Addon_AlligatorJack_Lake_Info;
	permanent = FALSE;
	description = "Что это за озеро?";
};

func int DIA_Addon_AlligatorJack_Lake_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Angus) == TRUE) && (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//Что это за озеро?

	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Помнишь нашу охоту?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Да.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//Озеро в низине! Я постоянно их там встречал.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//Озеро в большой низине.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Иди от лагеря на восток. Не заметить низину невозможно.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//Там еще множество небольших водопадов.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//Будь внимателен - если у тебя под ногами нет ничего, кроме песка, значит, ты пропустил поворот и угодил в каньон.
	};
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Пещера должна быть в низине на востоке от лагеря, рядом с озером. Там, где мы охотились на крыс.");
};


instance DIA_Addon_AlligatorJack_CanLearn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_CanLearn_Condition;
	information = DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Addon_AlligatorJack_CanLearn_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE) || (GregIsBack == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//Ты можешь меня чему-нибудь научить?

	if(MIS_KrokoJagd > LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Конечно! Я хороший охотник и могу научить тебя снимать с животных шкуры и выдирать зубы.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//Если хочешь, я могу заняться твоим обучением.
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,"Аллигатор Джек может обучить меня снимать с животных шкуры и выдирать зубы. Кроме того, он может научить меня лучше стрелять из лука.");
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//Но сначала ты должен показать мне, что готов к жизни охотника.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//Я стану учить тебя только после того, как мы вместе сходим на охоту.
	};
};

func void B_AJ_Teach()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,Dialog_Back,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_addon_alligatorjack_teach_hp_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_addon_alligatorjack_teach_hp_5);

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforsmithhunt("Сдирать кожу рептилий.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),DIA_Addon_AlligatorJack_Teach_FUR);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforsmithhunt("Выдирать клыки.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_AlligatorJack_Teach_Teeth);
	};
};


instance DIA_Addon_AlligatorJack_Teach(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Teach_Condition;
	information = DIA_Addon_AlligatorJack_Teach_Info;
	permanent = TRUE;
	description = "Учи меня!";
};

func int DIA_Addon_AlligatorJack_Teach_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//Я готов учиться!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//Чему тебя научить?
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
};

func void DIA_Addon_AlligatorJack_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,75);
	B_AJ_Teach();
};

func void dia_addon_alligatorjack_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	B_AJ_Teach();
};

func void dia_addon_alligatorjack_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_FUR()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//Всегда делай разрез на животе, иначе ты испортишь шкуру.
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void B_AlliJack_AlliKlar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Хорошо...
};

instance DIA_Addon_AlligatorJack_Anheuern(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 11;
	condition = DIA_Addon_AlligatorJack_Anheuern_Condition;
	information = DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent = FALSE;
	description = "Пойдем на охоту.";
};

func int DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//Пойдем на охоту.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_AlligatorJack_ComeOn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 12;
	condition = DIA_Addon_AlligatorJack_ComeOn_Condition;
	information = DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_AlligatorJack_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//Присоединяйся ко мне.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_AlligatorJack_GoHome(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 13;
	condition = DIA_Addon_AlligatorJack_GoHome_Condition;
	information = DIA_Addon_AlligatorJack_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//Ты мне больше не нужен.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_AlligatorJack_TooFar(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 14;
	condition = DIA_Addon_AlligatorJack_TooFar_Condition;
	information = DIA_Addon_AlligatorJack_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

instance DIA_Addon_AlligatorJack_Croc(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Croc_Condition;
	information = DIA_Addon_AlligatorJack_Croc_Info;
	permanent = FALSE;
	description = "Почему тебя прозвали Аллигатором?";
};

func int DIA_Addon_AlligatorJack_Croc_Condition()
{
	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Croc_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_00");	//Почему тебя прозвали Аллигатором?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_01");	//Все произошло из-за случая, когда меня чуть не сожрал огромный аллигатор.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_02");	//Эта тварь так сильно покусала меня, что я чуть не умер! 
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_03");	//Но, к моему счастью, Сэмюэль сумел меня вылечить.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_04");	//Неужели ты не смог справиться с обычным крокодилом? 
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_05");	//Эх, парень. Это был не просто крокодил!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_06");	//Таких, как эта тварь, мне еще ни разу не приходилось видеть в своей жизни.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_07");	//Чешуя этого аллигатора была настолько прочной, что я своей сабелькой смог только немного оцарапать его.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_08");	//Мы прозвали его Скалозубом. И стараемся без необходимости больше не приближаться к озеру.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_09");	//Может быть, тогда поохотимся на него вдвоем?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_10");	//Ты что, головой тронулся? Лучше забудь об этом.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_11");	//Обычные стрелы и клинки не смогут причинить ему какого-либо вреда.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_12");	//А одного его укуса будет достаточно, чтобы отправить тебя на тот свет.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_13");	//Ну а если я все-таки захочу поохотится на него, где мне искать это чудовище?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_14");	//Порой его видят на отмели рядом с озером.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_15");	//Но ты точно псих, если задумал это сделать!
	MIS_Alligator = LOG_Running;
	Log_CreateTopic(TOPIC_Alligator,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alligator,LOG_Running);
	B_LogEntry(TOPIC_Alligator,"Аллигатор Джек рассказал мне историю о том, как его чуть не съел огромный аллигатор. Похоже, эта тварь очень сильна. Он обитает рядом где-то у озера в котловане.");
};

instance DIA_Addon_AlligatorJack_Croc_Done(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Croc_Done_Condition;
	information = DIA_Addon_AlligatorJack_Croc_Done_Info;
	permanent = FALSE;
	description = "Этот твой аллигатор мертв.";
};

func int DIA_Addon_AlligatorJack_Croc_Done_Condition()
{
	if((MIS_Alligator == LOG_Running) && (Npc_IsDead(ALLIGATOR_UNIQ) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Croc_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_Done_01_00");	//Этот твой аллигатор мертв.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_01");	//(недоверчиво) Ты что, шутишь, приятель?
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_Done_01_02");	//Если не веришь, можешь сам сходить и посмотреть. Его туша наверняка до сих пор лежит на берегу озера.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_04");	//Хммм. А ты храбрец! Уважаю таких.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_05");	//Что же, тогда мне стоит отблагодарить тебя за твою помощь.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_06");	//У меня при себе сейчас нет золота. Но с прошлой охоты тут осталась одна довольно неплохая шкура мракориса!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_07");	//Вот, можешь взять ее.
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	MIS_Alligator = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Alligator,LOG_SUCCESS);
	B_LogEntry(TOPIC_Alligator,"Я рассказал Джеку о том, что мне удалось убить его аллигатора. После этого он, кажется, проникся ко мне уважением и подарил шкуру мракориса.");
};