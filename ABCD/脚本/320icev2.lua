package.path = GetPackagePath();
local loadArr={"自动任务"};
for i=1,#loadArr
do
	package.loaded[loadArr[i]]=nil;
	require(loadArr[i]);
end

g_timeOut=40*60     --在一个地图呆的时间超过设置的 就重新开图重新 单位为秒

--指定职业  野蛮人、女巫、贵族、游侠、决斗者、暗影、圣堂武僧、
g_newRoleJob="游侠"
--升华职业 勇士、暴徒、酋长、侠客、锐眼、追猎者、秘术家、元素使、召唤师、处刑者、卫士、冠军、判官、圣宗、守护者、暗影大师、欺诈师、破坏者、升华使徒、
g_shengHuaJob="侠客"
--设置使用的武器 支持(盾}箭袋}爪}匕首|法杖|单手剑|细剑|单手斧|单手锤|符文匕首|短杖|战杖|弓|长杖|双手剑|双手斧|双手锤) 如果需要用两样中间用|分开
SetUseWeapon("匕首|盾")
--设置自己用的装备类型 
SetUseZhuangBeiTypeData("Dex|DexInt|StrDex","衣服")
SetUseZhuangBeiTypeData("Dex","头盔")
SetUseZhuangBeiTypeData("Str|StrInt|Int","手套")
SetUseZhuangBeiTypeData("Dex","鞋子")
SetUseZhuangBeiTypeData("StrInt","项链")
SetUseZhuangBeiTypeData("Str|StrInt","盾")

g_changeHunDunLv=99--多少级前不换C

g_sellSkillGem=false				--自动卖超过40品质的技能宝石
AddNotMakeTaskData("a2q5")--梦中圣地
AddNotMakeTaskData("a2q10")--白色巨兽
AddNotMakeTaskData("a3q13")--重生的渴望
--AddNotMakeTaskData("a3q12")--命运之语
AddNotMakeTaskData("a6q5")--毕斯特传奇
--AddNotMakeTaskData("a7q8")--古斯特的墓碑
AddNotMakeTaskData("a7q5")--银色吊坠
AddNotMakeTaskData("a8q5")--瓦斯提里之翼
AddNotMakeTaskData("a9q4")--命运之历
AddNotMakeTaskData("a10q4")--无爱旧魂
AddNotMakeTaskData("a10q5")--深海之路

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


SetNoUseMapShuXing("map_monsters_reflect_%_physical_damage")--设置不打物理反射属性
SetNoUseMapShuXing("map_monsters_reflect_%_elemental_damage")--设置不打魔法反射属性
SetNoUseMapShuXing("map_players_no_regeneration_including_es")--无法回复
SetNoUseMapShuXing("is_blighted_map")--凋落地图


g_yijieNoWhiteMonster=false		--异界时是否不打白怪 true为不打 nil或false为打
g_yijieNoWhiteBox=true			--异界时是否不开白箱子 true为不开 nil或false为开
g_useYiJieWanChengDuLv=90	--使用下面异界完成度那个设置的等级，如果未到等则刷全图
g_yiJieWanChengDu=0.9		--异界完成度 完成多少就回去 为1或1以下的小数
g_yongHengShiBeiLv=90		--大于等于多少级打永恒石碑 
g_needTaFangLv=90			--大于等于多少级打塔防
g_needLianMoLv=90			--大于等于多少级打炼魔
g_attackFreezeMonsterLv=90	--大于等于多少级打冰冻怪
g_needChuanYueLv=90			--大于等于多少级打穿越怪
g_needLieXiLv=90			--大於等于多少级打时空裂缝怪
g_needMiWuLv=90				--大于等于多少级打迷雾




g_attackDis=20				--攻击距离
g_duobiHpVal=0.2

