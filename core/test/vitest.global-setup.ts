import fs from "fs";
import path from "path";

// Sets up the GLOBAL directory for testing - equivalent to ~/.synapse
// IMPORTANT: the SYNAPSE_GLOBAL_DIR environment variable is used in utils/paths for getting all local paths

process.env.SYNAPSE_GLOBAL_DIR = path.join(__dirname, ".synapse-test");
if (fs.existsSync(process.env.SYNAPSE_GLOBAL_DIR)) {
  fs.rmdirSync(process.env.SYNAPSE_GLOBAL_DIR, { recursive: true });
}
