# URL Status Console Utility
Reads list of domains from csv file and outputs results of check.
Supports output to console or file in pretty or csv format.

## Usage
    git clone https://github.com/yanaizmene/url-status.git
    cd url-status && chmod +X bin/start && bundle
    bin/start sample-data/domains.csv
To get list of available options type `bin/start -h`

## TODO
- Boost check speed via concurrent requests implemented via fibers.
- Add ability to pass csv via STDIN instead of file for piping support
- Add ability to specify CSV options (column and row separators, quote character, etc)
- Add filtering functionality (display only available urls for example)
- Add sorting functionality (display unavailable urls at first)
- Code refactoring (remove dependencies?)
