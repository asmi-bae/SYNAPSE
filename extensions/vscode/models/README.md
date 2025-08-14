# Synapse Local Models Directory

This directory contains pre-trained AI models that enable Synapse to provide intelligent code assistance and embeddings generation entirely locally, without requiring internet connectivity or external API calls.

## 🏗️ Directory Structure

```
models/
├── README.md                           # This file
├── all-MiniLM-L6-v2/                  # Sentence transformers model for embeddings
│   ├── README.md                       # Model-specific documentation
│   ├── config.json                     # Model configuration
│   ├── tokenizer.json                  # Tokenizer vocabulary and rules
│   ├── tokenizer_config.json          # Tokenizer configuration
│   ├── vocab.txt                       # Vocabulary file
│   ├── special_tokens_map.json        # Special token mappings
│   └── onnx/                          # ONNX model files
│       └── model_quantized.onnx       # Quantized ONNX model (22MB)
```

## 🎯 Purpose

The models in this directory serve specific functions within Synapse:

### **all-MiniLM-L6-v2** - Local Embeddings Generation
- **Purpose**: Generate vector embeddings for code understanding and search
- **Usage**: Codebase indexing, semantic search, context retrieval
- **Technology**: Transformers.js with ONNX runtime
- **Model Type**: Sentence transformers (384-dimensional embeddings)
- **Size**: ~22MB (quantized for efficiency)

## 🚀 How It Works

### **Transformers.js Integration**
Synapse uses the [Transformers.js](https://huggingface.co/docs/transformers.js) library to run these models directly in the VS Code extension environment:

1. **Local Execution**: Models run entirely on your machine
2. **No Internet Required**: Once downloaded, works offline
3. **Privacy First**: Your code never leaves your machine
4. **Fast Performance**: ONNX-optimized inference

### **Embeddings Generation Process**
```typescript
// Simplified representation of how Synapse uses the model
const extractor = await pipeline("feature-extraction", "all-MiniLM-L6-v2");
const embeddings = await extractor(codeChunks, {
  pooling: "mean",
  normalize: true
});
```

## ⚙️ Configuration

### **Default Setup**
Synapse automatically uses these models when configured for local embeddings:

```yaml
# config.yaml
models:
  - name: local-embeddings
    provider: transformers.js
    roles: [embed]
```

### **Model Selection**
- **Automatic**: Synapse defaults to `transformers.js` for embeddings
- **Fallback**: If no embeddings provider specified, uses built-in model
- **IDE Support**: Currently VS Code only (JetBrains support planned)

## 🔧 Technical Details

### **Model Specifications**
- **Base Model**: [all-MiniLM-L6-v2](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2)
- **Architecture**: DistilBERT-based sentence transformers
- **Embedding Dimension**: 384
- **Quantization**: ONNX quantized for memory efficiency
- **Performance**: Optimized for code and text understanding

### **File Formats**
- **ONNX**: Open Neural Network Exchange format for cross-platform compatibility
- **JSON**: Configuration and tokenizer files
- **TXT**: Vocabulary and special tokens

### **Memory Requirements**
- **Model Size**: ~22MB (quantized)
- **Runtime Memory**: ~50-100MB during inference
- **Cache**: Embeddings cached in `~/.synapse/index/`

## 🚨 Limitations

### **Current Constraints**
- **VS Code Only**: Not available in JetBrains IDEs
- **Single Model**: Only embeddings model included
- **No Training**: Pre-trained models only, no fine-tuning

### **Performance Considerations**
- **First Run**: Initial model loading may take 5-10 seconds
- **Memory Usage**: Models loaded into extension process memory
- **CPU Usage**: Inference runs on main thread (may cause brief UI pauses)

## 🔄 Updates and Maintenance

### **Model Updates**
- Models are bundled with Synapse extension releases
- Updates occur with extension updates
- No automatic model downloads or updates

### **Version Compatibility**
- Models tested with specific Transformers.js versions
- ONNX runtime compatibility maintained
- Breaking changes documented in release notes

## 🛠️ Development

### **Adding New Models**
To add new local models to Synapse:

1. **Model Conversion**: Convert to ONNX format using [🤗 Optimum](https://huggingface.co/docs/optimum/index)
2. **Directory Structure**: Follow the existing pattern
3. **Integration**: Update `TransformersJsEmbeddingsProvider.ts`
4. **Testing**: Verify compatibility and performance

### **Model Optimization**
- **Quantization**: Use INT8 quantization for size reduction
- **Pruning**: Remove unnecessary model components
- **Format**: Ensure ONNX compatibility

## 📚 Additional Resources

### **Documentation**
- [Transformers.js Documentation](https://huggingface.co/docs/transformers.js)
- [ONNX Runtime](https://onnxruntime.ai/)
- [Sentence Transformers](https://www.sbert.net/)

### **Model Sources**
- [Hugging Face Hub](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2)
- [ONNX Model Zoo](https://github.com/onnx/models)

### **Community**
- [Synapse Discord](https://discord.gg/NWtdYexhMs)
- [GitHub Issues](https://github.com/synapsedev/synapse/issues)
- [Contributing Guide](https://github.com/synapsedev/synapse/blob/main/CONTRIBUTING.md)

## 🤝 Contributing

We welcome contributions to improve the local models:

- **Model Suggestions**: Recommend better models for specific tasks
- **Performance Improvements**: Optimize model loading and inference
- **Documentation**: Improve this README and related docs
- **Testing**: Help test models on different platforms

---

*This directory enables Synapse to provide intelligent, private, and offline-capable AI assistance for developers.*
