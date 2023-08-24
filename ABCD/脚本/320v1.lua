package.path = GetPackagePath();
local loadArr={"自动任务"};
for i=1,#loadArr
do
	package.loaded[loadArr[i]]=nil;
	require(loadArr[i]);
end

--指定职业  野蛮人、女巫、贵族、游侠、决斗者、暗影、圣堂武僧、
g_newRoleJob="游侠"
--升华职业 勇士、暴徒、酋长、侠客、锐眼、追猎者、秘术家、元素使、召唤师、处刑者、卫士、冠军、判官、圣宗、守护者、暗影大师、欺诈师、破坏者、升华使徒、
g_shengHuaJob="侠客"
--设置使用的武器 支持(盾}箭袋}爪}匕首|法杖|单手剑|细剑|单手斧|单手锤|符文匕首|短杖|战杖|弓|长杖|双手剑|双手斧|双手锤) 如果需要用两样中间用|分开
SetUseWeapon("弓|箭袋")
--设置自己用的装备类型 
SetUseZhuangBeiTypeData("Dex","衣服")
SetUseZhuangBeiTypeData("Dex","头盔")
SetUseZhuangBeiTypeData("Str|StrInt|Int","手套")
SetUseZhuangBeiTypeData("Str|StrInt|Int","鞋子")
SetUseZhuangBeiTypeData("StrInt","项链")

g_attackDis=60				--攻击距离
g_duobiHpVal=0.2

--SetNeedSkillLineData(val,str,invalidLv,pos)--设置换技能宝石数据 
--val=每块宝石的比重值
--str="宝石1,宝石1类名|宝石2,宝石2类名|宝石3,宝石3类名" 名与类名之间用,隔开 宝石之间用|隔开
--invalidLv=失效等级 超过这个等级就不会需要他了
--pos=指定位置 nil为自动选择 2为衣服 3为主武器 4为副武器 5为头盔 6为项链 7为左戒指 8为右戒指 9为护手 10为鞋子 11为腰带
--nType 有效场景 nil为无论何时都有效 0为没在刷异界才有效 1为只在刷异界才有效

SetNeedSkillLineData(95,"召喚閃電魔像,nil|受傷時施放輔助,nil|屍術傳送,nil|",nil,nil,nil)
SetNeedSkillLineData(96,"鋼筋鐵骨,nil|元素淨化,nil|惡意,nil",nil,9,nil)
SetNeedSkillLineData(97,"凋零之步,nil|狙擊者印記,nil|擊中時印記輔助,nil",nil,nil,nil)
SetNeedSkillLineData(98,"彈片砲塔,nil|凋零之觸輔助,nil|快速攻擊輔助,nil|多重圖騰輔助,nil|猛毒投射物輔助,nil",nil,nil,nil)
SetNeedSkillLineData(99,"腐蝕箭矢,nil|虛空操縱輔助,nil|猛毒投射物輔助,nil|極速苦痛輔助,nil|集中效應輔助,nil|幻影射手輔助,nil|穿透輔助,nil",nil,nil,nil)
SetNeedSkillLineData(100,"燃燒箭矢,nil|穿透輔助,nil",2,nil,nil)

--添加攻击技能 name=技能名 className=技能类名 noLine=不在直线就能攻击 挑选攻击技能会从上到下寻找，要把厉害的技能加在前面

AddAttackSkillData("腐蝕箭矢","Caustic Arrow")
AddAttackSkillData("燃燒箭矢","Burning Arrow")
AddAttackSkillData("普通攻击","melee")

SetDebuffSkill(nil,"snipers_mark",nil,"curse_snipers_mark")--狙擊者印记

--SetSkillLimitMaxLv(name,className,maxLv)--设置技能宝石最大等级 name=技能宝石物品名 className=技能宝石物品类名 maxLv=限制的最大等级
SetSkillLimitMaxLv("受傷時施放輔助",nil,1)
SetSkillLimitMaxLv("屍術傳送",nil,1)


