#include <string>

namespace log_line {
std::string message(std::string line) {
    long unsigned int index{line.find(":")};
    return line.substr(index + 2);
}

std::string log_level(std::string line) {
    std::size_t open_bracket{line.find('[')};
    std::size_t close_bracket{line.find(']')};

    return line.substr(open_bracket + 1, close_bracket - 1);
}

std::string reformat(std::string line) {
    
    std::string reformat = log_line::message(line) + " (" + log_line::log_level(line) + ")";
    return reformat;
}
}  // namespace log_line
