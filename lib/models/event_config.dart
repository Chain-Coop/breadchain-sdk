class EventConfig {
  Function(TapEvent)? onTap;

  EventConfig({
    this.onTap,
  });
}

enum TapEvent {
  createSavingGroup,
  history,
}