-- SetYiJieZhaoHuanLingTiData(mapClassName,name,className)--设置异界时召唤的灵体数据 mapClassName=剧情图类名 name=灵体名 className=灵体类名

SetNeedFlaskData(1,"生命药剂","nil")
SetNeedFlaskData(2,"生命药剂","nil")
SetNeedFlaskData(3,"水银药剂","nil")
SetNeedFlaskData(4,"魔力药剂","nil")
SetNeedFlaskData(5,"魔力药剂","nil")


g_addHpVal=0.7--HP低于多少吃红药
g_addMpVal=0.2--MP低于多少吃蓝药

---------------------------------------换装设置
--SetAtuoChangeEquipData(job,pos,name,val,yijie) 计算方式如下 定义过的属性值乘以比重值  哪样装备高就会用哪样
--job 职业 支持(暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧) 可填多个，中间用|隔开
--pos 部位 支持(戒指|项链|腰带|鞋子|手套|衣服|头盔|盾|箭袋|爪}匕首|法杖|单手剑|细剑|单手斧|单手锤|符文匕首|短杖|战杖|弓|长杖|双手剑|双手斧|双手锤) 可填多个，中间用|隔开
--name 属性名 支持游戏内的装备属性名 还有其他的自定义名(物理伤害、护甲、护盾、闪避、连洞、总洞)
--val 比重值 支持小数
--nType 换装类型 0或nil或不填为一直有效 1为跑图时才有效 2为异界时才有效
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","fire_and_cold_damage_resistance_%",0.25)--火焰与冰霜伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","fire_and_lightning_damage_resistance_%",0.25)--火焰与闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","cold_and_lightning_damage_resistance_%",0.2)--冰霜与闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","base_resist_all_elements_%",0.35)--全元素抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","base_fire_damage_resistance_%",0.3)--基础火焰伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","base_cold_damage_resistance_%",0.3)--基础冰霜伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","base_lightning_damage_resistance_%",0.3)--基础闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","cold_damage_resistance_%",0.3)--冰霜抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","fire_damage_resistance_%",0.3)--火焰抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","lightning_damage_resistance_%",0.3)--闪电抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","base_movement_velocity_+%",0.3)--基础移动速度 +%
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","base_maximum_life",0.3)--生命
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋","movement_velocity_+%",0.3)--移动速度 +%

SetAtuoChangeEquipData("游侠","项链","additional_strength",0.2)--
SetAtuoChangeEquipData("游侠","项链","additional_intelligence",0.2)--
SetAtuoChangeEquipData("游侠","项链","additional_strength_and_intelligence",0.3)--

--游侠
SetAtuoChangeEquipData("游侠","弓","物理伤害",5,nil)
SetAtuoChangeEquipData("游侠","弓","Local_Maximum_Added_Chaos_Damage",5,nil)
SetAtuoChangeEquipData("游侠","弓","Local_Physical_Damage_%",5,nil)
SetAtuoChangeEquipData("游侠","弓","Dot_Multiplier_%",5,nil)

--游侠--孔色

SetZhengTiColorVarData(2,0,5,1,nil,500,true)
SetZhengTiColorVarData(2,0,6,0,nil,450,true)
SetZhengTiColorVarData(2,0,4,1,nil,400,true)
SetZhengTiColorVarData(2,0,5,0,nil,350,true)
SetZhengTiColorVarData(2,0,4,0,nil,300,true)
SetZhengTiColorVarData(2,0,3,1,nil,250,true)
SetZhengTiColorVarData(2,0,3,0,nil,200,true)
SetZhengTiColorVarData(2,0,2,0,nil,150,true)
SetZhengTiColorVarData(2,0,1,0,nil,100)
SetZhengTiColorVarData(2,1,0,0,nil,60)
SetZhengTiColorVarData(2,0,0,1,nil,50)

