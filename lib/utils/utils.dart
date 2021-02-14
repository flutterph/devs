extension CaseInsensitive on String {
  bool containsIgnoreCase(String other) {
    return this == null ? false : this.toLowerCase().contains(other.toLowerCase());
  }
}
