import 'package:rbws/rbws.dart';
import 'dart:io';

import 'config.dart';

void main(List<String> args) {
  // Get config file
  if (!File("/etc/rbws-frykman.dev.cfg").existsSync()) {
    stderr.writeln("/etc/rbws-frykman.dev.cfg does not exist.");
    exit(256);
  }

  loadConfig(File("/etc/rbws-frykman.dev.cfg").readAsLinesSync());

  if (!Directory("frykman.dev").existsSync()) {
    stderr.writeln("The web root at './frykman.dev' does not exist.");
    exit(256);
  }

  final host = config["BindAddress"] ?? "";
  final port = int.tryParse(config["BindPort"] ?? "");

  if (host.isEmpty || port == null) {
    stderr.writeln(
        "Please provide a valid BindAddress and BindPort in the config.");
    exit(257);
  }

  var server = HTTPServerInstance(host, port, generalServeRoot: "frykman.dev");
  server.start();
}