SetZhengTiColorVarData(3,0,5,1,nil,500,true)
SetZhengTiColorVarData(3,0,6,0,nil,450,true)
SetZhengTiColorVarData(3,0,4,1,nil,400,true)
SetZhengTiColorVarData(3,0,5,0,nil,350,true)
SetZhengTiColorVarData(3,0,4,0,nil,300,true)
SetZhengTiColorVarData(3,0,3,1,nil,250,true)
SetZhengTiColorVarData(3,0,3,0,nil,200,true)
SetZhengTiColorVarData(3,0,2,0,nil,150,true)
SetZhengTiColorVarData(3,0,1,0,nil,100)
SetZhengTiColorVarData(3,1,0,0,nil,60)
SetZhengTiColorVarData(3,0,0,1,nil,50)

SetZhengTiColorVarData(4,3,0,0,nil,300,true)
SetZhengTiColorVarData(4,2,0,0,nil,200,true)
SetZhengTiColorVarData(4,1,0,0,nil,100)

SetZhengTiColorVarData(5,1,3,0,nil,400,true)
SetZhengTiColorVarData(5,0,4,0,nil,350,true)
SetZhengTiColorVarData(5,0,3,0,nil,300,true)
SetZhengTiColorVarData(5,0,2,0,nil,200,true)
SetZhengTiColorVarData(5,0,1,0,nil,100)

SetZhengTiColorVarData(9,2,0,2,nil,400,true)
SetZhengTiColorVarData(9,1,0,3,nil,350,true)
SetZhengTiColorVarData(9,1,0,2,nil,300,true)
SetZhengTiColorVarData(9,1,0,1,nil,200,true)
SetZhengTiColorVarData(9,0,0,1,nil,100)

SetZhengTiColorVarData(10,2,0,2,nil,400,true)
SetZhengTiColorVarData(10,1,0,3,nil,350,true)
SetZhengTiColorVarData(10,1,0,2,nil,300,true)
SetZhengTiColorVarData(10,1,0,1,nil,200,true)
SetZhengTiColorVarData(10,0,0,1,nil,100)



AddShengJiZhuangBeiGoodsData("点金石","Metadata/Items/Currency/CurrencyUpgradeToRare",0,50,0)--主线生效 超过50级就用点金点白色装备
AddShengJiZhuangBeiGoodsData("富豪石","Metadata/Items/Currency/CurrencyUpgradeMagicToRare",1,50,0)--主线生效 超过50级就用富豪点蓝色装备

--掉落率+稀有率 异界时才有效
--SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|法杖|盾","base_item_found_rarity_+%",0.5,2)--基礎物品掉落品質 +%
--SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|法杖|盾","base_item_found_quantity_+%",1.5,2)--物品掉落數量增加 %

--高级换装设置
SetGaoJiHuanZhuangData("游侠","简易之袍","Metadata/Items/Armours/BodyArmours/BodyInt1","无尽之衣","Tabula Rasa")
SetGaoJiHuanZhuangData("游侠","金缕帽","Metadata/Items/Armours/Helmets/HelmetDex1","金缕帽","Goldrim")

--SetTaskShengJiData(taskClassName,taskIndex,shengjiMapClassName,needLv)--设置跑图时升级 taskClassName=任务类名 taskIndex=任务索引 nil为忽略，只匹配任务类名 shengjiMapClassName=要刷的地图类名 needLv=升级到多少级为止
SetTaskShengJiData("a5q7",nil,"1_5_5",46,true)--做 到奇塔弗的受难 的时候刷纯净圣地到50级再进行下一任务
SetTaskShengJiData("a9q3",nil,"2_9_1",68,true)--做 到風暴飛刃 的时候刷滲血水道到68级再进行下一任务

SetTaskMiGongData("a8q7",nil,1)--大于等于a9q1级 做迷宫1
SetTaskMiGongData("a10q1",nil,2)--大于等于a10q1 做迷宫2
SetTaskMiGongDataByLv(82,3)--大于等于80级 做迷宫3


