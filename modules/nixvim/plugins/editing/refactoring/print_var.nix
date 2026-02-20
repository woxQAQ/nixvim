{
  cpp = [
    "std::cout << \"%s: \" << %s << std::endl;"
    "fmt::print(\"{}: {}\\n\", \"%s\", %s);"
    "spdlog::debug(\"%s: {}\", %s);"
  ];
  c = [
    "printf(\"%s: %%d\\n\", %s);"
    "printf(\"%s: %%s\\n\", %s);"
    "fprintf(stderr, \"%s: %%p\\n\", %s);"
  ];
  go = [
    "fmt.Printf(\"%s: %%+v\\n\", %s)"
    "fmt.Printf(\"%s: %%#v\\n\", %s)"
    "log.Printf(\"%s: %%v\", %s)"
  ];
  rust = [
    "println!(\"%s: {:?}\", %s);"
    "println!(\"%s: {:#?}\", %s);"
    "dbg!(%s);"
    "eprintln!(\"%s: {:?}\", %s);"
  ];
  python = [
    "print(f\"%s: {%s}\")"
    "print(f\"%s: {%s!r}\")"
    "logging.debug(f\"%s: {%s}\")"
    "pprint.pprint({\"%s\": %s})"
  ];
  javascript = [
    "console.log('%s:', %s);"
    "console.debug('%s:', %s);"
    "console.log('%s:', JSON.stringify(%s, null, 2));"
  ];
  typescript = [
    "console.log('%s:', %s);"
    "console.debug('%s:', %s);"
    "console.log('%s:', JSON.stringify(%s, null, 2));"
  ];
  java = [
    "System.out.println(\"%s: \" + %s);"
    "logger.debug(\"%s: {}\", %s);"
    "System.out.printf(\"%s: %%s%%n\", %s);"
  ];
}
