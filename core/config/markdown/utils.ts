import {
    RULE_FILE_EXTENSION,
    sanitizeRuleName,
} from "@synapse/config-yaml";
import { joinPathsToUri } from "../../util/uri";

/**
 * Creates the file path for a rule in the workspace .synapse/rules directory
 */
export function createRuleFilePath(
  workspaceDir: string,
  ruleName: string,
): string {
  const safeRuleName = sanitizeRuleName(ruleName);
  return joinPathsToUri(
    workspaceDir,
    ".synapse",
    "rules",
    `${safeRuleName}.${RULE_FILE_EXTENSION}`,
  );
}
