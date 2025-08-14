const path = require("path");
process.env.SYNAPSE_DEVELOPMENT = true;

process.env.SYNAPSE_GLOBAL_DIR = path.join(
  process.env.PROJECT_DIR,
  "extensions",
  ".synapse-debug",
);

require("./out/index.js");
