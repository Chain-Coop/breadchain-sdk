class EventConfig {
  Function(TapEvent)? onTap;
  Function(SavingGroupType)? onSavingGroupNavigate;

  EventConfig({
    this.onTap,
  });
}

enum TapEvent {
  createOpenSavingGroup,
  createClosedSavingGroup,
  history,
}

enum SavingGroupType {
  open,
  closed,
}