SetChangeLimitCnt("武器|衣服|头盔|手套|鞋子",1)
SetChangeLimitCnt("腰带",2)
SetChangeLimitCnt("项链|戒指",2)


--SetNeedAddTianFu(tfStr)--设置天赋加点 
SetNeedAddTianFu("游侠=attack_speed568-投射物傷害和命中|accuracy581-投射物傷害與攻擊速度|attack_speed1488-攻擊速度|attack_speed1489-攻擊速度|attack_speed1487-攻擊速度|perfect_aim591-彈道學|bow_damage_and_speed498-弓的傷害|greater_impact638-鷹靈祝福|mana1479-魔力和藥劑效果|mana1478-原始精神|stun_recovery544-生命和避免暈眩|avoid_stun553-橡木之心|stun_recovery543-生命和避免暈眩|finesse993-嫻熟|dexterity995-敏捷|intelligence957-智慧|dexterity848-敏捷|strength815-力量|chaos_damage1578-混沌持續傷害加成|chaos_damage1579-混沌持續傷害加成|dagger_leech_notable2537-浪費|mastery_chaos47-混沌專精-1727|dexterity981-敏捷|agility965-和諧之體|life703-生命|fitness617-血液抽取|degeneration_damage1569-持續傷害|degeneration_damage_notable1575-亂世|degeneration_damage1570-持續傷害|acceleration1238-毒蛇之牙|aura_area_of_effect1203-光環效果範圍|reduced_mana_reservation1199-保留效用|aura_effect_reservation_cost_notable1558-魅力|dexterity855-敏捷|dexterity856-敏捷|bow_chaos2508-弓的傷害|bow_chaos2509-弓的傷害|master_fletcher515-獵人之局|dexterity865-敏捷|dexterity866-敏捷|projectile_damage1233-投射物傷害|projectile_damage_pierce1685-穿透|projectile_pierce_notable1687-穿射箭矢|dexterity864-敏捷|bow_damage506-弓的傷害和命中|bow_damage_and_speed500-弓的傷害和攻擊速度|bow_damage505-弓的傷害和攻擊速度|bow_damage_and_speed501-弓的傷害和攻擊速度|deadly_draw680-飛矢宗師|dexterity860-敏捷|dexterity867-敏捷|intelligence927-智慧|intelligence926-智慧|intelligence906-智慧|intelligence930-智慧|intelligence960-智慧|aura_effect1553-光環效果|reduced_mana_reservation1200-保留效用|aura_effect_notable1557-影響|life1415-生命|life_life_leech1629-嗜血者|life_energy_shield1675-生命和能量護盾|fitness1160-血書|chaos_physical_damage2118-物理與混沌傷害|chaos_damage2108_-混沌持續傷害加成|chaos_damage2110-混沌持續傷害加成|chaos_damage2109-混沌持續傷害加成|chaos_damage2111-萎縮|dexterity984-敏捷|strength821-力量|dexterity853-敏捷|bow_mobility2507-弓的傷害|bow_damage_move_speed1710-弓的傷害和閃避|bow_damage_move_speed1709-弓的傷害和閃避|bow_damage_speed_notable1711-狩獵之徵|dexterity850-敏捷|dexterity1988-敏捷|dexterity849-敏捷|dexterity847-敏捷|reflexes706-閃避和法術壓抑|reflexes1091-反射|deaden_keystone2849-咒術災厄|sentinel1541-哨兵|mastery_life135-生命專精-64381|mastery_life128-生命專精-47642|strength789-力量|strength773-力量|life1164-生命|life_notable1697-構成|life1116-閃避和生命|life1115-閃避和生命|life1117-死亡通緝|mastery_bow36-弓專精-45512|attack_channel_charge2394-法術壓抑|attack_channel_charge2393-法術壓抑|attack_channel_charge2395-法術壓抑|attack_channel_charge_notable2396-根深蒂固|dual_wield_damage2125-移動速度和法術壓抑|attack_move_speed_notable1792-疾步|dual_wield_damage726-移動速度和法術壓抑|evasion_per_frenzy_charge535-每顆狂怒球閃避|maximum_frenzy_charges525-激情|")
SetNeedAddTianFu("游侠升华=AscendancyRaider5-閃避、猛攻效果|AscendancyRaider6-極速進攻|AscendancyRaider7-閃避、猛攻效果|AscendancyRaider8-追獵使徒|AscendancyRaider3-閃避、狂怒球持續時間|AscendancyRaider2-盜獵者之途|") 
SetNeedAddTianFu("异界地图天赋=atlas_boss_adjacent_maps_2-相鄰地圖掉落機率|atlas_path_11-相鄰地圖掉落機率|atlas_path_23_-相鄰地圖掉落機率|atlas_boss_adjacent_maps_1-相鄰地圖掉落機率|atlas_boss_adjacent_maps_8-相鄰地圖掉落機率|atlas_path_38-相鄰地圖掉落機率|atlas_path_21-相鄰地圖掉落機率|atlas_path_27-相鄰地圖掉落機率|atlas_path_28-相鄰地圖掉落機率|atlas_map_drops_20-掉落複製地圖|atlas_map_drops_2-掉落複製地圖|atlas_map_drops_4-掉落複製地圖|atlas_map_drops_8-掉落複製地圖|atlas_path_92-掉落複製地圖|atlas_path_61-物品數量|atlas_path_44-物品數量|atlas_path_35-物品數量|atlas_path_90-掉落複製地圖|atlas_keystone_smallnodes_1-流浪之路|atlas_path_22-相鄰地圖掉落機率|atlas_path_13-相鄰地圖掉落機率|atlas_path_8-相鄰地圖掉落機率|atlas_path_9-相鄰地圖掉落機率|atlas_path_37-相鄰地圖掉落機率|atlas_path_30-相鄰地圖掉落機率|atlas_path_18-相鄰地圖掉落機率|atlas_path_15-相鄰地圖掉落機率|atlas_path_2-相鄰地圖掉落機率|atlas_path_17-相鄰地圖掉落機率|atlas_map_drops_1-掉落複製地圖|atlas_map_drops_16-掉落複製地圖|atlas_map_drops_15-掉落複製地圖|atlas_map_drops_9-掉落複製地圖|atlas_path_95-掉落複製地圖|atlas_path_96-掉落複製地圖|atlas_path_94-掉落複製地圖|atlas_map_tier_5_1-高階地圖機率|atlas_map_tier_3_1-高階地圖機率|atlas_map_tier_3_2-高階地圖機率|atlas_map_tier_5_2-高階地圖機率|atlas_map_tier_4_1-高階地圖機率|atlas_path_82-掉落複製地圖|atlas_map_drops_14-掉落複製地圖|atlas_path_85-掉落複製地圖|atlas_path_14-相鄰地圖掉落機率|atlas_path_26-相鄰地圖掉落機率|atlas_path_83-掉落複製地圖|atlas_map_drops_5-掉落複製地圖|atlas_path_84-掉落複製地圖|atlas_map_drops_3-掉落複製地圖|atlas_map_drops_17_-掉落複製地圖|atlas_path_3-相鄰地圖掉落機率|atlas_path_29-相鄰地圖掉落機率|atlas_path_89-掉落複製地圖|atlas_map_drops_18-掉落複製地圖|atlas_path_86-掉落複製地圖|atlas_map_drops_21-掉落複製地圖|atlas_map_tier_1_2_-高階地圖機率|atlas_map_tier_1_1-高階地圖機率|atlas_map_tier_2_1-高階地圖機率|atlas_map_tier_2_2-高階地圖機率|atlas_map_drops_10-掉落複製地圖|atlas_map_drops_11-掉落複製地圖|atlas_path_4-相鄰地圖掉落機率|atlas_path_7-相鄰地圖掉落機率|atlas_path_88-掉落複製地圖|atlas_map_drops_12_-掉落複製地圖|atlas_path_87-掉落複製地圖|atlas_map_drops_13-掉落複製地圖|")

