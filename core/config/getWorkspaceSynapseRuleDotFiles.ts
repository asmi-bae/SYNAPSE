import { ConfigValidationError } from "@synapse/config-yaml";
import { IDE, RuleWithSource } from "..";
import { joinPathsToUri } from "../util/uri";
export const SYSTEM_PROMPT_DOT_FILE = ".synapserules";

export async function getWorkspaceSynapseRuleDotFiles(ide: IDE) {
  const dirs = await ide.getWorkspaceDirs();

  const errors: ConfigValidationError[] = [];
  const rules: RuleWithSource[] = [];
  for (const dir of dirs) {
    try {
      const dotFile = joinPathsToUri(dir, SYSTEM_PROMPT_DOT_FILE);
      const exists = await ide.fileExists(dotFile);
      if (exists) {
        const content = await ide.readFile(dotFile);
        rules.push({
          rule: content,
          ruleFile: dotFile,
          source: ".synapserules",
        });
      }
    } catch (e) {
      errors.push({
        fatal: false,
        message: `Failed to load system prompt dot file from workspace ${dir}: ${e instanceof Error ? e.message : e}`,
      });
    }
  }

  return { rules, errors };
}
