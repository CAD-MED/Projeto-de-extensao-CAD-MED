String truncateText(String text, {int maxLength = 30}) {
  if (text.length > maxLength) {
    return text.substring(0, maxLength) + '...';
  }
  return text;
}
