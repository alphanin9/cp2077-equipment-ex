module EquipmentEx

class OutfitTweakHelper {
    public static func PrepareCustomSlotMatcher() -> ref<OutfitSlotMatcher> {
        let slotMatcher = OutfitSlotMatcher.Create();

        slotMatcher.IgnoreEntities([
            n"player_head_item",
            n"player_face_item",
            n"player_inner_torso_item",
            n"player_outer_torso_item",
            n"player_legs_item",
            n"player_feet_item",
            n"player_outfit_item"
        ]);

        slotMatcher.MapPrices([
            new PriceModifierSlotMapping(t"OutfitSlots.Glasses", [t"Price.Glasses", t"Price.Visor"]),
            new PriceModifierSlotMapping(t"OutfitSlots.Wreath", [t"Price.TechFaceClothing"]),
            new PriceModifierSlotMapping(t"OutfitSlots.LegsOuter", [t"Price.Skirt"])
        ]);

        slotMatcher.MapEquipmentAreas([
            new EquipmentAreaSlotMapping(t"OutfitSlots.Head", [t"EquipmentArea.HeadArmor"]),
            new EquipmentAreaSlotMapping(t"OutfitSlots.Mask", [t"EquipmentArea.FaceArmor"]),
            new EquipmentAreaSlotMapping(t"OutfitSlots.TorsoInner", [t"EquipmentArea.InnerChest"]),
            new EquipmentAreaSlotMapping(t"OutfitSlots.TorsoOuter", [t"EquipmentArea.ChestArmor"]),
            new EquipmentAreaSlotMapping(t"OutfitSlots.LegsMiddle", [t"EquipmentArea.LegArmor"]),
            new EquipmentAreaSlotMapping(t"OutfitSlots.Feet", [t"EquipmentArea.Feet"]),
            new EquipmentAreaSlotMapping(t"OutfitSlots.BodyOuter", [t"EquipmentArea.Outfit"])
        ]);

        return slotMatcher;
    }
    
    public static func PrepareOriginalSlotMatcher() -> ref<OutfitSlotMatcher> {
        let slotMatcher = OutfitSlotMatcher.Create();

        //slotMatcher.IgnoreEntities([
        //    n"player_outfit_item"
        //]);

        slotMatcher.MapEntities([
            new EntityNameSlotMapping(t"OutfitSlots.Head", n"player_head_item"),
            new EntityNameSlotMapping(t"OutfitSlots.Mask", n"player_face_item"),
            new EntityNameSlotMapping(t"OutfitSlots.TorsoInner", n"player_inner_torso_item"),
            new EntityNameSlotMapping(t"OutfitSlots.TorsoOuter", n"player_outer_torso_item"),
            new EntityNameSlotMapping(t"OutfitSlots.LegsMiddle", n"player_legs_item"),
            new EntityNameSlotMapping(t"OutfitSlots.Feet", n"player_feet_item"),
            new EntityNameSlotMapping(t"OutfitSlots.BodyMiddle", n"player_outfit_item"),
            new EntityNameSlotMapping(t"OutfitSlots.BodyMiddle", n"player_outfit_item_ep1")
        ]);

        slotMatcher.MapAppearances([
            new AppearanceNameSlotMapping(t"OutfitSlots.Glasses", ["f1_tech_01_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.Wreath", ["f1_tech_02_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.Balaclava", ["h1_balaclava_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.TorsoUnder", ["t1_undershirt_02_", "t1_undershirt_03_", "t1_shirt_01_", "t1_shirt_02_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.TorsoInner", ["t1_undershirt_01_", "t1_tshirt_", "t1_formal_", "set_01_fixer_01_t1_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.TorsoInner", ["t2_dress_01_", "t2_jacket_16_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.TorsoMiddle", ["t1_shirt_03_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.TorsoMiddle", ["t2_dress_", "t2_shirt_", "t2_vest_", "t2_formal_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.TorsoAux", ["t2_vest_01_", "t2_vest_02_", "t2_vest_03_", "t2_vest_04_", "t2_vest_06_", "t2_vest_07_", "t2_vest_08_", "t2_vest_10_", "t2_vest_12_", "t2_vest_16_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.LegsOuter", ["l1_shorts_03_", "l1_shorts_04_", "l1_shorts_05_", "set_01_fixer_01_l1_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.LegsOuter", ["l1_pants_04_", "l1_pants_05_", "l1_pants_06_", "l1_pants_07_", "l1_pants_08_", "l1_pants_09_", "l1_pants_10_", "l1_pants_11_", "l1_pants_12_", "l1_pants_13_", "l1_pants_14_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.BodyUnder", ["t1_jumpsuit_", "set_01_netrunner_01_t1_"]),
            new AppearanceNameSlotMapping(t"OutfitSlots.BodyMiddle", ["t2_jumpsuit_"]) // "outfit_02_q114_cyberspace_"
        ]);

        slotMatcher.MapPrices([
            new PriceModifierSlotMapping(t"OutfitSlots.Mask", [t"Price.Mask"]),
            new PriceModifierSlotMapping(t"OutfitSlots.Glasses", [t"Price.Glasses", t"Price.Visor"]),
            new PriceModifierSlotMapping(t"OutfitSlots.Wreath", [t"Price.TechFaceClothing"]),
            new PriceModifierSlotMapping(t"OutfitSlots.LegsOuter", [t"Price.Skirt"])
        ]);

        slotMatcher.MapRecords([
            new RecordSlotMapping(t"OutfitSlots.Glasses", [
                t"Items.Media_01_Set_Tech",
                t"Items.Techie_01_Set_Tech"
            ]),
            new RecordSlotMapping(t"OutfitSlots.TorsoUnder", [
                t"Items.Media_01_Set_Shirt"
            ]),
            new RecordSlotMapping(t"OutfitSlots.TorsoMiddle", [
                t"Items.Corporate_01_Set_FormalJacket",
                t"Items.Rockerboy_01_Set_Jacket"
            ]),
            new RecordSlotMapping(t"OutfitSlots.TorsoAux", [
                t"Items.Media_01_Set_Vest",
                t"Items.SQ021_Wraiths_Vest",
                t"Items.Techie_01_Set_Vest"
            ]),
            new RecordSlotMapping(t"OutfitSlots.LegsOuter", [
                t"Items.Cop_01_Set_Pants",
                t"Items.Media_01_Set_Pants",
                t"Items.Netrunner_01_Set_Pants",
                t"Items.Nomad_01_Set_Pants",
                t"Items.Q202_Epilogue_Pants",
                t"Items.Q203_Epilogue_Pants",
                t"Items.Q204_Epilogue_Pants",
                t"Items.Solo_01_Set_Pants",
                t"Items.Techie_01_Set_Pants"
            ])
        ]);

        return slotMatcher;
    }

    public static func BuildOutfitSlotMap(out outfitSlots: array<ExtraSlotConfig>) -> ref<inkIntHashMap> {
        let outfitMap = new inkIntHashMap();
        let index = 0;
        for outfitSlot in outfitSlots {
            outfitMap.Insert(TDBID.ToNumber(outfitSlot.slotID), index);
            index = index + 1;
        }
        return outfitMap;
    }
}
