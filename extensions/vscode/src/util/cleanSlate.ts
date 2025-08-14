import { ExtensionContext } from "vscode";

/**
 * Clear all Synapse-related artifacts to simulate a brand new user
 */
export function cleanSlate(context: ExtensionContext) {
  // Commented just to be safe
  // // Remove ~/.synapse
  // const synapsePath = getSynapseGlobalPath();
  // if (fs.existsSync(synapsePath)) {
  //   fs.rmSync(synapsePath, { recursive: true, force: true });
  // }
  // // Clear extension's globalState
  // context.globalState.keys().forEach((key) => {
  //   context.globalState.update(key, undefined);
  // });
}