g_openQlkMaxMapTianFuCnt=nil--数值型 满多少天赋后不开奇拉克任务nil为一直开
g_useMinLvMapTianFuCnt=70--地图天赋满多少点后 就从低阶地图开始取
SetYiJieShuaTuModeByMapCnt(60,nil,2)--)--根据仓库里的地图数量设置异界刷图模式 可添加多个 他是从地图数量多到少来判断的
SetOpenMapMasterData(3)

--SetNeedAddTianFu(tfStr)--设置天赋加点 
--SetNeedAddTianFu("游侠=attack_speed568-投射物傷害和命中|dexterity990-敏捷|dexterity992-敏捷|dexterity995-敏捷|intelligence957-智慧|aura_area_of_effect1203-光環效果範圍|reduced_mana_reservation1199-保留效用|aura_effect_reservation_cost_notable1558-魅力|dexterity989-敏捷|dexterity872-敏捷|weapon_elemental_damage1263-武器元素傷害|weapon_elemental_damage1264-武器元素傷害|weapon_ele_notable1700-自然之力|life1119-閃避和生命|life1118-閃避和生命|life1117-死亡通緝|mastery_life130-閃避專精-57074|dexterity976-敏捷|attack_damage_notable2120-山貓之靈|dexterity969-敏捷|dexterity870-敏捷|claws_of_the_pride489-直覺|one_handed_damage637-武器元素傷害|shield_mastery440-自然合一|one_handed_damage636-武器元素傷害|finesse993-嫻熟|stun_recovery543-生命和避免暈眩|avoid_stun553-橡木之心|reduced_mana1480-魔力和藥劑效果|mana1478-原始精神|life1412-生命|alchemist532-藥草學|life1216-生命|dexterity862-敏捷|dexterity864-敏捷|accuracy582-命中與攻擊速度|accuracy589-命中和攻擊速度|deadeye590-心眼|mastery_accuracy3-命中專精-51147|evasion_per_frenzy_charge535-每顆狂怒球閃避|maximum_frenzy_charges525-激情|dexterity1986-敏捷|jewel_slot1960-基礎珠寶插槽|critical_strike_chance625-暴擊率|critical_strike_chance624-暴擊率|heartseeker626-刺心者|dexterity861-敏捷|weapon_elemental_damage2163-武器元素傷害|weapon_elemental_damage2161-武器元素傷害，異常狀態機率|weapon_elemental_damage2162-武器元素傷害，異常狀態機率|weapon_elemental_damage_notable2165-太古之力|dexterity873-敏捷|dexterity858-敏捷|dexterity968-敏捷|weapon_cold_damage212-武器冰冷傷害|weapon_cold_damage211-武器冰冷傷害|ice_bite433-刺骨寒冰|dexterity877-敏捷|savant937-原野智慧|dexterity875-敏捷|mana_leech2046-生命與魔力偷取|life_leech2055-生命偷取|life_leech_notable2056-活力虛空|mana_leech2047-魔力偷取|mana_leech_notable2048-精華抽取|dexterity835-敏捷|axe_damage_accuracy_crit2473-斧的傷害|axe_damage_accuracy_crit2472-斧的傷害和命中|axe_damage_accuracy_crit_notable2476-開墾之敵|dexterity844-敏捷|dexterity840-敏捷|mana_on_kill1476-魔力和光環範圍效果|mana_on_kill_notable1704-狂歡|mastery_mana171-魔力專精-12119|dexterity838-敏捷|dexterity1990_-敏捷|maximum_frenzy_charges527-野性之心|jewel_slot1975-基礎珠寶插槽|strength1005-力量|iron_reflexes1137-霸體|life1213-生命|golem's_blood1088-魔像血統 |armour_and_evasion1454-護甲和閃避|leather_and_steel1458-迅影秘術|strength832-力量|strength802-力量|strength794-力量|strikes_damage2731_-近戰傷害|strikes_range2732-近戰傷害和打擊範圍|strikes_range2733-近戰傷害和打擊範圍|blight_special_notable6-部落之怒|mastery_attack17-攻擊專精-39154|strength778-力量|savant954-靜修|aura_effect1555-光環效果|aura_area_of_effect1202-光環效果範圍|general_aura_notable1791-起源|aura_banner2426-保留效用|strength793-力量|call_to_arms_keystone2691-武裝召喚|axe_damage_accuracy_crit2475-斧的傷害和暴擊率|axe_damage_accuracy_crit2474-斧的傷害和暴擊率|mastery_leech159-偷取專精-53627|axe_damage_and_speed2466_-斧的傷害和攻擊速度|axe_damage_and_attack_speed1082-斧的傷害和攻擊速度|axe_damage_and_attack_speed518-斧的傷害和攻擊速度|hatchet_master104-斧刃宗師|melee_crit2381-近戰暴擊率|melee_crit2382-近戰暴擊加成|melee_crit_notable2384-肢解|mastery_criticals64-暴擊專精-2987|frenzy_charges2419-每顆狂怒球閃避|frenzy_charges2418-移動速度|frenzy_charges2420-每顆狂怒球攻擊速度|frenzy_charges_notable2421-屠宰者之使徒|mastery_charges50-充能專精-40307|mastery_life146-生命專精-47642|mastery_life138-生命專精-64381|")
--SetNeedAddTianFu("游侠升华=AscendancyRaider5-閃避、猛攻效果|AscendancyRaider6-極速進攻|AscendancyRaider3-閃避、狂怒球持續時間|AscendancyRaider2-盜獵者之途|AscendancyRaider1-閃避、狂怒球持續時間|AscendancyRaider4-殺戮使徒|") 
--SetNeedAddTianFu("异界地图天赋=atlas_boss_adjacent_maps_2-相鄰地圖掉落機率|atlas_path_11-相鄰地圖掉落機率|atlas_path_23_-相鄰地圖掉落機率|atlas_boss_adjacent_maps_1-相鄰地圖掉落機率|atlas_boss_adjacent_maps_8-相鄰地圖掉落機率|atlas_path_38-相鄰地圖掉落機率|atlas_path_21-相鄰地圖掉落機率|atlas_path_27-相鄰地圖掉落機率|atlas_path_28-相鄰地圖掉落機率|atlas_map_drops_20-掉落複製地圖|atlas_map_drops_2-掉落複製地圖|atlas_map_drops_4-掉落複製地圖|atlas_map_drops_8-掉落複製地圖|atlas_path_92-掉落複製地圖|atlas_path_61-物品數量|atlas_path_44-物品數量|atlas_path_35-物品數量|atlas_path_90-掉落複製地圖|atlas_keystone_smallnodes_1-流浪之路|atlas_path_22-相鄰地圖掉落機率|atlas_path_13-相鄰地圖掉落機率|atlas_path_8-相鄰地圖掉落機率|atlas_path_9-相鄰地圖掉落機率|atlas_path_37-相鄰地圖掉落機率|atlas_path_30-相鄰地圖掉落機率|atlas_path_18-相鄰地圖掉落機率|atlas_path_15-相鄰地圖掉落機率|atlas_path_2-相鄰地圖掉落機率|atlas_path_17-相鄰地圖掉落機率|atlas_map_drops_1-掉落複製地圖|atlas_map_drops_16-掉落複製地圖|atlas_map_drops_15-掉落複製地圖|atlas_map_drops_9-掉落複製地圖|atlas_path_95-掉落複製地圖|atlas_path_96-掉落複製地圖|atlas_path_94-掉落複製地圖|atlas_map_tier_5_1-高階地圖機率|atlas_map_tier_3_1-高階地圖機率|atlas_map_tier_3_2-高階地圖機率|atlas_map_tier_5_2-高階地圖機率|atlas_map_tier_4_1-高階地圖機率|atlas_path_82-掉落複製地圖|atlas_map_drops_14-掉落複製地圖|atlas_path_85-掉落複製地圖|atlas_path_14-相鄰地圖掉落機率|atlas_path_26-相鄰地圖掉落機率|atlas_path_83-掉落複製地圖|atlas_map_drops_5-掉落複製地圖|atlas_path_84-掉落複製地圖|atlas_map_drops_3-掉落複製地圖|atlas_map_drops_17_-掉落複製地圖|atlas_path_3-相鄰地圖掉落機率|atlas_path_29-相鄰地圖掉落機率|atlas_path_89-掉落複製地圖|atlas_map_drops_18-掉落複製地圖|atlas_path_86-掉落複製地圖|atlas_map_drops_21-掉落複製地圖|atlas_map_tier_1_2_-高階地圖機率|atlas_map_tier_1_1-高階地圖機率|atlas_map_tier_2_1-高階地圖機率|atlas_map_tier_2_2-高階地圖機率|atlas_map_drops_10-掉落複製地圖|atlas_map_drops_11-掉落複製地圖|atlas_path_4-相鄰地圖掉落機率|atlas_path_7-相鄰地圖掉落機率|atlas_path_88-掉落複製地圖|atlas_map_drops_12_-掉落複製地圖|atlas_path_87-掉落複製地圖|atlas_map_drops_13-掉落複製地圖|")
g_yiJieLv=72				--够了多少级才去刷异界
g_checkSellMapCnt=60		--地图超过这个数量才会检测出售地图
g_destroyNoUseMap=true		--销毁上面设置不使用的地图 nil或false为不销毁
g_mapUseFuHaoLv=76			--大于等于多少级对蓝图使用富豪石 nil为永远不使用
g_mapUseZengFuLv=nil			--大于等于多少级对蓝图使用增幅石 nil为永远不使用
g_mapUseDianJingLv=76		--大于等于多少级对白图使用点金石 nil为永远不使用
g_mapUseTuiBianLv=72		--大于等于多少级对白图使用蜕变石 nil为永远不使用
g_mapUseJiHuiLv=nil			--大于等于多少级对白图使用机会石 nil为永远不使用
g_mapUseWaErLv=83			--大于等于多少级对白、蓝地图使用瓦尔宝珠 nil为永远不使用
g_mapUseDingZiLv=nil			--大于等于多少级使用制图钉 nil为永远不使用
g_noUseMapLv=0				--不使用、不捡多少阶及以上的地图 nil或0为忽略 设置优先的地图除外

g_mapUseOrangeMap=false		--true为使用橙图 nil或false为不使用
SetCheckHeistData(5*60,100000,nil,99,false,65,73,78,65,true,6) --设置去夺宝 

g_yongHengShiBeiLv=90		--大于等于多少级打永恒石碑 
g_needTaFangLv=95			--大于等于多少级打塔防
g_needLianMoLv=90			--大于等于多少级打炼魔
g_attackFreezeMonsterLv=90	--大于等于多少级打冰冻怪
g_needChuanYueLv=90      	--大于等于多少级打穿越怪
g_needLieXiLv=90			--大於等于多少级打时空裂缝怪
g_needMiWuLv=90				--大于等于多少级打迷雾

g_needZaFenLv=90           --设置多少级开始做新赛季炸坟玩法
g_needMengYanLv=90          --70级以后就点梦魇
g_needSuDiLv=90             --满75级打强袭宿敌内容