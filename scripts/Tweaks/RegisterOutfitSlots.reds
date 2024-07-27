module EquipmentEx

class RegisterOutfitSlots extends ScriptableTweak {
    protected func OnApply() -> Void {
        let batch = TweakDBManager.StartBatch();
        let outfitSlots = OutfitConfig.OutfitSlots();

        for outfitSlot in outfitSlots {
            batch.CreateRecord(outfitSlot.slotID, n"AttachmentSlot_Record");
            batch.SetFlat(outfitSlot.slotID + t".localizedName", outfitSlot.displayName);

            if ArraySize(outfitSlot.relatedSlotIDs) > 0 {
                batch.SetFlat(outfitSlot.slotID + t".parentSlot", outfitSlot.relatedSlotIDs[0]);
            }

            if ArraySize(outfitSlot.dependencySlotIDs) > 0 {
                batch.SetFlat(outfitSlot.slotID + t".dependencySlots", outfitSlot.dependencySlotIDs);
            }

            batch.UpdateRecord(outfitSlot.slotID);
            batch.RegisterName(outfitSlot.slotName);
        }

        let playerEntityTemplates = [
            r"base\\characters\\entities\\player\\player_wa_fpp.ent",
            r"base\\characters\\entities\\player\\player_wa_tpp.ent",
            r"base\\characters\\entities\\player\\player_wa_tpp_cutscene.ent",
            r"base\\characters\\entities\\player\\player_wa_tpp_cutscene_no_impostor.ent",
            r"base\\characters\\entities\\player\\player_wa_tpp_reflexion.ent",
            r"base\\characters\\entities\\player\\player_ma_fpp.ent",
            r"base\\characters\\entities\\player\\player_ma_tpp.ent",
            r"base\\characters\\entities\\player\\player_ma_tpp_cutscene.ent",
            r"base\\characters\\entities\\player\\player_ma_tpp_cutscene_no_impostor.ent",
            r"base\\characters\\entities\\player\\player_ma_tpp_reflexion.ent"
        ];

        let playerDisplayName = GetLocalizedTextByKey(TweakDBInterface.GetLocKeyDefault(t"Character.Player_Puppet_Base.displayName"));

        for record in TweakDBInterface.GetRecords(n"Character_Record") {
            let character = record as Character_Record;
            if ArrayContains(playerEntityTemplates, character.EntityTemplatePath()) || Equals(GetLocalizedTextByKey(character.DisplayName()), playerDisplayName) {
                let characterSlots = TweakDBInterface.GetForeignKeyArray(character.GetID() + t".attachmentSlots");

                for outfitSlot in outfitSlots {
                    if !ArrayContains(characterSlots, outfitSlot.slotID) {
                        ArrayPush(characterSlots, outfitSlot.slotID);
                    }
                }

                batch.SetFlat(character.GetID() + t".attachmentSlots", characterSlots);
                batch.UpdateRecord(character.GetID());
            }
        }

        batch.Commit();
    }
}
