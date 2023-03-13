module EquipmentEx

class ViewState {
    private persistent let m_collapsedSlots: array<TweakDBID>;

    public func IsCollapsed(slotID: TweakDBID) -> Bool {
        return ArrayContains(this.m_collapsedSlots, slotID);
    }
    
    public func SetCollapsedState(slotID: TweakDBID, state: Bool) {
        if (state) {
            if !ArrayContains(this.m_collapsedSlots, slotID) {
                ArrayPush(this.m_collapsedSlots, slotID);
            }
        } else {
            ArrayRemove(this.m_collapsedSlots, slotID);
        }
    }

    public func ToggleCollapsedState(slotID: TweakDBID) {
        this.SetCollapsedState(slotID, !ArrayContains(this.m_collapsedSlots, slotID));
    }
}