--SetNeedSkillLineData(val,str,invalidLv,pos,nType,yxName,yxClassName,yxWordName,yxWordClassName,wxName,wxClassName,wxWordName,wxWordClassName,addPingZhi,minLv)--设置换宝石数据 
--val=每块宝石的比重值 数字型
--str=要设置的宝石 字符串型 格式为："宝石1,宝石1类名,|宝石2,宝石2类名|宝石3,宝石3类名" 名与类名之间用,隔开 宝石之间用|隔开
--invalidLv=失效等级 数字型 超过这个等级就不会需要他了
--pos=指定位置 数字型 nil为自动选择 2为衣服 3为主武器 4为副武器 5为头盔 6为项链 7为左戒指 8为右戒指 9为护手 10为鞋子 11为腰带
--nType=有效场景 数字型 nil为无论何时都有效 0为没在刷异界才有效 1为只在刷异界才有效
--yxName 身上或背包有指定装备时才有效 此为指定装备的名字 如果不需要此功能请填nil 
--yxClassName 身上或背包有指定装备时才有效 此为指定装备的类名 如果不需要此功能请填nil
--yxWordName 身上或背包有指定装备时才有效 此为指定装备的词缀名字 如果不需要此功能请填nil
--yxWordClassName 身上或背包有指定装备时才有效 此为指定装备的词缀类名 如果不需要此功能请填nil
--wxName 身上跟背包都有没有指定装备时才有效 此为指定装备的名字 如果不需要此功能请填nil 
--wxClassName 身上跟背包都有没有指定装备时才有效 此为指定装备的类名 如果不需要此功能请填nil
--wxWordName 身上跟背包都有没有指定装备时才有效 此为指定装备的词缀名字 如果不需要此功能请填nil
--wxWordClassName 身上跟背包都有没有指定装备时才有效 此为指定装备的词缀类名 如果不需要此功能请填nil
--addPingZhi 逻辑型 是否需要升级技能品质 是为true 不升级为false或nil 取图时会检测升级技能品质
--minLv 数字型 生效等级 满了这个等级才生效 nil为一直生效

SetNeedSkillLineData(10,"燃燒箭矢,nil|穿透輔助,nil",2,nil,nil)

SetNeedSkillLineData(95,"元素淨化,nil|受傷時施放輔助,nil|信念浪湧,nil",nil,9,0)

SetNeedSkillLineData(95,"憎恨,nil|受傷時施放輔助,nil|烈焰衝刺,nil|熔岩護盾,nil|",nil,9,1)

SetNeedSkillLineData(96,"鋼筋鐵骨,nil|先祖衛士,nil|持續時間延長輔助,nil",nil,4,nil)
SetNeedSkillLineData(97,"冰霜之捷,nil|盜獵者印記,nil|擊中時印記輔助,nil",nil,nil,nil)
SetNeedSkillLineData(98,"凋零之步,nil|召喚寒冰魔像,nil|恢復輔助,nil",nil,nil,nil)
SetNeedSkillLineData(99,"爆裂陷阱,nil|迅速組裝輔助,nil|機率中毒輔助,nil",18,nil,nil)


SetNeedSkillLineData(100,"靈體旋武,nil|夜刃輔助,nil|附加冰冷傷害輔助,nil|霜咬輔助,nil|附加閃電傷害輔助,nil|物理轉閃電輔助,nil|元素攻擊傷害輔助,nil|快速攻擊輔助,nil",nil,nil,0)
SetNeedSkillLineData(100,"冰霜之刃,nil|夜刃輔助,nil|附加冰冷傷害輔助,nil|霜咬輔助,nil|多重打擊輔助,nil|元素攻擊傷害輔助,nil",nil,nil,1)






--添加攻击技能 name=技能名 className=技能类名 noLine=不在直线就能攻击 挑选攻击技能会从上到下寻找，要把厉害的技能加在前面
AddAttackSkillData("冰霜之刃","Frost Blades")
AddAttackSkillData("靈體旋武","Caustic Arrow")
AddAttackSkillData("爆裂陷阱","Explosive Trap")
AddAttackSkillData("燃燒箭矢","Burning Arrow")
AddAttackSkillData("普通攻击","melee")



--SetSkillLimitMaxLv(name,className,maxLv)--设置技能宝石最大等级 name=技能宝石物品名 className=技能宝石物品类名 maxLv=限制的最大等级
SetSkillLimitMaxLv("受傷時施放輔助",nil,1)
SetSkillLimitMaxLv("信念浪湧",nil,1)
SetSkillLimitMaxLv("烈焰衝刺",nil,1)
SetSkillLimitMaxLv("熔岩護盾",nil,10)


-- SetYiJieZhaoHuanLingTiData(mapClassName,name,className)--设置异界时召唤的灵体数据 mapClassName=剧情图类名 name=灵体名 className=灵体类名

