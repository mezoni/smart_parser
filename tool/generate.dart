import '../example/generate_json_parser.dart' as generate_json_parser;
import '../example/generate_json_token_stream_parser.dart'
    as generate_json_token_stream_parser;
import '../example/generate_json_tokenizer.dart' as generate_json_tokenizer;
import 'generate_expressions_test.dart' as generate_test;
import 'generate_readme.dart' as generate_readme;

void main(List<String> args) {
  generate_test.main(args);
  generate_json_parser.main(args);
  generate_json_token_stream_parser.main(args);
  generate_json_tokenizer.main(args);
  generate_readme.main(args);
}
