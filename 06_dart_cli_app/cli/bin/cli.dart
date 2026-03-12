import 'package:cli/cli.dart' as cli;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) async {
    var runner = CommandRunner()..addCommand(HelpCommand()); // Create an instance of your new CommandRunner
    await runner.run(arguments); // Call its run method, awaiting its Future<void>
}