SetNeedFlaskData(1,"生命药剂","nil")
SetNeedFlaskData(2,"水银药剂","nil")
SetNeedFlaskData(3,"生命药剂","nil")
SetNeedFlaskData(4,"生命药剂","nil")
SetNeedFlaskData(5,"魔力药剂","nil")


g_addHpVal=0.7--HP低于多少吃红药
g_addMpVal=0.1--MP低于多少吃蓝药

---------------------------------------换装设置
--SetAtuoChangeEquipData(job,pos,name,val,yijie) 计算方式如下 定义过的属性值乘以比重值  哪样装备高就会用哪样
--job 职业 支持(暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧) 可填多个，中间用|隔开
--pos 部位 支持(戒指|项链|腰带|鞋子|手套|衣服|头盔|盾|箭袋|爪}匕首|法杖|单手剑|细剑|单手斧|单手锤|符文匕首|短杖|战杖|弓|长杖|双手剑|双手斧|双手锤) 可填多个，中间用|隔开
--name 属性名 支持游戏内的装备属性名 还有其他的自定义名(物理伤害、护甲、护盾、闪避、连洞、总洞)
--val 比重值 支持小数
--nType 换装类型 0或nil或不填为一直有效 1为跑图时才有效 2为异界时才有效
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","fire_and_cold_damage_resistance_%",0.5)--火焰与冰霜伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","fire_and_lightning_damage_resistance_%",0.5)--火焰与闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","cold_and_lightning_damage_resistance_%",0.5)--冰霜与闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","base_resist_all_elements_%",0.6)--全元素抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","base_fire_damage_resistance_%",0.3)--基础火焰伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","base_cold_damage_resistance_%",0.3)--基础冰霜伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","base_lightning_damage_resistance_%",0.3)--基础闪电伤害抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","cold_damage_resistance_%",0.3)--冰霜抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","fire_damage_resistance_%",0.3)--火焰抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","lightning_damage_resistance_%",0.3)--闪电抗性 %
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","base_movement_velocity_+%",0.3)--基础移动速度 +%
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","base_maximum_life",0.3)--生命
SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|箭袋|盾","movement_velocity_+%",0.3)--移动速度 +%

SetAtuoChangeEquipData("游侠","项链","additional_strength",0.2)--
SetAtuoChangeEquipData("游侠","项链","additional_intelligence",0.2)--
SetAtuoChangeEquipData("游侠","项链","additional_strength_and_intelligence",0.3)--

--游侠
SetAtuoChangeEquipData("游侠","匕首","物理伤害",5,nil)
SetAtuoChangeEquipData("游侠","匕首","Local_Maximum_Added_Fire_Damage",5,nil)
SetAtuoChangeEquipData("游侠","匕首","Local_Maximum_Added_cold_Damage",10,nil)
SetAtuoChangeEquipData("游侠","匕首","Local_Maximum_Added_lightning_Damage",5,nil)
SetAtuoChangeEquipData("游侠","匕首","Local_critical_strike_chance_%",3,nil)


--游侠--孔色
--SetZhengTiColorVarData(zbPos,redCnt,greenCnt,buleCnt,nType,val,needLine)--设置指定的整体孔色分数数据 这个分数会加到换装设置中，这个分数只有在不是高级换装中的装备才有效 设置对了可以更加容易换上符合孔色的装备
--zbPos 数字型 装备部位 2为衣服 3为主武器 4为副武器 5为头盔 6为项链 7为左戒指 8为右戒指 9为护手 10为鞋子 11为腰带
--redCnt 数字型 红洞数量
--greenCnt 数字型 绿洞数量
--buleCnt 数字型 蓝洞数量
--nType=有效场景 数字型 nil为无论何时都有效 0为没在刷异界才有效 1为只在刷异界才有效
--val 数字型 这一套孔色数据的分数，可填nil忽略 默认为100
--needLine 逻辑型 是否相连了才算 true为是 nil或false为不是 可填nil忽略

