// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import * as bootstrap from "bootstrap";
import "./controllers";
import "./notice";

// consoleで使えるようにしておく
window.bootstrap = bootstrap;
