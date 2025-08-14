# @synapse/sdk

> **⚠️ EXPERIMENTAL: This package is in early development and subject to frequent breaking changes without notice.**

This SDK provides a drop-in replacement for OpenAI libraries to easily integrate with Synapse assistants.

## Installation

```bash
npm install @synapse/sdk
```

## Usage

The SDK provides a `Synapse.from()` method that initializes an assistant and returns a client you can use as a drop-in replacement for the OpenAI SDK:

```typescript
import { Synapse } from "@synapse/sdk";

// Initialize the Synapse client with your API key and assistant
const { client, assistant } = await Synapse.from({
  apiKey: process.env.SYNAPSE_API_KEY,
  assistant: "owner-slug/assistant-slug", // The assistant identifier
});

// Use the client just like the OpenAI SDK
const response = await client.chat.completions.create({
  model: assistant.getModel("claude-3-7-sonnet-latest"), // Use the assistant's model
  messages: [
    { role: "system", content: assistant.systemMessage }, // Use the assistant's system message
    { role: "user", content: "Hello!" },
  ],
});

console.log(response.choices[0].message.content);
```

You can also use the SDK without specifying an assistant to just get the Continue API client:

```typescript
import { Synapse } from "@synapse/sdk";

// Initialize just the Synapse API client
const { api } = await Synapse.from({
  apiKey: process.env.SYNAPSE_API_KEY,
});

// Make calls to the Synapse API
const assistants = await api.listAssistants({});
```

## API Reference

### Synapse.from(options)

Creates a Synapse instance with a pre-configured OpenAI client and assistant.

#### Options

- `apiKey` (string, required): Your Synapse API key
- `assistant` (string, optional): The assistant identifier in the format `owner-slug/assistant-slug`
- `organizationId` (string, optional): Optional organization ID
- `baseURL` (string, optional): Base URL for the Synapse API (defaults to `https://api.synapse.dev/`)

#### Returns

When `assistant` is provided, returns an object containing:

- `api`: The Synapse API client for direct API access
- `client`: An OpenAI-compatible client configured to use the Synapse API
- `assistant`: The assistant configuration with utility methods

When assistant is not provided, returns an object containing:

- `api`: The Synapse API client for direct API access