SetZhengTiColorVarData(2,1,4,1,nil,650,true)
SetZhengTiColorVarData(2,1,5,0,nil,630,true)
SetZhengTiColorVarData(2,1,4,0,nil,600,true)
SetZhengTiColorVarData(2,0,4,1,nil,580,true)
SetZhengTiColorVarData(2,0,5,0,nil,550,true)
SetZhengTiColorVarData(2,0,4,0,nil,450,true)
SetZhengTiColorVarData(2,0,3,1,nil,400,true)
SetZhengTiColorVarData(2,1,3,0,nil,350,true)
SetZhengTiColorVarData(2,0,3,0,nil,300,true)
SetZhengTiColorVarData(2,0,2,1,nil,250,true)
SetZhengTiColorVarData(2,0,2,0,nil,200,true)
SetZhengTiColorVarData(2,0,1,1,nil,150,true)
SetZhengTiColorVarData(2,0,1,0,nil,100)
SetZhengTiColorVarData(2,1,0,0,nil,60)
SetZhengTiColorVarData(2,0,0,1,nil,50)

SetZhengTiColorVarData(3,0,3,0,nil,30,true)
SetZhengTiColorVarData(3,0,2,0,nil,20,true)
SetZhengTiColorVarData(3,0,1,0,nil,10)

SetZhengTiColorVarData(4,3,0,0,nil,300,true)
SetZhengTiColorVarData(4,2,0,0,nil,200,true)
SetZhengTiColorVarData(4,1,0,0,nil,100)

SetZhengTiColorVarData(5,0,4,0,nil,400,true)
SetZhengTiColorVarData(5,0,3,1,nil,300,true)
SetZhengTiColorVarData(5,0,2,0,nil,200,true)
SetZhengTiColorVarData(5,0,1,0,nil,100)

SetZhengTiColorVarData(9,2,1,1,nil,400,true)
SetZhengTiColorVarData(9,1,0,3,nil,350,true)
SetZhengTiColorVarData(9,1,0,2,nil,300,true)
SetZhengTiColorVarData(9,1,0,1,nil,200,true)
SetZhengTiColorVarData(9,0,0,1,nil,100)

SetZhengTiColorVarData(10,0,4,0,nil,400,true)
SetZhengTiColorVarData(10,0,3,0,nil,300,true)
SetZhengTiColorVarData(10,0,2,0,nil,200,true)
SetZhengTiColorVarData(10,0,1,0,nil,100)



AddShengJiZhuangBeiGoodsData("点金石","Metadata/Items/Currency/CurrencyUpgradeToRare",0,50,0)--主线生效 超过50级就用点金点白色装备
AddShengJiZhuangBeiGoodsData("束縛石","Metadata/Items/Currency/CurrencyUpgradeToRareAndSetSockets",0,50,0)
AddShengJiZhuangBeiGoodsData("富豪石","Metadata/Items/Currency/CurrencyUpgradeMagicToRare",1,50,0)--主线生效 超过50级就用富豪点蓝色装备

--掉落率+稀有率 异界时才有效
--SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|法杖|盾","base_item_found_rarity_+%",0.5,2)--基礎物品掉落品質 +%
--SetAtuoChangeEquipData("暗影|野蛮人|决斗者|女巫|游侠|圣堂武僧","戒指|项链|腰带|鞋子|手套|衣服|头盔|法杖|盾","base_item_found_quantity_+%",1.5,2)--物品掉落數量增加 %

--高级换装设置
SetGaoJiHuanZhuangData("游侠","简易之袍","Metadata/Items/Armours/BodyArmours/BodyInt1","无尽之衣","Tabula Rasa")

--SetTaskShengJiData(taskClassName,taskIndex,shengjiMapClassName,needLv)--设置跑图时升级 taskClassName=任务类名 taskIndex=任务索引 nil为忽略，只匹配任务类名 shengjiMapClassName=要刷的地图类名 needLv=升级到多少级为止
SetTaskShengJiData("a5q7",nil,"1_5_5",46,true)--做 到奇塔弗的受难 的时候刷纯净圣地到50级再进行下一任务
SetTaskShengJiData("a9q3",nil,"2_9_1",66,true)--做 到風暴飛刃 的时候刷滲血水道到68级再进行下一任务
SetTaskShengJiData("a10q3",nil,"2_9_1",73,true)--做 到風暴飛刃 的时候刷滲血水道到68级再进行下一任务

SetTaskMiGongData("a8q7",nil,1)--大于等于a9q1级 做迷宫1
SetTaskMiGongData("a9q5",nil,2)--大于等于a10q1 做迷宫2
SetTaskMiGongDataByLv(80,3)--大于等于80级 做迷宫3

