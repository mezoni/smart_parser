## 1.0.2

- Minor changes have been made to the `tool\README.in.md` file.
- Minor improvement (in speed and size) to the code generated for error handling.
- The algorithm for generating the `README.md` file has been changed.

## 1.0.1

- Fixed a minor bug with the use of the reused value cache at the beginning of production parsing.
- Added the `final` type modifier to semantic value variable declarations when the type value is specified explicitly. According to this principle, all variables assigned during declaration must be immutable.
- Fixed typos in `tool\README.in.md` file.
- Minor improvement (in speed and size) to the code generated for error handling.

## 1.0.0

- A minor improvement has been made to the grammar file `example/json_parser.grammar`.
- Improved quality of generated code

## 1.0.0-beta.4

- Google changed the source code formatting algorithms in the new version of the Dart SDK. This is causing Google to downgrade the software's rating. To prevent Google from downgrading this software, additional formatting was performed. Apparently, everything will have to be reformatted endlessly after the release of each new version of the Dart SDK.

## 1.0.0-beta.3

- Fixed issues with Google's requirements for packages hosted on pub.dev to prevent this software from being rating downgrade.

## 1.0.0-beta.2

- Fixed a bug in a sequence expression with a single child expression. Added generation of restore and update procedures in the `accept` handler.

## 1.0.0-beta.1

- Initial release.
