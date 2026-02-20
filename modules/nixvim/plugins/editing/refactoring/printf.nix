{
  cpp = [
    "std::cout << \"[DEBUG] %s\" << std::endl;"
    "fmt::print(\"[DEBUG] {}\\n\", \"%s\");"
    "spdlog::debug(\"%s\");"
  ];
  c = [
    "printf(\"[DEBUG] %s\\n\", \"%s\");"
    "fprintf(stderr, \"[DEBUG] %s\\n\", \"%s\");"
  ];
  go = [
    "fmt.Printf(\"[DEBUG] %s\\n\", \"%s\")"
    "log.Printf(\"[DEBUG] %s\", \"%s\")"
    "slog.Debug(\"%s\")"
  ];
  rust = [
    "println!(\"[DEBUG] {}\", \"%s\");"
    "eprintln!(\"[DEBUG] {}\", \"%s\");"
    "log::debug!(\"%s\");"
    "tracing::debug!(\"%s\");"
  ];
  python = [
    "print(f\"[DEBUG] %s\")"
    "logging.debug(\"%s\")"
    "logger.debug(\"%s\")"
  ];
  javascript = [
    "console.log('[DEBUG] %s');"
    "console.debug('[DEBUG] %s');"
    "logger.debug('%s');"
  ];
  typescript = [
    "console.log('[DEBUG] %s');"
    "console.debug('[DEBUG] %s');"
    "logger.debug('%s');"
  ];
  java = [
    "System.out.println(\"[DEBUG] %s\");"
    "logger.debug(\"%s\");"
    "log.debug(\"%s\");"
  ];
}