--SetNeedAddTianFu(tfStr)--设置天赋加点 
--SetNeedAddTianFu("游侠=evasion731-閃避和生命|dexterity988-敏捷|dexterity986-敏捷|dexterity984-敏捷|finesse993-嫻熟|reduced_mana1480-魔力和藥劑效果|mana1478-原始精神|stun_recovery543-生命和避免暈眩|avoid_stun553-橡木之心|one_handed_damage636-武器元素傷害|shield_mastery440-自然合一|one_handed_damage637-武器元素傷害|claws_of_the_pride489-直覺|dexterity870-敏捷|life1412-生命|alchemist532-藥草學|life1216-生命|dexterity862-敏捷|dexterity861-敏捷|weapon_elemental_damage2163-武器元素傷害|weapon_elemental_damage2164-武器元素傷害和異常狀態效果|weapon_elemental_damage2176-武器元素傷害和異常狀態效果|weapon_elemental_damage_notable2165-太古之力|dexterity864-敏捷|mastery_elemental96-元素專精-30502|mastery_life146-生命專精-47642|dexterity866-敏捷|dexterity865-敏捷|dexterity856-敏捷|might770-無畏|dexterity872-敏捷|weapon_elemental_damage1263-武器元素傷害|weapon_elemental_damage1264-武器元素傷害|weapon_ele_notable1700-自然之力|dexterity855-敏捷|dexterity848-敏捷|intelligence957-智慧|aura_area_of_effect1203-光環效果範圍|reduced_mana_reservation1199-保留效用|aura_effect_reservation_cost_notable1558-魅力|dexterity860-敏捷|dexterity867-敏捷|damage_area_projectile_speed_2296-擊中時獲得生命和魔力|life1415-生命|life_life_leech1629-嗜血者|mastery_life135-生命專精-64381|intelligence927-智慧|intelligence926-智慧|dagger_damage264-匕首傷害|dagger_damage_and_attack_speed466-匕首傷害和攻擊速度|dagger_damage_and_attack_speed467-匕首傷害和攻擊速度|dagger_damage_and_attack_speed468-匕首傷害和攻擊速度|flaying266-剝皮刃|dagger_damage_and_critical_strike_chance465-匕首暴擊率和暴擊加成|dagger_damage_and_critical_strike_multiplier262-匕首暴擊率和加成|dagger_damage_and_critical_strike_multiplier263-匕首暴擊率和加成|dagger_global_crit_notable2527-背刺|mastery_dagger76-匕首專精-44869|accuracy587-命中和暴擊率|accuracy586-命中和暴擊率|deadeye588-潛意識|mastery_accuracy2-命中專精-64775|projectile_damage_projectile_speed1628-聰穎盜賊|intelligence906-智慧|intelligence930-智慧|intelligence960-智慧|aura_effect1553-光環效果|reduced_mana_reservation1200-保留效用|aura_effect_notable1557-影響|life_energy_shield1675-生命和能量護盾|fitness1160-血書|intelligence1993-智慧|frenzy_charge_duration531-狂怒球持續時間|maximum_frenzy_charges526-狂熱|life1119-閃避和生命|life1118-閃避和生命|life1117-死亡通緝|mastery_life130-閃避專精-57074|evasion_per_frenzy_charge535-每顆狂怒球閃避|maximum_frenzy_charges525-激情|dexterity873-敏捷|dexterity858-敏捷|dexterity968-敏捷|weapon_cold_damage212-武器冰冷傷害|weapon_cold_damage211-武器冰冷傷害|ice_bite433-刺骨寒冰|mastery_cold61-冰冷專精-13267|dexterity835-敏捷|dexterity844-敏捷|dexterity840-敏捷|dexterity838-敏捷|dexterity1990_-敏捷|maximum_frenzy_charges527-野性之心|frenzy_charges2419-每顆狂怒球閃避|frenzy_charges2418-移動速度|frenzy_charges2420-每顆狂怒球攻擊速度|frenzy_charges_notable2421-屠宰者之使徒|strength1005-力量|life1213-生命|golem's_blood1088-魔像血統 |iron_reflexes1137-霸體|")
SetNeedAddTianFu("游侠升华=AscendancyRaider5-閃避、猛攻效果|AscendancyRaider6-極速進攻|AscendancyRaider3-閃避、狂怒球持續時間|AscendancyRaider2-盜獵者之途|AscendancyRaider1-閃避、狂怒球持續時間|AscendancyRaider4-殺戮使徒|") 
SetNeedAddTianFu("异界地图天赋=atlas_boss_adjacent_maps_2-相鄰地圖掉落機率|atlas_path_11-相鄰地圖掉落機率|atlas_path_23_-相鄰地圖掉落機率|atlas_boss_adjacent_maps_1-相鄰地圖掉落機率|atlas_boss_adjacent_maps_8-相鄰地圖掉落機率|atlas_path_38-相鄰地圖掉落機率|atlas_path_21-相鄰地圖掉落機率|atlas_path_27-相鄰地圖掉落機率|atlas_path_28-相鄰地圖掉落機率|atlas_map_drops_20-掉落複製地圖|atlas_map_drops_2-掉落複製地圖|atlas_map_drops_4-掉落複製地圖|atlas_map_drops_8-掉落複製地圖|atlas_path_92-掉落複製地圖|atlas_path_61-物品數量|atlas_path_44-物品數量|atlas_path_35-物品數量|atlas_path_90-掉落複製地圖|atlas_keystone_smallnodes_1-流浪之路|atlas_path_22-相鄰地圖掉落機率|atlas_path_13-相鄰地圖掉落機率|atlas_path_8-相鄰地圖掉落機率|atlas_path_9-相鄰地圖掉落機率|atlas_path_37-相鄰地圖掉落機率|atlas_path_30-相鄰地圖掉落機率|atlas_path_18-相鄰地圖掉落機率|atlas_path_15-相鄰地圖掉落機率|atlas_path_2-相鄰地圖掉落機率|atlas_path_17-相鄰地圖掉落機率|atlas_map_drops_1-掉落複製地圖|atlas_map_drops_16-掉落複製地圖|atlas_map_drops_15-掉落複製地圖|atlas_map_drops_9-掉落複製地圖|atlas_path_95-掉落複製地圖|atlas_path_96-掉落複製地圖|atlas_path_94-掉落複製地圖|atlas_map_tier_5_1-高階地圖機率|atlas_map_tier_3_1-高階地圖機率|atlas_map_tier_3_2-高階地圖機率|atlas_map_tier_5_2-高階地圖機率|atlas_map_tier_4_1-高階地圖機率|atlas_path_82-掉落複製地圖|atlas_map_drops_14-掉落複製地圖|atlas_path_85-掉落複製地圖|atlas_path_14-相鄰地圖掉落機率|atlas_path_26-相鄰地圖掉落機率|atlas_path_83-掉落複製地圖|atlas_map_drops_5-掉落複製地圖|atlas_path_84-掉落複製地圖|atlas_map_drops_3-掉落複製地圖|atlas_map_drops_17_-掉落複製地圖|atlas_path_3-相鄰地圖掉落機率|atlas_path_29-相鄰地圖掉落機率|atlas_path_89-掉落複製地圖|atlas_map_drops_18-掉落複製地圖|atlas_path_86-掉落複製地圖|atlas_map_drops_21-掉落複製地圖|atlas_map_tier_1_2_-高階地圖機率|atlas_map_tier_1_1-高階地圖機率|atlas_map_tier_2_1-高階地圖機率|atlas_map_tier_2_2-高階地圖機率|atlas_map_drops_10-掉落複製地圖|atlas_map_drops_11-掉落複製地圖|atlas_path_4-相鄰地圖掉落機率|atlas_path_7-相鄰地圖掉落機率|atlas_path_88-掉落複製地圖|atlas_map_drops_12_-掉落複製地圖|atlas_path_87-掉落複製地圖|atlas_map_drops_13-掉落複製地圖|")

g_openQlkMaxMapTianFuCnt=nil--数值型 满多少天赋后不开奇拉克任务nil为一直开
g_useMinLvMapTianFuCnt=70--地图天赋满多少点后 就从低阶地图开始取
SetYiJieShuaTuModeByMapCnt(60,nil,2)--)--根据仓库里的地图数量设置异界刷图模式 可添加多个 他是从地图数量多到少来判断的