var config = <String, String>{};

void loadConfig(List<String> lines) {
  for (String line in lines) {
    line = line.trimLeft();
    if (line.startsWith("#") || line.startsWith("//")) continue;
    int ws = line.indexOf(" ");
    if (ws == line.length - 1) continue;
    config[line.substring(0, ws)] = line.substring(ws + 1);
  }
}
