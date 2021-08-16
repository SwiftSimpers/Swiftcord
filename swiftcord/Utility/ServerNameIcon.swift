func getServerIconNamed(_ serverName: String) -> String {
  var iconName = ""
  for part in serverName.split(separator: " ") {
    if part.count > 0 {
      iconName += String(part[0])
    }
    if iconName.count > 2 { break }
  }
  return iconName
}
