import { workspace } from "vscode";

export const SYNAPSE_WORKSPACE_KEY = "synapse";

export function getSynapseWorkspaceConfig() {
  return workspace.getConfiguration(SYNAPSE_WORKSPACE_KEY);
}
