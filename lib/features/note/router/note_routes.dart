enum NoteRoutes {
  notes('/notes'),
  noteForm('/notes/form');

  final String path;
  const NoteRoutes(this.path);
}
